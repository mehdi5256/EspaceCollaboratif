//
//  ProfilInteractor.swift
//  Espace_Collaboratif
//
//  Created by Mehdi on 14/10/2020.
//  Copyright (c) 2020 mehdi. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ProfilBusinessLogic
{
  func doSomething(request: Profil.Something.Request)
}

protocol ProfilDataStore
{
  //var name: String { get set }
}

class ProfilInteractor: ProfilBusinessLogic, ProfilDataStore
{
  var presenter: ProfilPresentationLogic?
  var worker: ProfilWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: Profil.Something.Request)
  {
    worker = ProfilWorker()
    worker?.doSomeWork()
    
    let response = Profil.Something.Response()
    presenter?.presentSomething(response: response)
  }
}