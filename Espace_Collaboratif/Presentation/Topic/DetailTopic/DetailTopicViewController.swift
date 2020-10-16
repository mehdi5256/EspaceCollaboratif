//
//  DetailTopicViewController.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 8/7/20.
//  Copyright (c) 2020 mehdi. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import TagListView
import Kingfisher
import Alamofire
import GrowingTextView


protocol DetailTopicDisplayLogic: class
{
  func displaySomething(viewModel: DetailTopic.Something.ViewModel)
    func displayPostReplySucess(reply : Reply1)
    func displayPostReplyError(error: String)
    func presentzidreplySuccess(reply: Reply1)

}

class DetailTopicViewController: UIViewController, DetailTopicDisplayLogic
{
    func presentzidreplySuccess(reply: Reply1) {
        
    }
    
    func displayPostReplySucess(reply: Reply1) {
                print(reply)

    }
    
    func displayPostReplyError(error: String) {
        print(error)
    }
    
  var interactor: DetailTopicBusinessLogic?
  var router: (NSObjectProtocol & DetailTopicRoutingLogic & DetailTopicDataPassing)?

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
    let interactor = DetailTopicInteractor()
    let presenter = DetailTopicPresenter()
    let router = DetailTopicRouter()
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
  
    
    @IBOutlet weak var textreply: GrowingTextView!
    
    @IBOutlet weak var BtnSendReply: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
   @IBOutlet weak var tv: UITableView!
   @IBOutlet weak var tableHeight: NSLayoutConstraint!

    
    //outleet prepare
    
    @IBOutlet weak var listtag: TagListView!
    @IBOutlet weak var useriimg: UIImageView!
    @IBOutlet weak var nomuser: UILabel!
    @IBOutlet weak var dscrptionntopic: UILabel!
    @IBOutlet weak var titletopic: UILabel!
    
    @IBOutlet weak var textviewbotomconstraint: NSLayoutConstraint!
    
// variable  prepare
    
    var idtopic:Int?
    var userimg:String?
    var FirstName:String?
    var LastName:String?
    var TitreTopic:String?
    var descriiptionTopic:String?
    var arrtag :[String] = []
    var NumberReply:Int?
    
    
    let replyservice = ReplyService()
    
    var replyarray: [Reply1] = []




    override func viewDidLoad()
  {
    super.viewDidLoad()
    doSomething()
    
    //Set table height to cover entire view
    //if navigation bar is not translucent, reduce navigation bar height from view height
    tableHeight.constant = self.view.frame.height-108
    self.tv.isScrollEnabled = false
    //no need to write following if checked in storyboard
    self.scrollView.bounces = false
    self.tv.bounces = true
    
    useriimg.kf.setImage(with: URL(string: userimg!))
    nomuser.text = (FirstName ?? "") + " " + (LastName ?? "")
    dscrptionntopic.text = descriiptionTopic
    titletopic.text =  TitreTopic
    listtag.removeAllTags()
    listtag.addTags(arrtag)
    
    fetchallreplies()
    design()
    
    textreply.contentInsetAdjustmentBehavior = .always
    automaticallyAdjustsScrollViewInsets = false

    
    // *** Customize GrowingTextView ***

    // *** Listen to keyboard show / hide ***
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChangeFrame), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)

    // *** Hide keyboard when tapping outside ***
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureHandler))
    view.addGestureRecognizer(tapGesture)

    

    
  }
    
    deinit {
           NotificationCenter.default.removeObserver(self)
       }
    
     @objc private func keyboardWillChangeFrame(_ notification: Notification) {
            if let endFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                var keyboardHeight = UIScreen.main.bounds.height - endFrame.origin.y
                if #available(iOS 11, *) {
                    if keyboardHeight > 0 {
                        keyboardHeight = keyboardHeight - view.safeAreaInsets.bottom
                    }
                }
                textviewbotomconstraint.constant = keyboardHeight + 8
                view.layoutIfNeeded()
            }
        }

        @objc func tapGestureHandler() {
            view.endEditing(true)
        }
    
    
    func design(){
        textreply.layer.cornerRadius = 10
        textreply.layer.cornerRadius = 10
        textreply.layer.borderWidth = 1
        textreply.layer.borderColor = #colorLiteral(red: 0.4948643718, green: 0.4948643718, blue: 0.4948643718, alpha: 1)
        
    }
    
    func fetchallreplies(){
        replyservice.getAllReplies(id: idtopic!){ (rooms) in
            self.replyarray = rooms
            self.tv.reloadData()
           
            print(self.replyarray)
         
        }
    }
    
    func designbuttonaftersend(){
           textreply.text = ""
          // BtnSendReply.backgroundColor = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)
        //   BtnSendReply.isEnabled = false
           
       }
    
    
    
    @IBAction func BackButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)

    }
    
    @IBAction func SendReply(_ sender: Any) {
        
        
              

        if(textreply.text!.trimmingCharacters(in: .whitespacesAndNewlines).count > 0) {
                //   BtnSendReply.isEnabled = false
            
            
           
            replyarray.insert(Reply1(reply: textreply.text, user: User(id: UserDefaultLogged.idUD, firstName: UserDefaultLogged.firstNameUD, lastName: UserDefaultLogged.lasttNameUD, email: UserDefaultLogged.emailUD, image: UserDefaultLogged.IMGUD, username: UserDefaultLogged.firstNameUD)), at: 0)
           
                tv.beginUpdates()
            
            let indexPath = IndexPath(row: 0, section: 0)
            tv.insertRows(at: [indexPath], with: .top)
                self.NumberReply! += 1
            //
                self.tv.endUpdates()
            
            tv.reloadSections(IndexSet(integer: 0), with: .bottom)

          //  tv.scrollToRow(at: indexPath, at: UITableView.ScrollPosition.none, animated: true)


          //  tv.reloadData()


            interactor?.PostReply(reply:textreply.text,topic:["id":idtopic!],user: ["id":UserDefaultLogged.idUD])
            
           
            self.designbuttonaftersend()
            //tv.reloadData()

            
            
            
               } else {
                   print("tesstt")
               }

        
      
        
        
        
    }
    
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func doSomething()
  {
    let request = DetailTopic.Something.Request()
    interactor?.doSomething(request: request)
  }
  
  func displaySomething(viewModel: DetailTopic.Something.ViewModel)
  {
    //nameTextField.text = viewModel.name
  }
}

extension DetailTopicViewController:UITableViewDataSource,UITableViewDelegate{
    
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return replyarray.count
        }
        
   func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 60))
        let labelheadernumber = UILabel(frame: CGRect(x: 30, y: 5, width: tableView.frame.width, height: 50))
    labelheadernumber.text = "Réponses (\(NumberReply!))"
        view.backgroundColor = #colorLiteral(red: 0.9528016448, green: 0.9659723639, blue: 0.9814048409, alpha: 1)

        labelheadernumber.textAlignment = .left
        labelheadernumber.font = UIFont(name:"HelveticaNeue-Bold", size: 18.0)
        view.addSubview(labelheadernumber)
        
        return view

    }
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 60.0
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ReplyTableViewCell
            
            //user info
            let image = replyarray[indexPath.row].user.image
            cell.userimg.kf.setImage(with: URL(string: image))
            cell.username.text = replyarray[indexPath.row].user.firstName + " " + replyarray[indexPath.row].user.lastName
            
            cell.reponse.text = replyarray[indexPath.row].reply
            
            return cell
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            if scrollView == self.scrollView {
                tv.isScrollEnabled = (self.scrollView.contentOffset.y >= 260)
            }
            
            if scrollView == self.tv {
                self.tv.isScrollEnabled = (tv.contentOffset.y > 0)
            }
        }
    
}


extension DetailTopicViewController: GrowingTextViewDelegate {
    
    // *** Call layoutIfNeeded on superview for animation when changing height ***
    
    func textViewDidChangeHeight(_ textView: GrowingTextView, height: CGFloat) {
        UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: [.curveLinear], animations: { () -> Void in
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
   
}
    

