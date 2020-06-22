//
//  Constants.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 4/24/20.
//  Copyright © 2020 mehdi. All rights reserved.
//

import Foundation

enum Keys{
   enum MobileIntegrationServer {
     static let baseURL = "http://1da6a9f289a6.ngrok.io"
   // static let baseURL = "https://api.jsonbin.io"
    static let baseURLEventBus = "0.tcp.ngrok.io"
      static let basePortEventBus = 17187
    
      static let baseAuthURL =
    "http://ccd6e59852f8.ngrok.io/auth/realms/espace_collaborative/protocol/openid-connect/auth"
      static let baseTokenURL =
    "http://ccd6e59852f8.ngrok.io/auth/realms/espace_collaborative/protocol/openid-connect/token"
    static let ClientSecret = "8e9c9737-7c84-4111-b2e9-c4d2479a2869"
    static let redirectURL = "accretio://mobile/loginsuccess"
    static let  ClientId = "quarkus-app"
    
    static let  jitsiURL = "https://mobile-int.accretio.io:8443"


   }
    
    enum AddRoomKey{
        static let id = "id"
        static let name = "name"
       static let subject = "subject"
        static let users = "users"
    }
    
    
    enum RoomParameterKey{
       static let id = "id"
       static let name = "name"
        static let image = "image"
       static let subject = "subject"
    }
    
    
   enum LoginParameterKey {
      static let password = "password"
      static let email = "username"
      static let grantType = "grant_type"
      static let clientName = "clientName"
   }
   enum EventParameterKey{
      static let id = "id"
      static let name = "name"
      static let description = "description"
      static let startDate = "startDate"
      static let endDate = "endDate"
      static let type = "type"
      static let image = "image"
      static let status = "status"
   }
    
    
}

enum EventBusKeys{
   static let user = "user"
   static let body = "body"
   static let event = "event"
   static let answers = "answers"
   enum channelKeys{
      enum ServerChannelKeys{
         static let quizChannel = "server/quiz"
         static let questionChannel = "server/question"
         static let wordCloudChannel = "server/wordCloud"
      }
      enum ClientChannelKeys{
         static let quizChannel = "client/quiz/"
         static let questionChannel = "client/question/"
         static let wordCloudChannel = "client/wordCloud/"
      }
   }
   enum typeKeys{
      static let type = "type"
      static let register = "register"
   }
   enum plateformeKeys{
      static let plateforme = "plateforme"
      static let mobile = "mobile"
      static let web = "web"
      static let server = "server"
   }
   enum modeKeys{
      static let mode = "mode"
      static let all = "all"
      static let question = "question"
      static let result = "result"
      static let word = "word"
   }
}


enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case typeRequest = "typeRequest"
    case gatewayKey = "x-gravitee-api-key"
    case companyCode = "companyCode"
    case cookie = "cookie"
    case language = "language"
}

enum ContentType: String {
    case json = "application/json"
    case formEncoded = "application/x-www-form-urlencoded"
    case multipartFormData = "multipart/form-data"
}
enum GraviteeKeys: String {
    case DocMangKey = "9764bbe4-26fe-457d-bc17-c2bdfe338f41"
    case FactKey = "837ac88c-1e99-4e34-be6e-64ff0ba92327"
    case DataTrans = "3bc547ff-52c8-42c4-a121-a8d7c8f78906"
    case CollabSpaceKey = ""
}
enum Authentication: String {
    case globalBasic = "Basic YWR2eXRlYW06YWRtaW4="
}
enum NotificationSource: String {
    case collabSpace = "collaborativeSpace"
    case fact = "fact"
}
enum Connected {
}
/*enum Connected {
    static var notifCounterId = ""
    static var userSession: UserSession?
    static var documentToken: String = ""
    static var bnesDocumentToken: String?
    
    
    static var tokenHeader: String {
        if userSession == nil {
            return ""
           // return "Bearer "+( UserDefaults.UserData.object(forKey: .authToken) as? String ?? "")
        } else {
            //return userSession!.tokenType + " " + userSession!.accessToken
            
             return ""
        }
    }
}*/
