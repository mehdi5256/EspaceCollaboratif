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
    var idroom:Int!

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
    
    
    //debut user logged
    var Userlogged: User1!
    let userservice = UserService()
    
    let fn = UserDefaultService.firstNameUD
    let ln = UserDefaultService.lasttNameUD
    let id = UserDefaultService.idUD
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

  /*  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return 11

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
          guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ChatTableViewCell
                               else{
                                   return UITableViewCell()
                           }
        
        return cell
        
    }
    */
   

    
    
    @IBOutlet weak var viewtxtfild: UIView!
    @IBOutlet weak var stackbg: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print(idroom!)
        navigationController?.navigationBar.tintColor = .white

        // logged user
        
        
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
                
                if ($0.body["room_id"].intValue == self.idroom!){
                    
                    
                    let obj = $0.body["body"].description
                    let msgs: MessageChat!
                    msgs = MessageChat(nomuser: $0.body["user"].description, imageuser: $0.body["user_img"].description, messages: $0.body["body"].description)
                    do{
                    DispatchQueue.main.async {
                        
                     
                                           
                    //print(obj)
                        self.messages.append(msgs)
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
        
        
        
        try! eventBus.send(to: "chat.to.server", body: ["type":"send","address":"chat.to.server","headers":[],"user":fn + " " + ln,"user_img":photoprofil,"room_id":idroom!,"body":message.text! ])
              message.text = ""
        
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
        return messages.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ChatTableViewCell
                         else{
                             return ChatTableViewCell()
      
        }
        cell.usernamelbl.text = self.messages[indexPath.row].nomuser
        cell.msgtxt.text = self.messages[indexPath.row].messages
        let image = messages[indexPath.row].imageuser
        cell.imguser.af.setImage(withURL: URL(string: image)!)


        /* if (cell.labeluser.text == user){
            
            
                       //cell.bibl.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
            cell.stc.alignment = .trailing

                       
        }
        else {
            
         
            
            cell.bibl.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            cell.stc.alignment = .leading


            
        }*/
        return cell

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
