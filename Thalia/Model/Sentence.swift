//
//  Sentence.swift
//  Thalia
//
//  Created by Alessio Di Matteo on 21/02/2020.
//  Copyright © 2020 Samuel Kebis. All rights reserved.
//

import Foundation

class Sentence: Codable {
    //    name of the character
    var character : String
    //    sentence of the character
    var line : String
    //    record name made by user
    var audioFile : String?
    
    init(_ character : String ,_ line : String) {
        self.character = character
        self.line = line
    }
}
