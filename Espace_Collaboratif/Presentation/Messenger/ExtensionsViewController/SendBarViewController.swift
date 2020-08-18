//
//  SendBarViewController.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 8/17/20.
//  Copyright © 2020 mehdi. All rights reserved.
//

import UIKit



///////// Extension mta3 bar elli tab3th beha l msg


extension MessengerViewController: UITextViewDelegate{
    
    
    //        func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
    //
    //            if text == "\n" {
    //                textView.resignFirstResponder()
    //                return false
    //            }
    //            return true
    //        }
    //
    
    
    func textViewDidChange(_ textView: UITextView)
    {
        if Whitespace(textView: message){
            btn.backgroundColor = #colorLiteral(red: 0.1902842224, green: 0.7560861707, blue: 0.6563670039, alpha: 1)
            
        }
        else{
            btn.backgroundColor = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)
        }
        
        if textView == self.message {
            self.btn.isEnabled = Whitespace(textView: message)
        }
        
        if textView.contentSize.height >= self.messageTextViewMaxHeight
        {
            textView.isScrollEnabled = true
        }
        else
        {
            textView.frame.size.height = textView.contentSize.height
            textView.isScrollEnabled = false
            
        }
    }
    
    //Configuration design textview mta3 chat
    func design(){
        message.layer.cornerRadius = 10
        message.layer.cornerRadius = 10
        message.layer.borderWidth = 1
        message.layer.borderColor = #colorLiteral(red: 0.1902842224, green: 0.7560861707, blue: 0.6563670039, alpha: 1)
        btn.layer.cornerRadius = 15
        
    }
    
    func designbuttonaftersend(){
        message.text = ""
        btn.backgroundColor = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)
        btn.isEnabled = false
        
    }
    
    // Configuration tableview show the last item
    func scrolltobottom(animated:Bool){
        
      //  switch NetworkStatus.Connection() {
//        case false:
//            let numberOfSections = self.tv.numberOfSections
//                  let numberOfRows = self.tv.numberOfRows(inSection: numberOfSections-1)
//
//                  let indexPath = IndexPath(row: numberOfRows-1 , section: numberOfSections-1)
//                  if MessagesArrayCoreData.count > 0{
//                      self.tv.scrollToRow(at: indexPath, at: UITableView.ScrollPosition.middle, animated: animated)
//                  }
//        default:
            let numberOfSections = self.tv.numberOfSections
                  let numberOfRows = self.tv.numberOfRows(inSection: numberOfSections-1)
                  
                  let indexPath = IndexPath(row: numberOfRows-1 , section: numberOfSections-1)
                  if msgarray.count > 0{
                      self.tv.scrollToRow(at: indexPath, at: UITableView.ScrollPosition.middle, animated: animated)
                  }
//        }
      
        
    }
    
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
    
//    // l baar mta3  msg tatl3 w tahbet ki tselectionni l msg
//    @objc func keyboardWillShow(notification: NSNotification) {
//        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
//            if self.view.frame.origin.y == 0 {
//                self.view.frame.origin.y -= keyboardSize.height
//            }
//        }
//    }
//
//    @objc func keyboardWillHide(notification: NSNotification) {
//        if self.view.frame.origin.y != 0 {
//            self.view.frame.origin.y = 0
//        }
//    }
}
