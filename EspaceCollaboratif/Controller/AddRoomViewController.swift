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
    @IBOutlet weak var SearchBar: UISearchBar!
    
    
   // var Userscells: [User1] = []
    let userservice = UserService()
    var selectarrayusers: [Dictionary<String,Any>] = []
    //var arrFilter:[String] = []
    var isSearch : Bool = false
   var arrFilter = [User1]()

    var userid = Int()
    var Userscells = [User1]()


    override func viewDidLoad() {
        super.viewDidLoad()
        tvuser.isEditing = true
        tvuser.allowsMultipleSelectionDuringEditing = true
        fetchAllUers()

        
    }
    
    func fetchAllUers(){
           userservice.getAllUsers(){ (users) in
               self.Userscells = users
            self.arrFilter = self.Userscells
               self.tvuser.reloadData()
           }
       }
    
    
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    @IBAction func CreateRoom(_ sender: Any) {
        
        
        
        /*
        let data = try! JSONEncoder().encode(selectarrayusers)
        do {
            let json =  try JSONSerialization.jsonObject(with: data, options: [])
           // print(json)
                   if let object = json as? [String: Any] {
                   // json is a dictionary
                   print(object)
                   }
        }   catch {
        print(error.localizedDescription)
        }
       
        

        var jsonstring = String(data: data, encoding: .utf8)!
        
        
        jsonstring = jsonstring.replacingOccurrences(of: "\\/", with: "/")

        
        
        jsonstring = jsonstring.replacingOccurrences(of: "{", with: "[")
        jsonstring = jsonstring.replacingOccurrences(of: "}", with: "]")
        
     //   let dict = selectarrayusers.toDictionary { $0.id }

       print(jsonstring)
 
 */
        
        /*  let users = try! JSONDecoder().decode([User1].self, from: data)

        for ggggg in users {
            userid = ggggg.id
            print(userid)

        }
 */
       // print(data)
      //  print(selectarrayusers.count)

        
      let myUrl = "http://0b71751d.ngrok.io/room";
        
        let nomroom = RoomName.text;
               let description = Subject.text;
        
        
        
        let parameters: [String: Any] = [
            "name":nomroom!,
            "subject":description!,
            "users": selectarrayusers
                
            
        ]
            
 
       
        
        AF.request(myUrl, method: .post, parameters: parameters,encoding: JSONEncoding.init())
        .responseJSON { response in
            print(response.request)
            print(response.response)
            print(response.result)
            
            
        }
 
        
       
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
        for row in 0..<arrFilter.count {
            tvuser.selectRow(at: IndexPath(row: row, section: 0), animated: false, scrollPosition: .none)
        }
        sender.isSelected = false
        sender.setImage(UIImage(named: "ok"), for: .normal)
       // print(Userscells.count)
        selectalllabel.text = ("Désélectionner tous les utilisateurs")
        numberusers.text = (String(arrFilter.count) + " utilisateurs")

        if let arr = tvuser.indexPathsForSelectedRows {
            for index in arr{
             //   selectarrayusers.append(arrFilter[index.row].id)
              //   selectarrayusers.append(Userscells[index.row])
                
            //    selectarrayusers = [Userscells[index.row].id]

                let dddddd = try Userscells[index.row].jsonData
                               // To get dictionary from `Data`
                do {
                    let json = try JSONSerialization.jsonObject(with: dddddd(), options: [])
                    guard let dictionary = json as? [String : Any] else { return }
                    
                    selectarrayusers.append(dictionary)
                    
                } catch {
                print(error.localizedDescription)
                }
                

            }
        }
       // print(selectarrayusers)
        
        
      //  selectarrayusers = Userscells
        
    }else{
        
        for row in 0..<arrFilter.count {
        self.tvuser.deselectRow(at: IndexPath(row: row, section: 0), animated: false)

        }
        sender.isSelected = true
        sender.setImage(UIImage(named: "circle25"), for: .normal)
        selectalllabel.text = ("Sélectionner tous les utilisateurs")
        numberusers.text = ("0 utilisateur")




        self.selectarrayusers.removeAll()
        
        
         
        
    }
    
  // print(selectarrayusers)

          
      }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return arrFilter.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
          guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? AddUserTableViewCell
                               else{
                                   return UITableViewCell()
                           }
        
        cell.usernom.text = arrFilter[indexPath.row].firstName + " " + arrFilter[indexPath.row].lastName
        
        let image = self.arrFilter[indexPath.row].image
              
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
              //  selectarrayusers.append(arrFilter[index.row].id)
                 
                let dddddd = try Userscells[index.row].jsonData
                               // To get dictionary from `Data`
                do {
                    let json = try JSONSerialization.jsonObject(with: dddddd(), options: [])
                    guard let dictionary = json as? [String : Any] else { return }
                    
                    selectarrayusers.append(dictionary)
                    
                } catch {
                print(error.localizedDescription)
                }
                

            }
        }
      //  print(selectarrayusers)
        //print(selectarrayusers.count)
        
        
       
        
        
        if (selectarrayusers.count == 1) {
            numberusers.text = "1 utilisateur"
        }
            
             if (selectarrayusers.count == 0) {
                                         numberusers.text = "0 utilisateur"
                                     }
        
        if (selectarrayusers.count >= 2) {
            numberusers.text = (String(selectarrayusers.count) + " utilisateurs")

            
        }

        
        
    }
    
    
}

///// SEARCHHHHHH

extension AddRoomViewController:UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else
        {
            arrFilter = Userscells
            tvuser.reloadData()
            return
        }
        arrFilter = Userscells.filter({ (ussss) -> Bool in
         
            return ussss.firstName.lowercased().contains(searchText.lowercased())
        })
        tvuser.reloadData()
       }
    
    
}


