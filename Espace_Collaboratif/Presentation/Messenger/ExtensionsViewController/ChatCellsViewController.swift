//
//  TestExtensionViewController.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 8/17/20.
//  Copyright © 2020 mehdi. All rights reserved.
//

import UIKit

import Reactions


// extension table view mta3 l chat configuration des 4 cellules

extension MessengerViewController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
       
        switch NetworkStatus.Connection() {
        case false:
            if ( indexPath.row == MessagesArrayCoreData.count - 1)
                   {
                       print("came to last row")
                 //      btnlastrow.isHidden = true
                   }

            if ( indexPath.row != MessagesArrayCoreData.count - 1)
            {
               // btnlastrow.isHidden = false
                
                
                
            }
        default:
            if ( indexPath.row == msgarray.count - 1)
                   {
                       print("came to last row")
                      // btnlastrow.isHidden = true
                   }
            if ( indexPath.row != msgarray.count - 1)
            {
              //  btnlastrow.isHidden = false
                
                
                
            }
        }
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        
//        switch NetworkStatus.Connection() {
//        case false:
//            print("not conncted")
//            print("connected")
//            if  MessagesArrayCoreData.count == 0
//            {
//                tv.isHidden = true
//                emptytvimg.isHidden = false
//            }
//            else{
//                tv.isHidden = false
//                emptytvimg.isHidden = true
//
//            }
//            return MessagesArrayCoreData.count
//        default:
//            print("connected")
//            if  msgarray.count == 0
//            {
//                tv.isHidden = true
//                emptytvimg.isHidden = false
//            }
//            else{
//                tv.isHidden = false
//                emptytvimg.isHidden = true
//
//            }
//            return msgarray.count
//        }
//
        
//            if  MessagesArrayCoreData.count == 0
//            {
//                tv.isHidden = true
//                emptytvimg.isHidden = false
//            }
//            else{
//                tv.isHidden = false
//                emptytvimg.isHidden = true
//
//            }
        return msgarray.count
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

             let TextSenderCell = tv.dequeueReusableCell(withIdentifier: "TextSenderCell", for: indexPath) as! TextSenderCell
            TextSenderCell.delegate = self
        
        let TextSenderCell1 = tv.dequeueReusableCell(withIdentifier: "TextSenderCell1", for: indexPath) as! TextSenderCell1
            TextSenderCell1.delegate = self


            let TextReceiverCell = tv.dequeueReusableCell(withIdentifier: "TextReceiverCell", for: indexPath) as! TextReceiverCell
                TextReceiverCell.delegate = self
        
            let TextReceiverCell1 = tv.dequeueReusableCell(withIdentifier: "TextReceiverCell1", for: indexPath) as! TextReceiverCell1
            TextReceiverCell1.delegate = self

            
            let ImageSenderCell = tv.dequeueReusableCell(withIdentifier: "ImageSenderCell", for: indexPath) as! ImageSenderCell
                       
            let ImageReceiverCell = tv.dequeueReusableCell(withIdentifier: "ImageReceiverCell", for: indexPath) as! ImageReceiverCell

        
        switch NetworkStatus.Connection() {
        case false:
            print("not connected")
            
            if (self.MessagesArrayCoreData[indexPath.row].type == "IMAGE" && self.MessagesArrayCoreData[indexPath.row].imguser == UserDefaultLogged.IMGUD ){
                
                
                ImageSenderCell.receiverName.text = (self.MessagesArrayCoreData[indexPath.row].firstname ?? "") + " " + (self.MessagesArrayCoreData[indexPath.row].lastname ?? "")
                //cell3.msgtxt.text = self.msgarray[indexPath.row].body
                let image = MessagesArrayCoreData[indexPath.row].imguser ?? ""
                let imagechat = MessagesArrayCoreData[indexPath.row].file
                
                ImageSenderCell.receiverImage.kf.setImage(with: URL(string: image))
                // cellimageother.imgsend.kf.setImage(with: URL(string: imagechat!))
                ImageSenderCell.imgChat.kf.setImage(with: URL(string: imagechat!), placeholder: UIImage(named: "loadingimage")) {
                    result in
                    switch result {
                    case .success:
                        break
                    case .failure:
                        ImageSenderCell.imgChat.image = UIImage(named: "loadingimage")!
                    }
                }
                
                
                return ImageSenderCell
            }
            
            
            
            if (self.MessagesArrayCoreData[indexPath.row].type == "IMAGE"){
                
                ImageReceiverCell.senderName.text = (self.MessagesArrayCoreData[indexPath.row].firstname ?? "") + " " + (self.MessagesArrayCoreData[indexPath.row].lastname ?? "")
                //cell3.msgtxt.text = self.msgarray[indexPath.row].body
                let image = MessagesArrayCoreData[indexPath.row].imguser ?? ""
                let imagechat = MessagesArrayCoreData[indexPath.row].file
                
                ImageReceiverCell.senderPicture.kf.setImage(with: URL(string: image))
                //   cellimageme.imagechat.kf.setImage(with: URL(string: imagechat!))
                
                ImageReceiverCell.imgChat.kf.setImage(with: URL(string: imagechat!), placeholder: UIImage(named: "loadingimage")) {
                    result in
                    switch result {
                    case .success:
                        break
                    case .failure:
                        ImageReceiverCell.imgChat.image = UIImage(named: "loadingimage")!
                    }
                }
               
                
                return ImageReceiverCell
                
            }
            
            
            if (self.MessagesArrayCoreData[indexPath.row].imguser  == UserDefaultLogged.IMGUD){
                
                //                TextSenderCell.receiverName.text = (self.MessagesArrayCoreData[indexPath.row].firstname ?? "") + " " + (self.MessagesArrayCoreData[indexPath.row].lastname ?? "")
                
                TextSenderCell1.txt.text = self.MessagesArrayCoreData[indexPath.row].body
                
                let image = MessagesArrayCoreData[indexPath.row].imguser ?? ""
                TextSenderCell1.img.kf.setImage(with: URL(string: image))
                return TextSenderCell1
            }
                
            else {
//                TextReceiverCell.senderName.text = (self.MessagesArrayCoreData[indexPath.row].firstname ?? "") + " " + (self.MessagesArrayCoreData[indexPath.row].lastname ?? "")
                
                TextReceiverCell1.txt.text = self.MessagesArrayCoreData[indexPath.row].body
                
                let image = MessagesArrayCoreData[indexPath.row].imguser ?? ""
                TextReceiverCell1.img.kf.setImage(with: URL(string: image))
                
                
                return TextReceiverCell1
            }
            
            
        default:
            if (self.msgarray[indexPath.row].type == "SONDAGE"){
                           
                           guard let cellsondage = tv.dequeueReusableCell(withIdentifier: "SondageTableViewCell", for: indexPath) as? SondageTableViewCell else {
                           return tv.dequeueReusableCell(withIdentifier: "SondageTableViewCell", for: indexPath)
                                   }
                
                cellsondage.delegate = self
                cellsondage.voterBtn.tag = indexPath.row


                           let sonadgeindex = msgarray[indexPath.item]
                           cellsondage.questionsondage.text = sonadgeindex.body
                           
                           self.choixcell = sonadgeindex.choix ?? []
                           
                           return cellsondage

                           
                       }
            
            
            if (self.msgarray[indexPath.row].type == "IMAGE" && self.msgarray[indexPath.row].user.image == UserDefaultLogged.IMGUD ){
                
                
                ImageSenderCell.receiverName.text = self.msgarray[indexPath.row].user.firstName + " " + self.msgarray[indexPath.row].user.lastName
                //cell3.msgtxt.text = self.msgarray[indexPath.row].body
                let image = msgarray[indexPath.row].user.image
                let imagechat = msgarray[indexPath.row].file
                
                ImageSenderCell.receiverImage.kf.setImage(with: URL(string: image))
                // cellimageother.imgsend.kf.setImage(with: URL(string: imagechat!))
                ImageSenderCell.imgChat.kf.setImage(with: URL(string: imagechat!), placeholder: UIImage(named: "loadingimage")) {
                    result in
                    switch result {
                    case .success:
                        break
                    case .failure:
                        ImageSenderCell.imgChat.image = UIImage(named: "loadingimage")!
                    }
                }
                // Reactionsss
                self.reactionsArray = msgarray[indexPath.row].reactions ?? []
                print(reactionsArray.count)
                
                return ImageSenderCell
            }
            
            
            
            if (self.msgarray[indexPath.row].type == "IMAGE"){
                
                ImageReceiverCell.senderName.text = self.msgarray[indexPath.row].user.firstName + " " + self.msgarray[indexPath.row].user.lastName
                //cell3.msgtxt.text = self.msgarray[indexPath.row].body
                let image = msgarray[indexPath.row].user.image
                let imagechat = msgarray[indexPath.row].file
                
                ImageReceiverCell.senderPicture.kf.setImage(with: URL(string: image))
                //   cellimageme.imagechat.kf.setImage(with: URL(string: imagechat!))
                
                ImageReceiverCell.imgChat.kf.setImage(with: URL(string: imagechat!), placeholder: UIImage(named: "loadingimage")) {
                    result in
                    switch result {
                    case .success:
                        break
                    case .failure:
                        ImageReceiverCell.imgChat.image = UIImage(named: "loadingimage")!
                    }
                }
                // Reactionsss
                self.reactionsArray = msgarray[indexPath.row].reactions ?? []
                print(reactionsArray.count)
                
                return ImageReceiverCell
                
            }
            
            
            if (self.msgarray[indexPath.row].user.image  == UserDefaultLogged.IMGUD){
                
//                TextSenderCell.receiverName.text =        self.msgarray[indexPath.row].user.firstName + " " + self.msgarray[indexPath.row].user.lastName
                
                TextSenderCell1.txt.text = self.msgarray[indexPath.row].body
                let image = msgarray[indexPath.row].user.image
                TextSenderCell1.img.kf.setImage(with: URL(string: image))
                
                // Reactionsss
                reactionsArray = msgarray[indexPath.row].reactions ?? []
                TextSenderCell1.BtnReaction.tag = indexPath.row

                self.reactionsArray = msgarray[indexPath.row].reactions ?? []
                TextSenderCell1.ReactionBtn.tag = indexPath.row

                print(reactionsArray.count)
                TextSenderCell1.ViewReaction.isHidden = true
                if (msgarray[indexPath.row].reactions?.count ?? 0 > 0 ){
                    TextSenderCell1.ViewReaction.isHidden = false
                }
//
//                TextSenderCell1.BtnReaction.setTitle(String("\(reactionsArray.count) reactions"), for: .normal)
                TextSenderCell1.BtnReaction.setTitle(String(""), for: .normal)
                TextSenderCell1.ReactionSummary.text = String(reactionsArray.count)
                
                //                UserDefaultLogged.idmsg  = msgarray[indexPath.row].id!
                //                print(  UserDefaultLogged.idmsg )
                var typereact =  [String]()
                
                for i in msgarray[indexPath.row].reactions ?? []{
                    
                    
                    
                    print("xdkflkhfdjhjfdskfjsk")
                    typereact.append(i.type!)
                    print(typereact)
                    
                    
                    if ["LIKE", "LOVE", "INTERESTING", "BRAVO"].allSatisfy(typereact.contains) {
                        print("1")
                        TextSenderCell1.ReactionSummary.reactions = [Reaction.facebook.like,Reaction.facebook.love,Reaction.facebook.interesting,Reaction.facebook.bravo]
                        
                    }
                        
                    else if ["INTERESTING", "LOVE", "BRAVO"].allSatisfy(typereact.contains) {
                        print("2")
                         TextSenderCell1.ReactionSummary.reactions = [Reaction.facebook.love,Reaction.facebook.interesting,Reaction.facebook.bravo]
                    }
                    else if ["INTERESTING", "LOVE", "LIKE"].allSatisfy(typereact.contains) {
                        print("15")
                        TextSenderCell1.ReactionSummary.reactions = [Reaction.facebook.like,Reaction.facebook.love,Reaction.facebook.interesting]
                    }
                        
                    else if ["INTERESTING", "BRAVO", "LIKE"].allSatisfy(typereact.contains) {
                        print("3")
                        TextSenderCell1.ReactionSummary.reactions = [Reaction.facebook.like,Reaction.facebook.interesting,Reaction.facebook.bravo]
                    }
                    else if ["LOVE", "BRAVO", "LIKE"].allSatisfy(typereact.contains) {
                        print("4")
                        TextSenderCell1.ReactionSummary.reactions = [Reaction.facebook.like,Reaction.facebook.love,Reaction.facebook.bravo]
                    }
                        
                        
                    else if ["INTERESTING", "LOVE"].allSatisfy(typereact.contains) {
                        print("5")
                        TextSenderCell1.ReactionSummary.reactions = [Reaction.facebook.love,Reaction.facebook.interesting]
                    }
                        
                    else if ["INTERESTING", "BRAVO"].allSatisfy(typereact.contains) {
                        print("6")
                         TextSenderCell1.ReactionSummary.reactions = [Reaction.facebook.interesting,Reaction.facebook.bravo]
                    }
                        
                    else if ["INTERESTING", "LIKE"].allSatisfy(typereact.contains) {
                        print("7")
                       TextSenderCell1.ReactionSummary.reactions = [Reaction.facebook.interesting,Reaction.facebook.like]
                    }
                        
                    else  if ["LOVE", "BRAVO"].allSatisfy(typereact.contains) {
                        print("8")
                        TextSenderCell1.ReactionSummary.reactions = [Reaction.facebook.love,Reaction.facebook.bravo]
                    }
                        
                        
                        
                    else  if ["LIKE", "LOVE"].allSatisfy(typereact.contains) {
                        print("9")
                       TextSenderCell1.ReactionSummary.reactions = [Reaction.facebook.like,Reaction.facebook.love]
                    }
                        
                    else  if ["LIKE", "BRAVO"].allSatisfy(typereact.contains) {
                        print("10")
                       TextSenderCell1.ReactionSummary.reactions = [Reaction.facebook.like,Reaction.facebook.bravo]
                    }
                        
                        
                        
                    else  if ["LIKE"].allSatisfy(typereact.contains) {
                        print("11")
                        TextSenderCell1.ReactionSummary.reactions = [Reaction.facebook.like]
                    }
                    else  if ["LOVE"].allSatisfy(typereact.contains) {
                        print("12")
                        TextSenderCell1.ReactionSummary.reactions = [Reaction.facebook.love]
                    }
                        
                    else  if ["BRAVO"].allSatisfy(typereact.contains) {
                        print("13")
                        TextSenderCell1.ReactionSummary.reactions = [Reaction.facebook.bravo]
                    }
                        
                    else  if ["INTERESTING"].allSatisfy(typereact.contains) {
                        print("14")
                        TextSenderCell1.ReactionSummary.reactions = [Reaction.facebook.interesting]
                    }
                    
                    
                }
                
                
                
                return TextSenderCell1
            }
                
                
                
                
                
            else {
                //                TextReceiverCell.senderName.text = self.msgarray[indexPath.row].user.firstName + " " + self.msgarray[indexPath.row].user.lastName
                
                TextReceiverCell1.txt.text = self.msgarray[indexPath.row].body
                let image = msgarray[indexPath.row].user.image
                TextReceiverCell1.img.kf.setImage(with: URL(string: image))
                
//                // Reactionsss
                self.reactionsArray = msgarray[indexPath.row].reactions ?? []
                TextReceiverCell1.BtnReaction.tag = indexPath.row



                print(reactionsArray.count)

                self.reactionsArray = msgarray[indexPath.row].reactions ?? []
                TextReceiverCell1.ReactionBtn.tag = indexPath.row
                TextReceiverCell1.ViewReaction.isHidden = true

                if ((msgarray[indexPath.row].reactions ?? []).count > 0){
                    TextReceiverCell1.ViewReaction.isHidden = false
                }
                
                
                  TextReceiverCell1.BtnReaction.setTitle(String(""), for: .normal)
                TextReceiverCell1.ReactionSummary.text = String(reactionsArray.count)
                
                //                UserDefaultLogged.idmsg  = msgarray[indexPath.row].id!
                //                print(  UserDefaultLogged.idmsg )
                var typereact =  [String]()
                
                for i in msgarray[indexPath.row].reactions ?? []{
                    
                    
                    
                    print("xdkflkhfdjhjfdskfjsk")
                    typereact.append(i.type!)
                    print(typereact)
                    
                    
                    if ["LIKE", "LOVE", "INTERESTING", "BRAVO"].allSatisfy(typereact.contains) {
                        print("1")
                        TextReceiverCell1.ReactionSummary.reactions = [Reaction.facebook.like,Reaction.facebook.love,Reaction.facebook.interesting,Reaction.facebook.bravo]
                        
                    }
                        
                    else if ["INTERESTING", "LOVE", "BRAVO"].allSatisfy(typereact.contains) {
                        print("2")
                        TextReceiverCell1.ReactionSummary.reactions = [Reaction.facebook.love,Reaction.facebook.interesting,Reaction.facebook.bravo]
                    }
                    else if ["INTERESTING", "LOVE", "LIKE"].allSatisfy(typereact.contains) {
                        print("15")
                        TextReceiverCell1.ReactionSummary.reactions = [Reaction.facebook.like,Reaction.facebook.love,Reaction.facebook.interesting]
                    }
                        
                    else if ["INTERESTING", "BRAVO", "LIKE"].allSatisfy(typereact.contains) {
                        print("3")
                        TextReceiverCell1.ReactionSummary.reactions = [Reaction.facebook.like,Reaction.facebook.interesting,Reaction.facebook.bravo]
                    }
                    else if ["LOVE", "BRAVO", "LIKE"].allSatisfy(typereact.contains) {
                        print("4")
                        TextReceiverCell1.ReactionSummary.reactions = [Reaction.facebook.like,Reaction.facebook.love,Reaction.facebook.bravo]
                    }
                        
                        
                    else if ["INTERESTING", "LOVE"].allSatisfy(typereact.contains) {
                        print("5")
                        TextReceiverCell1.ReactionSummary.reactions = [Reaction.facebook.love,Reaction.facebook.interesting]
                    }
                        
                    else if ["INTERESTING", "BRAVO"].allSatisfy(typereact.contains) {
                        print("6")
                        TextReceiverCell1.ReactionSummary.reactions = [Reaction.facebook.interesting,Reaction.facebook.bravo]
                    }
                        
                    else if ["INTERESTING", "LIKE"].allSatisfy(typereact.contains) {
                        print("7")
                        TextReceiverCell1.ReactionSummary.reactions = [Reaction.facebook.interesting,Reaction.facebook.like]
                    }
                        
                    else  if ["LOVE", "BRAVO"].allSatisfy(typereact.contains) {
                        print("8")
                        TextReceiverCell1.ReactionSummary.reactions = [Reaction.facebook.love,Reaction.facebook.bravo]
                    }
                        
                        
                        
                    else  if ["LIKE", "LOVE"].allSatisfy(typereact.contains) {
                        print("9")
                        TextReceiverCell1.ReactionSummary.reactions = [Reaction.facebook.like,Reaction.facebook.love]
                    }
                        
                    else  if ["LIKE", "BRAVO"].allSatisfy(typereact.contains) {
                        print("10")
                        TextReceiverCell1.ReactionSummary.reactions = [Reaction.facebook.like,Reaction.facebook.bravo]
                    }
                        
                        
                        
                    else  if ["LIKE"].allSatisfy(typereact.contains) {
                        print("11")
                        TextReceiverCell1.ReactionSummary.reactions = [Reaction.facebook.like]
                    }
                    else  if ["LOVE"].allSatisfy(typereact.contains) {
                        print("12")
                        TextReceiverCell1.ReactionSummary.reactions = [Reaction.facebook.love]
                    }
                        
                    else  if ["BRAVO"].allSatisfy(typereact.contains) {
                        print("13")
                        TextReceiverCell1.ReactionSummary.reactions = [Reaction.facebook.bravo]
                    }
                        
                    else  if ["INTERESTING"].allSatisfy(typereact.contains) {
                        print("14")
                        TextReceiverCell1.ReactionSummary.reactions = [Reaction.facebook.interesting]
                    }
                    
                    
                    
                    
                }
                
                return TextReceiverCell1
            }
            
        }
        
    }
    
}




