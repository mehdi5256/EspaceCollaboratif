//
//  AddRoomViewController.swift
//  EspaceCollaboratif
//
//  Created by mehdi on 3/19/20.
//  Copyright © 2020 mehdi drira. All rights reserved.
//

import UIKit
import Alamofire

class AddRoomViewController: UIViewController {
    
    @IBOutlet weak var Subject: UITextField!
    @IBOutlet weak var RoomName: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    @IBAction func CreateRoom(_ sender: Any) {
        
        let myUrl = "http://1193a49a.ngrok.io/room";
        
        let nomroom = RoomName.text;
               let description = Subject.text;
        
        let parameters: Parameters=[
            "name":nomroom!,
            "subject":description!,
            
        ]
       

        AF.request(myUrl, method: .post, parameters: parameters).responseJSON
        {
            response in
            //printing response
            print(response)
            //getting the json value from the server
                           if let result = response.value {
                               
                               //converting it as NSDictionary
                               let jsonData = result as! NSDictionary
                               let responsetype = jsonData.value(forKey: "error") as! Bool;
                                if (responsetype ){
                                 //  self.lblmsg.text = "Adresse mail existe déjà!";
                                    
                                    print("nonononoono")

                               }
                               
                               
                               if (!responsetype ){
                                DispatchQueue.main.async {
                                    print("okookokokok")

                                }
                            }


       }
            
        }
    }

    

   
   
    
    @IBAction func DismissKeyboard(_ sender: UITapGestureRecognizer) {
        Subject.resignFirstResponder()
        RoomName.resignFirstResponder()
    }
    
    @IBAction func BackButton(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
       }
}
