//
//  TopicService.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 8/5/20.
//  Copyright © 2020 mehdi. All rights reserved.
//

import Foundation


import Alamofire

class ReplyService: NSObject{
    
    func getAllReplies(id:Int, completion: @escaping ([Reply1]) -> Void) {
        let url = URL(string:Keys.MobileIntegrationServer.baseURL + "/reply/topic/\(id)")
       // print(url!)
//       let url = URL(string: "https://api.jsonbin.io/b/5f29fdf0dddf413f95bcfe38/7")
        var request = URLRequest(url: url!)
        request.httpMethod = "get"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

//        let values = [] as Any
//
//        request.httpBody = try! JSONSerialization.data(withJSONObject: values)

//        AF.request(request)
//            .responseJSON { response in
//                // do whatever you want here
//              print(response.request)
//                        print(response.response)
//                         print("mmmmmmmmmmmmmmehhhhdiiiii")
//                         print(response.result)
//
//
//        }
        AF.request(request).responseJSON{
                   response in
                let tvShowsArray = (response.value as! NSArray)
            var topicarray: [Reply1] = []
            do{
                topicarray = try JSONDecoder().decode([Reply1].self, from: try! JSONSerialization.data(withJSONObject: tvShowsArray))
            } catch let error as NSError {
                print("Failed to load: \(error.description)")
            }
            completion(topicarray)
        }
    }
}
