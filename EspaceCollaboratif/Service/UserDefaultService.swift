//
//  UserDefaultService.swift
//  EspaceCollaboratif
//
//  Created by mehdi on 4/7/20.
//  Copyright © 2020 mehdi drira. All rights reserved.
//

import Foundation
class UserDefaultService {
    private struct Keys{
        static let KeyId = "UserDefId"
        static let KeyFirstName = "UserDefFN"
        static let KeyLastName = "UserDefLN"
        static let KeyEmail = "UserDefMail"
        static let KeyIMG = "UserDefIMG"



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

}
