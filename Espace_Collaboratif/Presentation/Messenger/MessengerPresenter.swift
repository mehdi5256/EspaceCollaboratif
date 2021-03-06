//
//  MessengerPresenter.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 4/30/20.
//  Copyright (c) 2020 mehdi. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol MessengerPresentationLogic
{
    func presentGetRoomByIdSuccess(roomdid: [Messenger1])
    func presentGetRoomByIdError(error: String)
    
    func presentGetRoomEventBusSuccess(id: Room1)
    func presentGetRoomEventBusError(error: String)
    
    func presentPostMsgdSuccess(msg: [Messenger1])
    func presentPostMsgdError(error: String)
    
    func presentPostImgdSuccess(img: [Messenger1])
    func presentPostImgError(error: String)
    
    
    func presentConnexionSuccess(result: String)
    func presentError(error: String)
    
    func sendMessageEventBus(result:String)
    func presentMessenger(messenger:Messenger1)
    func presentReaction(reaction: Reaction1,messageId: Int)
    func presentVoteEventBus(idMessage: String,idChoix: String, user:User)
    
}

class MessengerPresenter: MessengerPresentationLogic
{
    func presentVoteEventBus(idMessage: String, idChoix: String, user: User) {
        let idmsg = Int(idMessage)
        let idchoix = Int(idChoix)
        self.viewController!.DisplayVoteEventBus(idMessage: idmsg!, idChoix: idchoix!, user: user)
    }
    
    
    func presentReaction(reaction: Reaction1,messageId: Int) {
        self.viewController!.displayReaction(reaction: reaction, messageId:messageId)
    }
    
    
    func sendMessageEventBus(result: String) {
        viewController?.displaySendMessageEventBus(result: result)
    }
    
   
    func presentMessenger(messenger: Messenger1) {
        
        viewController?.displayMessenger(messenger:messenger)
    }
    
    func presentConnexionSuccess(result: String) {
        viewController?.displayConnexionSuccess(result:result)
    }
    
    func presentError(error: String) {
        viewController?.displayError(error:error)
    }
    
    weak var viewController: MessengerDisplayLogic?
    
    // MARK: Do something
    
    func presentGetRoomByIdSuccess(roomdid: [Messenger1]) {
        viewController?.displayrRoomByIdSuccess(roomdid : roomdid)
        
    }
    
    func presentGetRoomByIdError(error: String) {
        viewController?.displayrRoomByIdError(error: error)
    }
    
    func presentGetRoomEventBusSuccess(id: Room1) {
        viewController?.displayIdRoomEventBus(id : id)
    }
    
    func presentGetRoomEventBusError(error: String) {
        viewController?.displayrRoomByIdError(error: error)
    }
    
    func presentPostMsgdSuccess(msg: [Messenger1]) {
        
        viewController?.displayPostMsgSucess(msg : msg)
    }
    
    func presentPostMsgdError(error: String) {
        
        viewController?.displayPostMsgError(error: error)
    }
    
    func presentPostImgdSuccess(img: [Messenger1]) {
        viewController?.displayPostImgSucess(img : img)
        
    }
    func presentPostImgError(error: String) {
        viewController?.displayPostImgError(error: error)
            }
    
}
