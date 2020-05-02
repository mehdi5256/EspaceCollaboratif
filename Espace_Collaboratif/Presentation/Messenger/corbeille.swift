//
////
////  ViewController.swift
////  chatui
////
////  Created by mehdi drira on 3/10/20.
////  Copyright © 2020 mehdi drira. All rights reserved.
////
//
//import UIKit
//import JitsiMeet
//import SwiftyJSON
//import Alamofire
//
//
//class ViewController: UIViewController{
//    
//    
//
//    
//    
//    
//    
//   
//
//    
//   
//
//
//    
//
//    //debut chat
//
//    var words = [String: Word]()
//     var eventBus:EventBus!
//     var data:[String] = []
//     var usernamecell = ""
//    var imgcell = ""
//
//    var messages: [MessageChat] = []
//    //fin chat
//
//    //persist chat
//
//   
//    
//    
//    
//   
//    
//        override func viewDidLoad() {
//        super.viewDidLoad()
//        //bar send msg
//        scrolltobottom(animated: false)
//
//        
//        message.delegate = self
//        design()
//            
//        btnlastrow.roundCorners([.topLeft, .bottomLeft] , radius: 8)
//
//        // END
//        
//        
//        
//        // Do any additional setup after loading the view.
//        
//
//
//      //  print(idroom!)
//        navigationController?.navigationBar.tintColor = .white
//
//        // logged user
//        fetchmsgs()
//
////        stackbg.layer.cornerRadius = 10
////  viewtxtfild.layer.cornerRadius = 10
//
//
//                  
//
//
//
//             eventBus = EventBus(host: eventbusURL, port: portNumber)
//               eventBus.register(errorHandler: { print($0) })
//               do {
//                  try eventBus.connect()
//                   //try! eventBus.send(to: "chat.to.server", body: [ "word":"aziz","body": "hello"])
//               } catch let error {
//                   print("Failed to connect to the event bus bridge; is it running? \(error)")
//                   exit(1)
//               }
//
//               let _ = try! eventBus.register(address: "chat.to.client") {
//
//                if ($0.body["room_id"].intValue == self.idroom!){
//                    let msgs: msgtest!
//
//                    msgs = msgtest(body: $0.body["body"].description, file: $0.body["file"].description, id: nil ,timestamp: nil,usert: $0.body["user"].description, type: $0.body["type"].description, user: User1(id: self.iddd, firstName: $0.body["user"].description, lastName: "", email: self.emaaail, image: $0.body["user_img"].description, rooms:[]))
//                                           print($0.body[])
//                    
////                    msgs = msgtest(body: $0.body["body"].description, file: $0.body["file"].description,id:nil, timestamp: nil ,usert: $0.body["user"].description, userimg : $0.body["user_img"].description, type: $0.body["type"].description )
////
//                                          print($0.body[])
//                    do{
//                    DispatchQueue.main.async {
//
//                        self.msgarray.append(msgs)
//
//                    self.tv.reloadData()
//                    self.scrolltobottom(animated: true)
//
//
//
//                            }
//
//                                   }catch{
//
//                                   }
//                }
//
//               }
//           }
//
//           
//   
//
//
