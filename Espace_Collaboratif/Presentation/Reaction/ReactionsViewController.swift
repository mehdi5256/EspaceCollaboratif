//
//  ReactionsViewController.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 6/2/20.
//  Copyright (c) 2020 mehdi. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import Kingfisher

protocol ReactionsDisplayLogic: class
{
  func displaySomething(viewModel: Reactions.Something.ViewModel)
}

class ReactionsViewController: UIViewController, ReactionsDisplayLogic
{
  var interactor: ReactionsBusinessLogic?
  var router: (NSObjectProtocol & ReactionsRoutingLogic & ReactionsDataPassing)?

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = ReactionsInteractor()
    let presenter = ReactionsPresenter()
    let router = ReactionsRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
    
    var reactionsArray:[Reaction1] = []
      override func viewDidLoad()
  {
    print (reactionsArray)
    super.viewDidLoad()
    doSomething()
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func doSomething()
  {
    let request = Reactions.Something.Request()
    interactor?.doSomething(request: request)
  }
  
    @IBAction func DismissReaction(_ sender: Any) {
          dismiss(animated: true, completion: nil)
    }
    func displaySomething(viewModel: Reactions.Something.ViewModel)
  {
    //nameTextField.text = viewModel.name
  }
}




extension ReactionsViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reactionsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ReactionTableViewCell
        let image = reactionsArray[indexPath.row].user.image
        cell1.userimage.kf.setImage(with: URL(string: image))
        cell1.username.text = reactionsArray[indexPath.row].user.firstName  + " " + reactionsArray[indexPath.row].user.lastName
        
        if (reactionsArray[indexPath.row].type == "LIKE"){
            cell1.reactionicon.image = UIImage(named: "like")
            
        }
        if (reactionsArray[indexPath.row].type == "BRAVO"){
                   cell1.reactionicon.image = UIImage(named: "bravo")

               }
        if (reactionsArray[indexPath.row].type == "INTERESTING"){
                   cell1.reactionicon.image = UIImage(named: "interesting")

               }
        if (reactionsArray[indexPath.row].type == "LOVE"){
                   cell1.reactionicon.image = UIImage(named: "love")

               }
        return cell1
    }
    
    
}
