//
//  TopicViewController.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 8/4/20.
//  Copyright (c) 2020 mehdi. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import Kingfisher
import  Alamofire
import CRRefresh

protocol TopicDisplayLogic: class
{
    func displaySomething(viewModel: Topic.Something.ViewModel)
    func displayTopicsSuccess(topics: [Topic1])
    func displayTopicsError(error: String)
}

class TopicViewController: UIViewController, TopicDisplayLogic
{
    func displayTopicsSuccess(topics: [Topic1]) {
        self.topicarray = topics
        arrFilterTopics = topicarray
        //print(topics)
        
        tv.reloadData()
    }
    
    func displayTopicsError(error: String) {
        print(error)
        
    }
    
    
    
    var interactor: TopicBusinessLogic?
    var router: (NSObjectProtocol & TopicRoutingLogic & TopicDataPassing)?
    
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
        let interactor = TopicInteractor()
        let presenter = TopicPresenter()
        let router = TopicRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    //  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    //  {
    //    if let scene = segue.identifier {
    //      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
    //      if let router = router, router.responds(to: selector) {
    //        router.perform(selector, with: segue)
    //      }
    //    }
    //  }
    
    // MARK: View lifecycle
    
    var topicarray: [Topic1] = []
    var tagname: [String] = []
    var tagsarray : [Tag] = []
    var arrFilterTopics = [Topic1]()

    
    
    @IBOutlet weak var tv: UITableView!
    
    @IBOutlet weak var SearchBar: UISearchBar!
    
    override func viewWillAppear(_ animated: Bool) {
        interactor?.getalltopics()

    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        doSomething()
        interactor?.getalltopics()
        
        //refresh table view
        
        
        let loadingFooter = NormalFooterAnimator()
        loadingFooter.loadingDescription = "Chargement "
        loadingFooter.noMoreDataDescription = "pas d'autres contacts"
        let loadingHeader = NormalHeaderAnimator()
        loadingHeader.loadingDescription = "Chargement "
        loadingHeader.pullToRefreshDescription = "Tirer pour rafraîchir"
        loadingHeader.releaseToRefreshDescription = "Relâcher pour rafraîchir"
        //           tv.backgroundColor = UIColor(named: "4873e8")
        
        /// animator: your customize animator, default is NormalHeaderAnimator
        tv.cr.addHeadRefresh(animator: FastAnimator()) { [weak self] in
            /// start refresh
            /// Do anything you want...
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                /// Stop refresh when your job finished, it will reset refresh footer if completion is true
                self?.interactor?.getalltopics()
                self?.tv.cr.endHeaderRefresh()
                
            })
        }
        /// manual refresh
        // tv.cr.beginHeaderRefresh()
        
        
    }
    
    
    // MARK: Do something
    
    //@IBOutlet weak var nameTextField: UITextField!
    
    func doSomething()
    {
        let request = Topic.Something.Request()
        interactor?.doSomething(request: request)
    }
    
    func displaySomething(viewModel: Topic.Something.ViewModel)
    {
        //nameTextField.text = viewModel.name
    }
}

extension TopicViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(topicarray.count)
        return arrFilterTopics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "topiccell", for: indexPath) as! TopicTableViewCell
        
        //user info
        let image = arrFilterTopics[indexPath.row].user.image
        cell.UserImage.kf.setImage(with: URL(string: image))
        cell.Username.text = arrFilterTopics[indexPath.row].user.firstName + " " + arrFilterTopics[indexPath.row].user.lastName
        
        //topic info
        cell.TitleTopic.text = arrFilterTopics[indexPath.row].title
        //        cell.DescriptionTopic.text = topicarray[indexPath.row].description
        //cell.TagName.text = topicarray[indexPath.row].tags
        cell.CountReply.text = arrFilterTopics[indexPath.row].countReplies!.description + " réponses"
        
        cell.numberview.text = arrFilterTopics[indexPath.row].seen!.description + " vues"
        var arrtag :[String] = []
        let array2 = arrFilterTopics[indexPath.row].tags
        for a in array2{
            arrtag.append(a.name!)
            
            
        }
        cell.taglistview.removeAllTags()
        cell.taglistview.addTags(arrtag)
        
        
        return cell
    }
}
extension TopicViewController:UITableViewDelegate{
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "todetailtopic", sender: indexPath)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "todetailtopic"{
            
            let DVC = segue.destination as! DetailTopicViewController
            let indice = sender as! IndexPath
            
            DVC.idtopic = arrFilterTopics[indice.row].id
            DVC.userimg = arrFilterTopics[indice.row].user.image
            DVC.FirstName = arrFilterTopics[indice.row].user.firstName
            DVC.LastName = arrFilterTopics[indice.row].user.lastName
            DVC.TitreTopic = arrFilterTopics[indice.row].title
            DVC.descriiptionTopic = arrFilterTopics[indice.row].description
            DVC.NumberReply = arrFilterTopics[indice.row].countReplies
            let array2 = arrFilterTopics[indice.row].tags
            for a in array2{
                DVC.arrtag.append(a.name!)
                // print(arrtag)
            }
            
        }
        
    }
    
    
    
}


extension TopicViewController:UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else
        {
            arrFilterTopics = topicarray
            tv.reloadData()
            return
        }
        arrFilterTopics = topicarray.filter({ (topictest) -> Bool in
            
            return topictest.title!.lowercased().contains(searchText.lowercased())
        })
        tv.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//            searchBar.resignFirstResponder()
//        tv.keyboardDismissMode = .onDrag
        
        searchBar.endEditing(true)


    }
    
}
