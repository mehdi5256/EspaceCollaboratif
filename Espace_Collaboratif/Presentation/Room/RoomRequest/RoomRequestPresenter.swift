//
//  RoomRequestPresenter.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 9/6/20.
//  Copyright (c) 2020 mehdi. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol RoomRequestPresentationLogic
{
  func presentSomething(response: RoomRequest.Something.Response)
    func presentRoomRequestSuccess(roomrequest: [RoomRequest1])
       func presentRoomRequestError(error: String)
}

class RoomRequestPresenter: RoomRequestPresentationLogic
{
    func presentRoomRequestSuccess(roomrequest: [RoomRequest1]) {
        viewController?.displayRoomRequestSuccess(roomrequest: roomrequest)

    }
    
    func presentRoomRequestError(error: String) {
                viewController?.displayRoomRequestError(error: error)

    }
    
    
    
  weak var viewController: RoomRequestDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: RoomRequest.Something.Response)
  {
    let viewModel = RoomRequest.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
