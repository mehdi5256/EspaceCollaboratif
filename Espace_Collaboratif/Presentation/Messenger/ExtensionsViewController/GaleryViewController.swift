//
//  GaleryViewController.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 8/17/20.
//  Copyright © 2020 mehdi. All rights reserved.
//

import UIKit
import Alamofire


// Open gallery and upload image , file ,
extension MessengerViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        convertImageToBase64(selectedImage)
        // Set photoImageView to display the selected image.           //  imgv.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func OpenSideUpMeny(_ sender: Any) {
        actionSheet()
    }
    
    func actionSheet() {
        let sheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let gallery = UIAlertAction(title: "Bibliothéque Photo", style: .default) { (gallery) in
            // gallery Code
            
            let imagecontrooler = UIImagePickerController()
            imagecontrooler.delegate = self
            imagecontrooler.sourceType = .photoLibrary
            
            
            
            self.present(self.imagePicker
                , animated: true
                , completion: nil)
            
        }
        
        gallery.setValue(0, forKey: "titleTextAlignment")
        gallery.setValue(UIColor.black, forKey: "titleTextColor")
        
        
        gallery.setValue(UIImage(systemName: "photo"), forKey: "image")
        sheet.addAction(gallery)
        
        
        let camera = UIAlertAction(title: "Caméra", style: .default) { (camera) in
            // Facebook Code
    
        }
        
        
        camera.setValue(0, forKey: "titleTextAlignment")
        camera.setValue(UIImage(systemName: "camera"), forKey: "image")
        camera.setValue(UIColor.black, forKey: "titleTextColor")
        
        sheet.addAction(camera)
        
        
       
        
        
        let doc = UIAlertAction(title: "Document", style: .default) { (doc) in
            // Instagram Code
        }
        doc.setValue(0, forKey: "titleTextAlignment")
        doc.setValue(UIImage(systemName: "doc"), forKey: "image")
        doc.setValue(UIColor.black, forKey: "titleTextColor")
        
        sheet.addAction(doc)
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        sheet.addAction(cancel)
        
        // sheet.view.backgroundColor = .white
        
        present(sheet, animated: true, completion: nil)
        
        
        let sondage = UIAlertAction(title: "Sondage", style: .default) { (sondage) in
                       // Facebook Code
                   print("sondage")
                   let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                                let vc = storyBoard.instantiateViewController(withIdentifier: "AddSondageViewController") as! AddSondageViewController
                          vc.modalPresentationStyle = .overFullScreen
                   self.present(vc,animated:true,completion: nil)

               
                   }
                   
                   
                   sondage.setValue(0, forKey: "titleTextAlignment")
                   sondage.setValue(UIImage(systemName: "camera"), forKey: "rectangle.stack")
                   sondage.setValue(UIColor.black, forKey: "titleTextColor")
                   
                   sheet.addAction(sondage)
        
    }
    
    
    
    func convertImageToBase64(_ image: UIImage) -> String {
        let imageData:NSData = image.jpegData(compressionQuality: 0.4)! as NSData
        let strBase64 = imageData.base64EncodedString(options: .lineLength64Characters)
        // print(strBase64)
        
        interactor?.send(idroom: self.idroom, messagesend: "", type:"IMAGE", file: strBase64)
        
        //
        //                interactor?.postImage(type: "IMAGE", body: "", user: ["id":UserDefaultLogged.idUD], room: ["id":self.idroom!], file: strBase64)
        
        
        
        //                interactor?.PostMsg(type: "IMAGE", file: strBase64, room: ["id":self.idroom!], user: ["id":UserDefaultLogged.idUD], body: "")
        
        //
        //
        let myUrl = Keys.MobileIntegrationServer.baseURL + "/msg"

        let parameters: [String: Any] = [
            "type":"IMAGE",
            "body":"",
            "user":["id":UserDefaultLogged.idUD],
            "room":["id":self.idroom],
            "file":strBase64
        ]
        AF.request(myUrl, method: .post, parameters: parameters,encoding: JSONEncoding.init())
            .responseJSON { response in
                print(response.request)
                print(response.response)
                print(response.result)}
        //vider textfields
        // message.text = ""
        //
        //
        
        
        return strBase64
        
    }
    
    
    //               func convertBase64ToImage(_ str: String) -> UIImage {
    //                       let dataDecoded : Data = Data(base64Encoded: str, options: .ignoreUnknownCharacters)!
    //                       let decodedimage = UIImage(data: dataDecoded)
    //                   print(decodedimage)
    //
    //                       return decodedimage!
    //               }
    
    
    func convertUTCDateToLocalDate(dateToConvert:String) -> String {
        
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let convertedDate = format.date(from: dateToConvert)
        format.timeZone = TimeZone.current
        format.dateFormat = "HH:mm"
        let localDateStr = format.string(from: convertedDate!)
        return localDateStr
    }
    
}
