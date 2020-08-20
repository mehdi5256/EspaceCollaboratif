////
////  SendBarViewController.swift
////  Espace_Collaboratif
////
////  Created by mehdi on 8/17/20.
////  Copyright © 2020 mehdi. All rights reserved.
////
//
import UIKit

extension MessengerViewController: UITextViewDelegate{
 
    func textViewDidChange(_ textView: UITextView)
    {
        if Whitespace(textView: message){
            btn.backgroundColor = UIColor.systemBlue
            
        }
        else{
            btn.backgroundColor = UIColor.systemBlue
        }
        
        if textView == self.message {
            self.btn.isEnabled = Whitespace(textView: message)
        }
        
       
        
    }
//    
//    //Configuration design textview mta3 chat
    func design(){
        message.layer.cornerRadius = 10
        message.layer.cornerRadius = 10
        message.layer.borderWidth = 1
        message.layer.borderColor = #colorLiteral(red: 0.9182453156, green: 0.9182668328, blue: 0.9182552695, alpha: 1)
        btn.layer.cornerRadius = 15
        
    }
    
    func designbuttonaftersend(){
        message.text = ""
        btn.backgroundColor = UIColor.systemBlue
        btn.isEnabled = false
        
    }
    
//    func scrollToBottom(animated: Bool) {
//        let sections = self.numberOfSections
//        let rows = self.numberOfRowsInSection(sections - 1)
//        if (rows > 0){
//            self.scrollToRowAtIndexPath(NSIndexPath(forRow: rows - 1, inSection: sections - 1), atScrollPosition: .Bottom, animated: true)
//        }
//    }
    
    // Configuration tableview show the last item
//    func scrolltobottom(animated:Bool){
//
//      //  switch NetworkStatus.Connection() {
////        case false:
////            let numberOfSections = self.tv.numberOfSections
////                  let numberOfRows = self.tv.numberOfRows(inSection: numberOfSections-1)
////
////                  let indexPath = IndexPath(row: numberOfRows-1 , section: numberOfSections-1)
////                  if MessagesArrayCoreData.count > 0{
////                      self.tv.scrollToRow(at: indexPath, at: UITableView.ScrollPosition.middle, animated: animated)
////                  }
////        default:
//            let numberOfSections = self.tv.numberOfSections
//                  let numberOfRows = self.tv.numberOfRows(inSection: numberOfSections-1)
//
//                  let indexPath = IndexPath(row: numberOfRows-1 , section: numberOfSections-1)
//                  if msgarray.count > 0{
//                      self.tv.scrollToRow(at: indexPath, at: UITableView.ScrollPosition.bottom, animated: animated)
//                  }
////        }
//
//
//    }
    
    // Fonction white space elimination
    func Whitespace(textView textView: UITextView) -> Bool {
        guard let text = textView.text,
            !text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).isEmpty else {
                // this will be reached if the text is nil (unlikely)
                // or if the text only contains white spaces
                // or no text at all
                return false
        }

        return true
    }
    
}
