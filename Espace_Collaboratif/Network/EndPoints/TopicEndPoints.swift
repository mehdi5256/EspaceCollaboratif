//
//  UserEndPoints.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 4/24/20.
//  Copyright © 2020 mehdi. All rights reserved.
//

import Foundation
import Alamofire

enum TopicEndPoints: APIConfiguration {
    
    case getalltopics
    case PostReply(reply:String,topic:[String: Any],user:[String: Any])
    
    

   
   static let getalltopicsendpoint = "/topic/tag/"
    static let postReplyEndPoint = "/reply/"

    //static let endPointBaseURL = "/b/5ea458d798b3d53752345728/6"

   
   var method: HTTPMethod {
      switch self {
      case .getalltopics:
        return .post
        case .PostReply:
        return .post
      
      default:
         return .get
      }
   }
   
   var path: String{
      switch self {
      case .getalltopics:
        return TopicEndPoints.getalltopicsendpoint
        case .PostReply:
        return TopicEndPoints.postReplyEndPoint
      }
   }
   
   var parameters: Parameters?{
      switch self {
      
      case .PostReply(let reply,let topic,let user):
        
        let object = NSMutableDictionary()
        
        object.setValue(reply, forKey: Keys.AddTopicKey.reply)
        object.setValue(topic, forKey: Keys.AddTopicKey.topic)
        object.setValue(user, forKey: Keys.AddTopicKey.user)
        
        return (object as! Parameters)
        
         
      default:
         return nil
      }
   }
   
   func asURLRequest() throws -> URLRequest {
      let paramsAsString = true
    let url = try (Keys.MobileIntegrationServer.baseURL + path).asURL()
      //switch self
      
      var useParams = true
      var isJsonObject = false
      var urlRequest = URLRequest(url: url)
      
      switch self {
        
      case .getalltopics:
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let values = [] as Any

        urlRequest.httpBody = try! JSONSerialization.data(withJSONObject: values)

        useParams = true

        
        
      
      default:
         urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
         urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
      }
      
      urlRequest.httpMethod = method.rawValue
      
      if(useParams) {
          if(paramsAsString) {
              
          } else {
              if let parameters = parameters {
                  do {
                      urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
                  } catch {
                      throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
                  }
              }
          }
      }
      else if isJsonObject {
      //            switch self {
      //
      ////            case .updateProfile(let profile):
      ////                let jsonEncoder = JSONEncoder()
      ////                print(profile)
      ////                let jsonData = try jsonEncoder.encode(profile)
      ////                urlRequest.httpBody = jsonData
      //
      //            default:
      //                break
      //            }
     }
      print(url.absoluteString)
      return urlRequest
   }
   
}
