//
//  AddRoomRouter.swift
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

@objc protocol AddRoomRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol AddRoomDataPassing
{
  var dataStore: AddRoomDataStore? { get }
}

class AddRoomRouter: NSObject, AddRoomRoutingLogic, AddRoomDataPassing
{
  weak var viewController: AddRoomViewController?
  var dataStore: AddRoomDataStore?
  
  // MARK: Routing
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  
  //func navigateToSomewhere(source: AddRoomViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: AddRoomDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}
