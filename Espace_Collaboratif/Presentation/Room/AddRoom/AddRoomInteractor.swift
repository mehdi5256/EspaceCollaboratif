//
//  AddRoomInteractor.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 4/29/20.
//  Copyright (c) 2020 mehdi. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol AddRoomBusinessLogic
{
    func getUsers()
    func AddRoom (name:String , subject:String,user:[String: Any],isPrivate:Bool, users: [Dictionary<String,Any>])
    
}

protocol AddRoomDataStore
{
    //var name: String { get set }
}

class AddRoomInteractor: AddRoomBusinessLogic, AddRoomDataStore
{
    func AddRoom(name: String, subject: String, user:[String: Any],isPrivate:Bool, users: [Dictionary<String,Any>]) {
        worker = AddRoomWorker()
        worker?.AddRoom(name: name, subject: subject, user:user , isPrivate: isPrivate, users: users).then
            { addroom in
                
                self.presenter?.presentAddRoomSucess(response : addroom)
        }.catch { error in
            self.presenter?.presentAddRoomError(error: error.localizedDescription)
            
        }
    }
    
    func getUsers() {
        worker = AddRoomWorker()
        worker?.getUsers().then {
            users in
            self.presenter?.presentUsersSuccess(users: users)
        }.catch {
            error in
            self.presenter?.presentUsersError(error: error.localizedDescription)
        }
    }
    
    var presenter: AddRoomPresentationLogic?
    var worker: AddRoomWorker?
    //var name: String = ""
    var users: User!
    
    
    // MARK: Do something
    
    
    
}
