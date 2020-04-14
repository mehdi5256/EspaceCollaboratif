//
//  NetworkURL.swift
//  EspaceCollaboratif
//
//  Created by mehdi on 4/6/20.
//  Copyright © 2020 mehdi drira. All rights reserved.
//

import Foundation
    

public var SelectAllRoomsURL = "http://61b75529.ngrok.io/room"
public var SelectAllUserURL = "http://61b75529.ngrok.io/user"

//keycloak

public var tokenURL = URL(string: "http://2977d311.ngrok.io/auth/realms/espace_collaborative/protocol/openid-connect/token")!
      
public var authURL = URL(string: "http://2977d311.ngrok.io/auth/realms/espace_collaborative/protocol/openid-connect/auth")!

public var redirectURL = URL(string: "accretio://mobile/loginsuccess")!

public var ClientSecret = "8e9c9737-7c84-4111-b2e9-c4d2479a2869"

public var ClientId = "quarkus-app"

public var loggedUser = "http://61b75529.ngrok.io/user/me"


// *************************
//Jitsi url


public var jitsiURL = "https://meet.jit.si/"




// EVENT BUS websocket

public var eventbusURL = "0.tcp.ngrok.io"

public var portNumber = 11244


// perist chat msg

public var persisturl = "http://61b75529.ngrok.io/msg/room/1/ \(ViewController.idroom)"







