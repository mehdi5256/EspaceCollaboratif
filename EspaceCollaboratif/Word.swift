//
//  Word.swift
//  VertxWebsocket
//
//  Created by hamadi aziz on 27/02/2020.
//  Copyright © 2020 hamadi aziz. All rights reserved.
//

import UIKit

public class Word {
    public init(_ word: String) {
        self.word = word
    }
    
    let word: String
    var scrambled: String = ""
    var reversed: String = ""
}
