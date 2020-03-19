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




class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var message: UITextField!
    
    @IBOutlet weak var tv: UITableView!
    var name:String?
    // debut jitsi
    
    fileprivate var pipViewCoordinator: PiPViewCoordinator?
    fileprivate var jitsiMeetView: JitsiMeetView?
    //fin jitsi
    
    //debut chat
    
    var words = [String: Word]()
     var eventBus:EventBus!
     var data:[[String : Any]] = []
     var user = "mehdi"
     
    //fin chat
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return 11

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
          guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ChatTableViewCell
                               else{
                                   return UITableViewCell()
                           }
        
        return cell
        
    }
    
   

    
    
    @IBOutlet weak var viewtxtfild: UIView!
    @IBOutlet weak var stackbg: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        stackbg.layer.cornerRadius = 10
        viewtxtfild.layer.cornerRadius = 10

               
              // message.layer.cornerRadius = 10
                   NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
                   NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
              
               
               
       /*        eventBus = EventBus(host: "192.168.2.9", port: 7000)
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
                   print($0.body["body"])
                   let obj = $0.body["body"].description
                   let data = Data(obj.utf8)
                   print(data)
                   do{
                       if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]{
                           DispatchQueue.main.async {
                              // self.chat.text.append(obj)
                               print(json)
                               self.data.append(json)
                            //   self.tv.reloadData()

                           }
                       }
                   }catch let err as NSError{
                       print(err.description)
                   }
                   
                   
               
               }
               
*/

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
                         builder.serverURL = (URL(string: "https://mobile-int.accretio.io:8443/"))
                        builder.room = self.name
                      
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
        
        try! eventBus.send(to: "chat.to.server", body: [ "user":"aziz","body":("{\"user\":\"" + self.user + "\",\"body\":\"" + message.text! + "\"}") ])
              message.text = ""
       }
    
    
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


/*
extension ViewController:UITableViewDataSource,UITableViewDelegate{
  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ChatTableViewCell
                         else{
                             return UITableViewCell()
                     }
      //  let contentview = cell.viewWithTag(0)
      //  let chat = cell.txtmsg
       // let userLabel = contentview?.viewWithTag(2) as! UILabel
        cell.aaaaa.text = self.data[indexPath.row]["body"] as! String
        cell.userlablbubble.text = self.data[indexPath.row]["user"] as! String

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

*/

extension ViewController:UITextFieldDelegate{
    
    @IBAction func Dismiss(_ sender: UITapGestureRecognizer) {
        message.resignFirstResponder()
     }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
