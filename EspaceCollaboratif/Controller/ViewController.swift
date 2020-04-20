
//
//  ViewController.swift
//  chatui
//
//  Created by mehdi drira on 3/10/20.
//  Copyright © 2020 mehdi drira. All rights reserved.
//

import UIKit
import JitsiMeet
import SwiftyJSON
import Alamofire


class ViewController: UIViewController{
    
    
//outlets
    @IBOutlet weak var emptytvimg: UIImageView!
    
    @IBOutlet weak var message: UITextView!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var BtnSideUp: UIButton!
    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var tv: UITableView!
    @IBOutlet weak var viewtxtfild: UIView!
    @IBOutlet weak var stackbg: UIView!
    
    @IBOutlet weak var btnlastrow: UIButton!
    
   // @IBOutlet weak var emptyimg: UIImageView!
    
    
    var nomroom:String?
    var idroom:Int!
    
    let messageTextViewMaxHeight: CGFloat = 100

    
    //  open gallery
    var imagePicker = UIImagePickerController()


    // debut jitsi

    fileprivate var pipViewCoordinator: PiPViewCoordinator?
    fileprivate var jitsiMeetView: JitsiMeetView?
    //fin jitsi

    //debut chat

    var words = [String: Word]()
     var eventBus:EventBus!
     var data:[String] = []
     var usernamecell = ""
    var imgcell = ""

    var messages: [MessageChat] = []
    //fin chat

    //persist chat

     var msgarray:[msgtest] = []
    let persistservice = ChatPersist()

    //debut user logged
    var Userlogged: User1!
    let userservice = UserService()

    let fn = UserDefaultService.firstNameUD
    let ln = UserDefaultService.lasttNameUD
    let iddd = UserDefaultService.idUD
    let emaaail = UserDefaultService.emailUD
    let photoprofil = UserDefaultService.IMGUD
    
    
    
    override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(animated)
           scrolltobottom(animated: false)
           
       }
    
        override func viewDidLoad() {
        super.viewDidLoad()
        //bar send msg
        scrolltobottom(animated: false)

        
        message.delegate = self
        design()
            
        btnlastrow.roundCorners([.topLeft, .bottomLeft] , radius: 8)

        // END
        
        
        
        // Do any additional setup after loading the view.
        
        imagePicker.delegate = self


      //  print(idroom!)
        navigationController?.navigationBar.tintColor = .white

        // logged user
        fetchmsgs()

//        stackbg.layer.cornerRadius = 10
//  viewtxtfild.layer.cornerRadius = 10


                   NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
                   NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)



             eventBus = EventBus(host: eventbusURL, port: portNumber)
               eventBus.register(errorHandler: { print($0) })
               do {
                  try eventBus.connect()
                   //try! eventBus.send(to: "chat.to.server", body: [ "word":"aziz","body": "hello"])
               } catch let error {
                   print("Failed to connect to the event bus bridge; is it running? \(error)")
                   exit(1)
               }

               let _ = try! eventBus.register(address: "chat.to.client") {

                if ($0.body["room_id"].intValue == self.idroom!){
                    let msgs: msgtest!

                    msgs = msgtest(body: $0.body["body"].description, file: $0.body["file"].description, id: nil ,timestamp: nil,usert: $0.body["user"].description, type: $0.body["type"].description, user: User1(id: self.iddd, firstName: $0.body["user"].description, lastName: self.ln, email: self.emaaail, image: $0.body["user_img"].description, rooms:[]))
                                           print($0.body[])
                    
//                    msgs = msgtest(body: $0.body["body"].description, file: $0.body["file"].description,id:nil, timestamp: nil ,usert: $0.body["user"].description, userimg : $0.body["user_img"].description, type: $0.body["type"].description )
//
                                          print($0.body[])
                    do{
                    DispatchQueue.main.async {

                        self.msgarray.append(msgs)

                    self.tv.reloadData()
                    self.scrolltobottom(animated: true)



                            }

                                   }catch{

                                   }
                }

               }
           }

           
    @IBAction func BtnLastrowAction(_ sender: UIButton) {
        scrolltobottom(animated: true)
    }
    
    

    func getAllMsgs(completion: @escaping ([msgtest]) -> Void) {
           AF.request("http://8394dc06.ngrok.io/msg/room/" + String(idroom!)).responseJSON{
                      response in
             //  print(response)
                   let persistmsgarray = (response.value as! NSArray)
               var msgspersist: [msgtest] = []
               do{
                   msgspersist = try JSONDecoder().decode([msgtest].self, from: try! JSONSerialization.data(withJSONObject: persistmsgarray))
               } catch let error as NSError {
                   print("Failed to load: \(error.description)")
               }
               completion(msgspersist)
              print(msgspersist)
           }
       }
    func fetchmsgs(){
        getAllMsgs(){ (mmm) in
            self.msgarray = mmm
          print(self.msgarray)
           self.tv.reloadData()

        }
    }
   }




extension ViewController{

    @IBAction func Send(_ sender: Any) {

        if  (message.text != ""){
            try! eventBus.send(to: "chat.to.server", body: ["type":"TEXT","address":"chat.to.server","headers":[],"body":message.text!,"file":"","user":fn + " " + ln,"user_img":photoprofil,"room_id":self.idroom!])
            
                   let parameters: [String: Any] = [
                       "body":message.text!,
                       "type":"TEXT",
                       "file":"",
                       "room":["id":self.idroom],
                       "user":["id":iddd]

                   ]
                AF.request("http://8394dc06.ngrok.io/msg", method: .post, parameters: parameters,encoding: JSONEncoding.init())
                   .responseJSON { response in
                       print(response.request)
                       print(response.response)
                       print(response.result)}
            scrolltobottom(animated: true)
        //vider textfields
            designbuttonaftersend()
        }
    }
    
   
}



extension ViewController:UITextFieldDelegate{

    @IBAction func Dismiss(_ sender: UITapGestureRecognizer) {
        message.resignFirstResponder()
     }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}



// Open gallery and upload image , file ,
extension ViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
   
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

             // The info dictionary may contain multiple representations of the image. You want to use the original.
             guard let selectedImage = info[.originalImage] as? UIImage else {
                 fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
             }
       convertImageToBase64(selectedImage)
             // Set photoImageView to display the selected image.
           //  imgv.image = selectedImage

             // Dismiss the picker.
             dismiss(animated: true, completion: nil)
         }
    
    @IBAction func OpenSideUpMeny(_ sender: Any) {
        actionSheet()
       }
    
    func actionSheet() {
           let sheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

            let gallery = UIAlertAction(title: "Bibliothéque Photo", style: .default) { (gallery) in
                // gallery Code

                            let imagecontrooler = UIImagePickerController()
                                            imagecontrooler.delegate = self
                                            imagecontrooler.sourceType = .photoLibrary
                
                
                
                                            self.present(self.imagePicker
                                                , animated: true
                                                , completion: nil)

            }
        
            gallery.setValue(0, forKey: "titleTextAlignment")
            gallery.setValue(UIColor.black, forKey: "titleTextColor")


            gallery.setValue(UIImage(systemName: "photo"), forKey: "image")
            sheet.addAction(gallery)
            

            let camera = UIAlertAction(title: "Caméra", style: .default) { (camera) in
                // Facebook Code
            }
            camera.setValue(0, forKey: "titleTextAlignment")
            camera.setValue(UIImage(systemName: "camera"), forKey: "image")
            camera.setValue(UIColor.black, forKey: "titleTextColor")

            sheet.addAction(camera)


            let doc = UIAlertAction(title: "Document", style: .default) { (doc) in
                // Instagram Code
            }
            doc.setValue(0, forKey: "titleTextAlignment")
            doc.setValue(UIImage(systemName: "doc"), forKey: "image")
            doc.setValue(UIColor.black, forKey: "titleTextColor")

            sheet.addAction(doc)

            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            sheet.addAction(cancel)
            
           // sheet.view.backgroundColor = .white

            present(sheet, animated: true, completion: nil)
        }
    
    
               
               func convertImageToBase64(_ image: UIImage) -> String {
                   let imageData:NSData = image.jpegData(compressionQuality: 0.4)! as NSData
                      let strBase64 = imageData.base64EncodedString(options: .lineLength64Characters)
                 //  print(strBase64)
                

            
                
                
                 try! eventBus.send(to: "chat.to.server", body: ["type":"IMAGE","address":"chat.to.server","headers":[],"body":"","file":strBase64,"user":fn + " " + ln,"user_img":photoprofil,"room_id":self.idroom!])
               
                
                let parameters: [String: Any] = [
                "type":"IMAGE",
                "body":"",
                "user":["id":iddd],
                "room":["id":self.idroom],
                "file":strBase64
                ]
                               AF.request("http://8394dc06.ngrok.io/msg", method: .post, parameters: parameters,encoding: JSONEncoding.init())
                                  .responseJSON { response in
                                      print(response.request)
                                      print(response.response)
                                      print(response.result)}
                       //vider textfields
                      // message.text = ""
//
//
                
                
                   return strBase64

               }
    
               
//               func convertBase64ToImage(_ str: String) -> UIImage {
//                       let dataDecoded : Data = Data(base64Encoded: str, options: .ignoreUnknownCharacters)!
//                       let decodedimage = UIImage(data: dataDecoded)
//                   print(decodedimage)
//
//                       return decodedimage!
//               }
    
    
    func convertUTCDateToLocalDate(dateToConvert:String) -> String {
        
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z[UTC]'"
        let convertedDate = format.date(from: dateToConvert)
        format.timeZone = TimeZone.current
        format.dateFormat = "HH:ss"
        let localDateStr = format.string(from: convertedDate!)
        return localDateStr
    }
             
    }





///////// Extension mta3 bar elli tab3th beha l msg

extension ViewController: UITextViewDelegate{


    func textViewDidChange(_ textView: UITextView)
    {
        if Whitespace(textView: message){
            btn.backgroundColor = UIColor.systemBlue

        }
        else{
           btn.backgroundColor = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)
        }
        
        if textView == self.message {
            self.btn.isEnabled = Whitespace(textView: message)
        }
        
        if textView.contentSize.height >= self.messageTextViewMaxHeight
        {
            textView.isScrollEnabled = true
        }
        else
            {
            textView.frame.size.height = textView.contentSize.height
                textView.isScrollEnabled = false
                
        }
    }

    //Configuration design textview mta3 chat
    func design(){
        message.layer.cornerRadius = 10
        message.layer.cornerRadius = 10
        message.layer.borderWidth = 1
        message.layer.borderColor = #colorLiteral(red: 0.4948643718, green: 0.4948643718, blue: 0.4948643718, alpha: 1)
        btn.layer.cornerRadius = 15

        }
    
    func designbuttonaftersend(){
        message.text = ""
        btn.backgroundColor = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)
        btn.isEnabled = false
        
    }
    
    // Configuration tableview show the last item
       func scrolltobottom(animated:Bool){
                  let numberOfSections = self.tv.numberOfSections
                  let numberOfRows = self.tv.numberOfRows(inSection: numberOfSections-1)

                  let indexPath = IndexPath(row: numberOfRows-1 , section: numberOfSections-1)
        if msgarray.count > 0{
            self.tv.scrollToRow(at: indexPath, at: UITableView.ScrollPosition.middle, animated: animated)
            }
            
        }

    // Fonction white space elimination
func Whitespace(textView textView: UITextView) -> Bool {
    guard let text = textView.text,
        !text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).isEmpty else {
        // this will be reached if the text is nil (unlikely)
        // or if the text only contains white spaces
        // or no text at all
        return false
    }

    return true
}
    
    // l baar mta3  msg tatl3 w tahbet ki tselectionni l msg
    @objc func keyboardWillShow(notification: NSNotification) {
           if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
               if self.view.frame.origin.y == 0 {
                   self.view.frame.origin.y -= keyboardSize.height
               }
           }
       }

       @objc func keyboardWillHide(notification: NSNotification) {
           if self.view.frame.origin.y != 0 {
               self.view.frame.origin.y = 0
           }
       }
}

   // extension table view mta3 l chat configuration des 4 cellules

extension ViewController:UITableViewDataSource,UITableViewDelegate{

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
                if ( indexPath.row == msgarray.count - 1)
          {
              print("came to last row")
                  btnlastrow.isHidden = true
          }
        
          if ( indexPath.row != msgarray.count - 1)
          {
              btnlastrow.isHidden = false


              
          }

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if  msgarray.count == 0
               {
                   tv.isHidden = true
                   emptytvimg.isHidden = false
      }
               else{
                  tv.isHidden = false
                   emptytvimg.isHidden = true
                   
               }
        return  msgarray.count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let celltextother = tableView.dequeueReusableCell(withIdentifier: "celltextother", for: indexPath) as? CellTextOther
                         else{
                             return CellTextOther()

        }
        guard let celltextme = tableView.dequeueReusableCell(withIdentifier: "celltextme", for: indexPath) as? CellTextMe
                           else{
                               return CellTextMe()

          }
        
        guard let cellimageother = tableView.dequeueReusableCell(withIdentifier: "cellimageother", for: indexPath) as? CellImageOther
                                  else{
                                      return CellImageOther()

                 }
        
        guard let cellimageme = tableView.dequeueReusableCell(withIdentifier: "cellimgme", for: indexPath) as? CellimageMe
                         else{
                             return CellimageMe()

        }
        
        

        if (self.msgarray[indexPath.row].type == "IMAGE" && self.msgarray[indexPath.row].user.image == photoprofil ){
                   
            cellimageme.usernamelbl.text = self.msgarray[indexPath.row].user.firstName + " " + self.msgarray[indexPath.row].user.lastName
                                //cell3.msgtxt.text = self.msgarray[indexPath.row].body
                                let image = msgarray[indexPath.row].user.image
                                cellimageme.imguser.af.setImage(withURL: URL(string: image)!)
                              
                              let imagechat = msgarray[indexPath.row].file
                              cellimageme.imagechat.af.setImage(withURL: URL(string: imagechat!)!)
                                                      
                                return cellimageme
                   
               }

               
               if (self.msgarray[indexPath.row].type == "IMAGE"){
                   
                   

                     cellimageother.usernamelbl.text = self.msgarray[indexPath.row].user.firstName + " " + self.msgarray[indexPath.row].user.lastName
                     //cell3.msgtxt.text = self.msgarray[indexPath.row].body
                     let image = msgarray[indexPath.row].user.image
                     cellimageother.imguser.af.setImage(withURL: URL(string: image)!)
                   
                   let imagechat = msgarray[indexPath.row].file
                   cellimageother.imgsend.af.setImage(withURL: URL(string: imagechat!)!)
                                           
                     return cellimageother
               }
               
        if (self.msgarray[indexPath.row].user.image  == photoprofil){

                   celltextme.usernamelbl.text = self.msgarray[indexPath.row].user.firstName + " " + self.msgarray[indexPath.row].user.lastName
                   celltextme.msgtxt.text = self.msgarray[indexPath.row].body
                   let image = msgarray[indexPath.row].user.image
                   celltextme.imguser.af.setImage(withURL: URL(string: image)!)
                                         
                   return celltextme
             }
               else {
                       celltextother.usernamelbl.text = self.msgarray[indexPath.row].user.firstName + " " + self.msgarray[indexPath.row].user.lastName
                       celltextother.msgtxt.text = self.msgarray[indexPath.row].body
                       let image = msgarray[indexPath.row].user.image
                       celltextother.imguser.af.setImage(withURL: URL(string: image)!)
                   
                       return celltextother
                           }
                   }
}


//// extension jitsi configuration jitsi

extension ViewController: JitsiMeetViewDelegate {



  @IBAction func JitsiCall(_ sender: Any) {

      cleanUp()
    // create and configure jitsimeet view
                     let jitsiMeetView = JitsiMeetView()
                     jitsiMeetView.delegate = self
                     self.jitsiMeetView = jitsiMeetView
                     let options = JitsiMeetConferenceOptions.fromBuilder { (builder) in
                     builder.welcomePageEnabled = true

                         builder.welcomePageEnabled = false
                         builder.serverURL = (URL(string: jitsiURL))
                        builder.room = self.nomroom

                      self.navigationController?.isNavigationBarHidden = true
                     }
                     jitsiMeetView.join(options)

                     // Enable jitsimeet view to be a view that can be displayed
                     // on top of all the things, and let the coordinator to manage
                     // the view state and interactions
                     pipViewCoordinator = PiPViewCoordinator(withView: jitsiMeetView)
                     pipViewCoordinator?.configureAsStickyView(withParentView: view)

                     // animate in
                     jitsiMeetView.alpha = 0
                     pipViewCoordinator?.show()

  }

  fileprivate func cleanUp() {
    self.navigationController?.isNavigationBarHidden = false
      jitsiMeetView?.removeFromSuperview()
      jitsiMeetView = nil
      pipViewCoordinator = nil

  }

  func conferenceTerminated(_ data: [AnyHashable : Any]!) {
      DispatchQueue.main.async {
          self.pipViewCoordinator?.hide() { _ in
              self.cleanUp()
          }
      }
  }

  func enterPicture(inPicture data: [AnyHashable : Any]!) {
      DispatchQueue.main.async {
          self.pipViewCoordinator?.enterPictureInPicture()
      }
  }
    func reverse(_ str: String) -> String {
        return String(str.reversed())
    }

    override func viewWillTransition(to size: CGSize,
                                     with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        let rect = CGRect(origin: CGPoint.zero, size: size)
        pipViewCoordinator?.resetBounds(bounds: rect)
    }

}
