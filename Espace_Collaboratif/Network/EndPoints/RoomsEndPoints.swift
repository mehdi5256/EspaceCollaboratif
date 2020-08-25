//
//  UserEndPoints.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 4/24/20.
//  Copyright © 2020 mehdi. All rights reserved.
//

import Foundation
import Alamofire

enum RoomsEndPoints: APIConfiguration {
    
    case getRooms(token:String)
    case getUsers
    case AddRoom (name:String , subject:String, user:[String: Any], isPrivate:Bool, users: [Dictionary<String,Any>])
    case getRoombyId(id: Int)
    case PostMsg(type:String, file:String,room:[String: Any],user:[String: Any],body: String)
     case PostImage(type:String,body: String ,user:[String: Any],room:[String: Any],file:String)
    case getRoomIdEventBus(id: Int)
    
    case zidReply(reply:String,topic:[String: Any],user:[String: Any])
    
    
    
    
    
   
  static let endPointBaseURL = "/room/"
   // static let endPointBaseURL = "/b/5ea458d798b3d53752345728/6"
//    static let endPointUsersURL = "/b/5eaa0e9766e603359fe0fcf1"
    static let endPointUsersURL = "/user/"

    static let endPointaddroomURL = "/room/"
    static let getRoomById = "/msg/room/"
    static let postmsg = "/msg/"
    static let reply = "/reply/"

    
    

    





   
   var method: HTTPMethod {
      switch self {
        
      case .getRooms:
        return .get
        
      case .PostMsg:
        return .post
      case .PostImage:
        return .post
     
      case .getRoombyId:
        return .get
        
        case .getUsers:
        return .get
        
        
      case  .AddRoom:
        return .post
        
      case  .zidReply:
        return .post

        
        
      case .getRoomIdEventBus:
        return .get
        
      default:
      return .get
        
      }
   }
   
   var path: String{
      switch self {
      case .getRooms:
//         return UserEndPoints.endPointBaseURL
        return RoomsEndPoints.endPointBaseURL
        
      case .getUsers:
        return RoomsEndPoints.endPointUsersURL

      case .AddRoom:
        return RoomsEndPoints.endPointaddroomURL
        
      case .getRoombyId(let id):
        return "/msg/room/\(id)"
        
      case .getRoomIdEventBus(let id):
        return "/ws/chat/info?room_id=\(id)"


        
        case .PostMsg:
        return RoomsEndPoints.postmsg
        
        case .PostImage:
              return RoomsEndPoints.postmsg
        
      

        

        
        

      case .zidReply:
    return RoomsEndPoints.reply

    }
   }
   
   var parameters: Parameters?{
      switch self {
     
      case .zidReply(let reply, let topic, let user):
        let object = NSMutableDictionary()
        
            object.setValue(reply, forKey: "reply")
            object.setValue(topic, forKey: "topic")
            object.setValue(user, forKey: "user")
        return (object as! Parameters)
        
        
        case .AddRoom(let name, let subject,let user,let isPrivate, let users):
        let object = NSMutableDictionary()
        
        object.setValue(name, forKey: Keys.AddRoomKey.name)
        object.setValue(subject, forKey: Keys.AddRoomKey.subject)
        object.setValue(user, forKey: Keys.AddRoomKey.user)
        object.setValue(isPrivate, forKey: Keys.AddRoomKey.isPrivate)
        object.setValue(users, forKey: Keys.AddRoomKey.users)
        
        return (object as! Parameters)
        
      case .PostMsg(let type, let file, let room, let user, let body):
        let object = NSMutableDictionary()
            object.setValue(type, forKey: "type")
            object.setValue(file, forKey: "file")
            object.setValue(body, forKey: "body")
            object.setValue(room, forKey: "room")
            object.setValue(user, forKey: "user")
        return (object as! Parameters)
        
      case .PostImage(let type, let body, let user, let room, let file):
        let object = NSMutableDictionary()
                   object.setValue(type, forKey: "type")
                   object.setValue(body, forKey: "body")
                   object.setValue(user, forKey: "user")
                   object.setValue(room, forKey: "room")
                   object.setValue(file, forKey: "file")

               return (object as! Parameters)
        
      
        


      /*case .getListe(let id,let name):
         let object = NSMutableDictionary()
         object.setValue(id, forKey: Keys.EventParameterKey.id)
         object.setValue(name, forKey: Keys.EventParameterKey.name)
         return (object as! Parameters)*/
      default:
         return nil
      }
   }
   
   func asURLRequest() throws -> URLRequest {
      let paramsAsString = false
      var url = try (Keys.MobileIntegrationServer.baseURL + path).asURL()
      //switch self
      
      var useParams = true
      var isJsonObject = false
      var urlRequest = URLRequest(url: url)
      
      switch self {
      case .getRooms(let token):
        
         urlRequest.addValue("Bearer " + token, forHTTPHeaderField: HTTPHeaderField.authentication.rawValue)
         
         urlRequest.addValue(ContentType.json.rawValue, forHTTPHeaderField:  HTTPHeaderField.acceptType.rawValue)
         
           
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
