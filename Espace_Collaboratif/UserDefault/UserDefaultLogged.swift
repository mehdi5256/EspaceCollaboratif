//
//  UserDefaultLogged.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 4/26/20.
//  Copyright © 2020 mehdi. All rights reserved.
//

import Foundation
class UserDefaultLogged {
    private struct Keys{
        static let KeyId = "UserDefId"
        static let KeyFirstName = "UserDefFN"
        static let KeyLastName = "UserDefLN"
        static let KeyEmail = "UserDefMail"
        static let KeyIMG = "UserDefIMG"
        static let KeyToken = "UserDefToken"
        static let userlogged = "isUserLogged"





    }
    
    static var idUD: String{
        get {
            return UserDefaults.standard.string(forKey: Keys.KeyId)!
            }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.KeyId)
        }
        
    }
    
    static var firstNameUD: String{
        get {
            return UserDefaults.standard.string(forKey: Keys.KeyFirstName)!
            }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.KeyFirstName)
        }
        
    }
    
    static var lasttNameUD: String{
        get {
            return UserDefaults.standard.string(forKey: Keys.KeyLastName)!
            }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.KeyLastName)
        }
        
    }
    static var emailUD: String{
        get {
            return UserDefaults.standard.string(forKey: Keys.KeyEmail)!
            }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.KeyEmail)
        }
        
    }
    
    static var IMGUD: String{
        get {
            return UserDefaults.standard.string(forKey: Keys.KeyIMG)!
            }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.KeyIMG)
        }
        
    }
    
    static var TokenUD: String{
          get {
              return UserDefaults.standard.string(forKey: Keys.KeyToken)!
              }
          set {
              UserDefaults.standard.set(newValue, forKey: Keys.KeyToken)
          }
          
      }

    static var isUserLogged: Bool{
        get {
            return UserDefaults.standard.bool(forKey: Keys.userlogged)
            }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.userlogged)
        }
        
    }
}
