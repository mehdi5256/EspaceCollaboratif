//
//  ChatPersist.swift
//  EspaceCollaboratif
//
//  Created by mehdi on 4/14/20.
//  Copyright © 2020 mehdi drira. All rights reserved.
//

import Foundation
import Alamofire

class ChatPersist: NSObject{
    
    func getAllMsgs(completion: @escaping ([msgtest]) -> Void) {
        AF.request(persisturl).responseJSON{
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
}
