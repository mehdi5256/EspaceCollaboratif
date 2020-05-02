//
//  LoginPresenter.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 4/25/20.
//  Copyright (c) 2020 mehdi. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import AppAuth

protocol LoginPresentationLogic
{
  func connect(request: OIDAuthorizationRequest)
    func presentUsermeSuccess(token:String)
    func presentUsermeError(error: String)
}

class LoginPresenter: LoginPresentationLogic
{
    func presentUsermeSuccess(token: String) {
        viewController?.displayUserMeSuccess(token: token)

    }
    
    func presentUsermeError(error: String) {
            viewController?.displayUserMeError(error: error)

    }
    
   
    
  weak var viewController: LoginDisplayLogic?
  let appDelegate = UIApplication.shared.delegate as! AppDelegate

  
  // MARK: Do something
  
  func connect(request: OIDAuthorizationRequest) {
   self.viewController?.tokenSuccess(token: "5edmet hedhi w yji token normalment")

   appDelegate.currentAuthorizationFlow = OIDAuthState.authState(byPresenting: request, presenting: viewController! as! UIViewController , callback: { state, error  in
         if error != nil {
            self.viewController?.tokenError()
            return
         }
         self.viewController?.tokenSuccess(token: state!.lastTokenResponse!.accessToken!)
     })
  }
}
