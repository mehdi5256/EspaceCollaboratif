//
//  NetworkURL.swift
//  EspaceCollaboratif
//
//  Created by mehdi on 4/6/20.
//  Copyright © 2020 mehdi drira. All rights reserved.
//

import Foundation
    

public var SelectAllRoomsURL = "http://c440c4ff.ngrok.io/room"
public var SelectAllUserURL = "http://c440c4ff.ngrok.io/user"

//keycloak

public var tokenURL = URL(string: "http://c1ef51da.ngrok.io/auth/realms/espace_collaborative/protocol/openid-connect/token")!
      
public var authURL = URL(string: "http://c1ef51da.ngrok.io/auth/realms/espace_collaborative/protocol/openid-connect/auth")!

public var redirectURL = URL(string: "accretio://mobile/loginsuccess")!

public var ClientSecret = "8e9c9737-7c84-4111-b2e9-c4d2479a2869"

public var ClientId = "quarkus-app"

public var loggedUser = "http://c440c4ff.ngrok.io/user/me"


// *************************
//Jitsi url


public var jitsiURL = "https://mobile-int.accretio.io:8443/"




// EVENT BUS websocket

public var eventbusURL = "0.tcp.ngrok.io"

public var portNumber = 14312










