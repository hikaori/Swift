//
//  Player.swift
//  Othello
//
//  Created by kaori hirata on 2017-09-12.
//  Copyright © 2017 kaori hirata. All rights reserved.
//

import Cocoa

struct Player {
    
    enum Chip: Int {
        case 🍏
        case 🐨
        case 🐷
    }
    
    var chip : Int
    
    
    init(chip:String) {
        let myChip = Chip.🐨
        self.chip = myChip.rawValue
    }
    
}
