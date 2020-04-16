//
//  NetworkURL.swift
//  EspaceCollaboratif
//
//  Created by mehdi on 4/6/20.
//  Copyright © 2020 mehdi drira. All rights reserved.
//

import Foundation
    

public var SelectAllRoomsURL = "http://9e9fd64a.ngrok.io/room"
public var SelectAllUserURL = "http://9e9fd64a.ngrok.io/user"

//keycloak

public var tokenURL = URL(string: "http://6f862abe.ngrok.io/auth/realms/espace_collaborative/protocol/openid-connect/token")!
      
public var authURL = URL(string: "http://6f862abe.ngrok.io/auth/realms/espace_collaborative/protocol/openid-connect/auth")!

public var redirectURL = URL(string: "accretio://mobile/loginsuccess")!

public var ClientSecret = "8e9c9737-7c84-4111-b2e9-c4d2479a2869"

public var ClientId = "quarkus-app"

public var loggedUser = "http://9e9fd64a.ngrok.io/user/me"


// *************************
//Jitsi url


public var jitsiURL = "https://meet.jit.si/"




// EVENT BUS websocket

public var eventbusURL = "0.tcp.ngrok.io"

public var portNumber = 11043


// perist chat msg

public var persisturl = ""








