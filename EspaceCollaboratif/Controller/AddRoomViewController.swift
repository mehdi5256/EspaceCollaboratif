//
//  AddRoomViewController.swift
//  EspaceCollaboratif
//
//  Created by mehdi on 3/19/20.
//  Copyright © 2020 mehdi drira. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage


class AddRoomViewController: UIViewController {
    
    @IBOutlet weak var selectalllabel: UILabel!
    @IBOutlet weak var numberusers: UILabel!
    @IBOutlet weak var createbtnoutlet: UIButton!
    @IBOutlet weak var tvuser: UITableView!
    @IBOutlet weak var Subject: UITextField!
    @IBOutlet weak var RoomName: UITextField!
    
    var Userscells: [User1] = []
    let userservice = UserService()
    var selectarrayusers: [User1] = []

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tvuser.isEditing = true
        tvuser.allowsMultipleSelectionDuringEditing = true
        fetchAllUers()

        
    }
    
    func fetchAllUers(){
           userservice.getAllUsers(){ (users) in
               self.Userscells = users
               self.tvuser.reloadData()
           }
       }
    
    @IBAction func CreateRoom(_ sender: Any) {
        
        
        print(selectarrayusers)
        print(selectarrayusers.count)

        
   /*     let myUrl = "http://1193a49a.ngrok.io/room";
        
        let nomroom = RoomName.text;
               let description = Subject.text;
        
        let parameters: Parameters=[
            "name":nomroom!,
            "subject":description!,
            
        ]
       

        AF.request(myUrl, method: .post, parameters: parameters).responseJSON
        {
            response in
            //printing response
            print(response)
            //getting the json value from the server
                           if let result = response.value {
                               
                               //converting it as NSDictionary
                               let jsonData = result as! NSDictionary
                               let responsetype = jsonData.value(forKey: "error") as! Bool;
                                if (responsetype ){
                                 //  self.lblmsg.text = "Adresse mail existe déjà!";
                                    
                                    print("nonononoono")

                               }
                               
                               
                               if (!responsetype ){
                                DispatchQueue.main.async {
                                    print("okookokokok")

                                }
                            }


       }
            
        }
 
 */
    }

    

   
   
  /*
    @IBAction func DismissKeyboard(_ sender: UITapGestureRecognizer) {
        Subject.resignFirstResponder()
        RoomName.resignFirstResponder()
    }
     */
    @IBAction func BackButton(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
       }
  
   
    
}
   


extension AddRoomViewController:UITableViewDataSource,UITableViewDelegate{
    
   
   @IBAction func BtnSelectAll(_ sender: UIButton) {
    
    self.selectarrayusers.removeAll()
    
    if sender.isSelected{
        for row in 0..<Userscells.count {
            tvuser.selectRow(at: IndexPath(row: row, section: 0), animated: false, scrollPosition: .none)
        }
        sender.isSelected = false
        sender.setImage(UIImage(named: "ok"), for: .normal)
        print(Userscells.count)
        selectalllabel.text = ("Désélectionner tous les utilisateurs")
        numberusers.text = (String(Userscells.count) + " utilisateurs")


        
        
        selectarrayusers = Userscells
    }else{
        
        for row in 0..<Userscells.count {
        self.tvuser.deselectRow(at: IndexPath(row: row, section: 0), animated: false)

        }
        sender.isSelected = true
        sender.setImage(UIImage(named: "circle25"), for: .normal)
        selectalllabel.text = ("Sélectionner tous les utilisateurs")
        numberusers.text = ("0 utilisateur")




        self.selectarrayusers.removeAll()
         
        
    }
    
   
          
      }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return Userscells.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
          guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? AddUserTableViewCell
                               else{
                                   return UITableViewCell()
                           }
        
        cell.usernom.text = Userscells[indexPath.row].firstName + " " + Userscells[indexPath.row].lastName
        
        let image = self.Userscells[indexPath.row].image
              
        cell.imguser.af.setImage(withURL: URL(string: image)!)

       
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      //  let cell = tvuser.cellForRow(at: indexPath) as! AddUserTableViewCell

        //    cell.checkuser.image = UIImage(named: "ok")
        
        
        
        self.selectdeselctrow(tableview: tvuser, indexpath: indexPath)
               
               
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        self.selectdeselctrow(tableview: tvuser, indexpath: indexPath)
        
        
        
        
        //  let cell = tvuser.cellForRow(at: indexPath) as! AddUserTableViewCell

                  // cell.checkuser.image = UIImage(named: "circle")
        
        

    }
    
    func selectdeselctrow(tableview:UITableView, indexpath:IndexPath){
        
        self.selectarrayusers.removeAll()
        if let arr = tableview.indexPathsForSelectedRows {
            for index in arr{
               // selectarrayusers.append(Userscells[index.row].id)
               selectarrayusers.append(Userscells[index.row])

            }
        }
        print(selectarrayusers)
        print(selectarrayusers.count)
        
        if (selectarrayusers.count == 1) {
            numberusers.text = "1 utilisateur"
        }
            if (selectarrayusers.count == 0) {
                       numberusers.text = "0 utilisateur"
                   }
        
        else{
            numberusers.text = (String(selectarrayusers.count) + " utilisateurs")

            
        }

        
        
    }
    
    
}
