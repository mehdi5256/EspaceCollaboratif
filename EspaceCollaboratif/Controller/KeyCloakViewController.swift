//
//  KeyCloakViewController.swift
//  EspaceCollaboratif
//
//  Created by mehdi on 4/6/20.
//  Copyright © 2020 mehdi drira. All rights reserved.
//

import UIKit
import AppAuth
import Alamofire

class KeyCloakViewController: UIViewController {
    private var authState: OIDAuthState?
    var userdetail: User1!


    @IBOutlet weak var BtnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        BtnLogin.layer.masksToBounds = false
                        BtnLogin.layer.cornerRadius = BtnLogin.frame.height/2
                        BtnLogin.clipsToBounds = true

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func KeyCloak(_ sender: Any) {
        

      
        
        let configuration = OIDServiceConfiguration(authorizationEndpoint: authURL, tokenEndpoint: tokenURL)
        
        let request2 = OIDAuthorizationRequest(configuration: configuration, clientId: ClientId, clientSecret: ClientSecret , scope: nil, redirectURL: redirectURL, responseType: OIDResponseTypeCode, state: nil, nonce: nil, codeVerifier: nil, codeChallenge: nil, codeChallengeMethod: nil, additionalParameters: nil)
                          
             
             let appDelegate = UIApplication.shared.delegate as! AppDelegate

             appDelegate.currentAuthorizationFlow = OIDAuthState.authState(byPresenting: request2, presenting: self, callback: { (state, error) in

        
                               if error != nil {
                                 let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                   let vc = storyboard.instantiateInitialViewController()
                                   vc?.modalPresentationStyle = .fullScreen
                                    self.present(vc!, animated: false, completion: nil)
                                   self.dismiss(animated: false, completion: nil)
                                   return
                               }
                
                
                
               // print(state?.lastTokenResponse?.accessToken as! String)
                self.authState = state
                
                
                       
                       let headers: HTTPHeaders = [
                       "Authorization": "Bearer \(state?.lastTokenResponse?.accessToken as! String)" ,
                              "Accept": "application/json"
                          ]
                       AF.request(loggedUser,method: .get, headers: headers).responseJSON{
                                        response in

                         //   print (response)
                           let userloggedarray = (response.value as! NSObject)
                                 var userlogged: User1!
                                 do{
                                     userlogged = try JSONDecoder().decode(User1.self, from: try! JSONSerialization.data(withJSONObject: userloggedarray))
                                    self.userdetail = userlogged
                                  //  print(self.userdetail)
                                  //  UserDefaults.standard.set(self.userdetail, forKey: "ud")
                                    
                                    UserDefaultService.idUD = userlogged.id
                                    UserDefaultService.firstNameUD = userlogged.firstName
                                    UserDefaultService.lasttNameUD = userlogged.lastName
                                    UserDefaultService.emailUD = userlogged.email
                                    UserDefaultService.IMGUD = userlogged.image


                                   // print(UserDefaultService.idUD)
                                    
                                 } catch let error as NSError {
                                     print("Failed to load: \(error.description)")
                                 }
                        //      completion(userlogged)
                             }
                      
                      
               
                self.performSegue(withIdentifier: "accueil", sender: self)

                
             //    ssoSigned(authState: state!)
                           }
                   )}
    
    
    
   
   
    
    }
    

