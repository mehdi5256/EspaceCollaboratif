//
//  Word.swift
//  Espace_Collaboratif
//
//  Created by mehdi on 5/1/20.
//  Copyright © 2020 mehdi. All rights reserved.
//

import Foundation
import UIKit

public class Word {
    public init(_ word: String) {
        self.word = word
    }
    
    let word: String
    var scrambled: String = ""
    var reversed: String = ""
}
