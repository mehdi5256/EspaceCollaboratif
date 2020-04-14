//
//  RoomsViewController.swift
//  ncnhlhjitsi
//
//  Created by mehdi drira on 3/9/20.
//  Copyright © 2020 mehdi drira. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage


class RoomsViewController: UIViewController {
    
    @IBOutlet weak var tv: UITableView!
    @IBOutlet weak var FloatingButton: UIButton!
    
    //   var allTvShow:NSArray = []
  //  var allTvShow1:NSArray = []
    var roomsArray:[Room1] = []
    var usersCell: [User1] = []

    let roomService = RoomService()
    
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
       

        setupButton()
        fetchRooms()
        
         }
  
    func fetchRooms(){
        roomService.getAll(){ (rooms) in
            self.roomsArray = rooms
        //    print (self.roomsArray)
            self.tv.reloadData()

        }
    }
    
    
    func setupButton() {
        NSLayoutConstraint.activate([
            FloatingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -36),
            FloatingButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -36),
            FloatingButton.heightAnchor.constraint(equalToConstant: 60),
            FloatingButton.widthAnchor.constraint(equalToConstant: 60)
        ])
        FloatingButton.layer.cornerRadius = 25
        FloatingButton.layer.masksToBounds = true
        // floatingButton.layer.borderColor = UIColor.black.cgColor
        // floatingButton.layer.borderWidth = 3
        FloatingButton.clipsToBounds = true
    }
    
}



extension RoomsViewController:UITableViewDataSource{
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return roomsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? RoomsTableViewCell
            else{
                return UITableViewCell()
        }
    
        cell.RoomName.text = self.roomsArray[indexPath.row].name!
        cell.UserName.text = self.roomsArray[indexPath.row].subject!
        cell.NumPoste.text  =  (self.roomsArray[indexPath.row].id!).description
        cell.selectionStyle = .none
        self.usersCell = roomsArray[indexPath.row].users
        
        
       // print (usersCell.count)

     //   print(usersCell)
        
        
        
      let frequency = indexPath.row % 10;
        switch (frequency) {
        case 0:
            cell.setGradientBackground(colorOne: Colors.skyblue, colorTwo: Colors.skyblue2)
            break;
        case 1:
            cell.setGradientBackground(colorOne: Colors.purple, colorTwo: Colors.blue)
            break;
            
        case 2:
            cell.setGradientBackground(colorOne: Colors.purple1, colorTwo: Colors.purple2)
            break;
            
        case 3:
            cell.setGradientBackground(colorOne: Colors.orange1, colorTwo: Colors.orange2)
         break;
        case 4:
            cell.setGradientBackground(colorOne: Colors.lightGrey, colorTwo: Colors.veryDarkGrey)
            break;
        //up to case 9
        default:
            break;
        }
        
        return cell
    }
    
    
    
    
}

extension RoomsViewController: UICollectionViewDataSource,UICollectionViewDelegate{
    
    
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return usersCell.count
        }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //print(usersCell.count)

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collection", for: indexPath) as? UserCollectionViewCell
                   else{
                       return UserCollectionViewCell()
               }
             
        let image = self.usersCell[indexPath.row].image
       
        cell.UserImage.af.setImage(withURL: URL(string: image)!)
        
        
        
        if (indexPath.row) == 3 {

            cell.lblnmbruser.isHidden = false
            cell.lblnmbruser.text = "+" + (usersCell.count-4).description

        }
        if (indexPath.row) >= 4{
            
            cell.isHidden = true
            
        }
     
        
        return cell
        
    }
    
    
}

extension RoomsViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return -130
    }
    
    
    
    
}

extension RoomsViewController:UITableViewDelegate{
    
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "todetail", sender: indexPath)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "todetail"{
            let DVC = segue.destination as! ViewController
            let indice = sender as! IndexPath
            //let showsDict = roomsArray[indice.row] as! Dictionary<String,Any>
            DVC.nomroom = roomsArray[indice.row].name
            ViewController.idroom = roomsArray[indice.row].id
            //DVC.overview = showsDict["summary"] as! String
           // let imageDict = showsDict["image"] as! Dictionary<String,String>
           // DVC.image = imageDict["medium"] as! String
            // DVC.image = images[indice.row]
            navigationItem.backBarButtonItem = UIBarButtonItem(title: DVC.nomroom , style: .plain, target: nil, action: nil)
            
            
        }
    }
}
