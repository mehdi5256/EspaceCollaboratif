
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




class ViewController: UIViewController {
    @IBOutlet weak var message: UITextField!

    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var tv: UITableView!
    var nomroom:String?
     static var idroom:Int!

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



 /*   func fetchUserLogged(){
           userservice.getUserLogged{ (userloggg) in
               self.Userlogged = userloggg
           print (self.Userlogged)
               self.tv.reloadData()

           }
       }
 */








    @IBOutlet weak var viewtxtfild: UIView!
    @IBOutlet weak var stackbg: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

      //  print(idroom!)
        navigationController?.navigationBar.tintColor = .white

        // logged user
        fetchmsgs()

      //  fetchUserLogged()

       /* let udd = UserDefaults.standard.string(forKey: "ud")
        print(udd)
        */

        //end logged user


        stackbg.layer.cornerRadius = 10
        viewtxtfild.layer.cornerRadius = 10


              // message.layer.cornerRadius = 10
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

               // register a listener to reverse words, sending the result back on a different address
              /* let _ = try! eventBus.register(address: "chat.to.client") {
                   print($0.body["word"].string)
                   if let word = $0.body["word"].string {
                       do {
                           try! eventBus.send(to: "chat.to.server", body: ["word": "aziz", "reversed": "hello"])
                       } catch let error {
                           print("Failed to send to the eventBus: \(error)")
                       }
                   }
               }
                */
               // register a listener to store the reversed words
               let _ = try! eventBus.register(address: "chat.to.client") {

                if ($0.body["room_id"].intValue == ViewController.idroom!){


                    let obj = $0.body["body"].description
                   // let msgs: MessageChat!
                    let msgs: msgtest!

                    msgs = msgtest(body: $0.body["body"].description, file: nil, id: nil ,timestamp: nil, type: "TEXT", user: User1(id: self.iddd, firstName: self.fn, lastName: self.ln, email: self.emaaail, image: self.photoprofil, rooms:[]))

           //  msgs = MessageChat(nomuser: $0.body["user"].description, imageuser: $0.body["user_img"].description, messages: $0.body["body"].description)

                    print($0.body[])

                    do{
                    DispatchQueue.main.async {



                    //print(obj)
                        //    self.messages.append(msgs)
                        self.msgarray.append(msgs)

                    self.tv.reloadData()


                            }

                                   }catch{

                                   }

                }





              /*  self.usernamecell = ($0.body["user"].description)
                self.imgcell = ($0.body["user_img"].description)

                print($0.body["user"])
                print($0.body["user_img"])


                   */

               }


               // Do any additional setup after loading the view.
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


    func fetchmsgs(){
        persistservice.getAllMsgs(){ (mmm) in
            self.msgarray = mmm
          print(self.msgarray)
           self.tv.reloadData()

        }
    }




    }









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

}

extension ViewController{

    @IBAction func Send(_ sender: Any) {

        if  (message.text != ""){
            try! eventBus.send(to: "chat.to.server", body: ["type":"TEXT","address":"chat.to.server","headers":[],"body":message.text!,"file":"","user":fn + " " + ln,"user_img":photoprofil,"room_id":ViewController.idroom!])

            let parameters: [String: Any] = [
                       "body":message.text!,
                       "type":"TEXT",
                       "room":["id":ViewController.idroom],
                       "user":["id":iddd]

                   ]




                   AF.request("http://61b75529.ngrok.io/msg", method: .post, parameters: parameters,encoding: JSONEncoding.init())
                   .responseJSON { response in
                       print(response.request)
                       print(response.response)
                       print(response.result)




                   }

          //vider textfields
        message.text = ""

        }



    }

 /*   try! eventBus.send(to: "chat.to.server", body: [ "user":"aziz","body":("{\"user\":\"" + self.user + "\",\"body\":\"" + message.text! + "\"}") ])
    message.text = ""
    */

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


extension ViewController:UITableViewDataSource,UITableViewDelegate{


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return messages.count
        return  msgarray.count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ChatTableViewCell
                         else{
                             return ChatTableViewCell()

        }
        guard let cell3 = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as? ChatReceptionTableViewCell
                           else{
                               return ChatReceptionTableViewCell()

          }

//        if (self.messages[indexPath.row].nomuser == fn + " " + ln ){
        if (self.msgarray[indexPath.row].user.firstName == fn){


//           cell3.usernamelbl.text = self.messages[indexPath.row].nomuser
//                      cell3.msgtxt.text = self.messages[indexPath.row].messages
//                      let image = messages[indexPath.row].imageuser
//                      cell3.imguser.af.setImage(withURL: URL(string: image)!)
//                      return cell3

            cell3.usernamelbl.text = self.msgarray[indexPath.row].user.firstName
                                  cell3.msgtxt.text = self.msgarray[indexPath.row].body
                                let image = msgarray[indexPath.row].user.image
                                  cell3.imguser.af.setImage(withURL: URL(string: image)!)
                                  return cell3



        }
        else {


//            cell.usernamelbl.text = self.messages[indexPath.row].nomuser
//                       cell.msgtxt.text = self.messages[indexPath.row].messages
//                       let image = messages[indexPath.row].imageuser
//                       cell.imguser.af.setImage(withURL: URL(string: image)!)
//                       return cell

            cell.usernamelbl.text = self.msgarray[indexPath.row].user.firstName
                                             cell.msgtxt.text = self.msgarray[indexPath.row].body
                                           let image = msgarray[indexPath.row].user.image
                                             cell.imguser.af.setImage(withURL: URL(string: image)!)
                                             return cell




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

