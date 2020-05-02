//
//  UserEndPoints.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 4/24/20.
//  Copyright © 2020 mehdi. All rights reserved.
//

import Foundation
import Alamofire

enum UserConnectedEndPoints: APIConfiguration {
    
    case me(token:String)

   
   static let endPointBaseURL = "/user/me"
    //static let endPointBaseURL = "/b/5ea458d798b3d53752345728/6"

   
   var method: HTTPMethod {
      switch self {
      case .me:
        return .get
      
      default:
         return .get
      }
   }
   
   var path: String{
      switch self {
      case .me:
        return UserConnectedEndPoints.endPointBaseURL

      }
   }
   
   var parameters: Parameters?{
      switch self {
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
      case .me(let token):
        
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
