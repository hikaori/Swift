//
//  Player.swift
//  Othello
//
//  Created by kaori hirata on 2017-09-12.
//  Copyright © 2017 kaori hirata. All rights reserved.
//

import Cocoa

struct Player {
    
    enum Storn: Int {
        case 🍏
        case 🐨
        case 🐷
    }
    
    var stone : Int
    
    
    init(stone:String) {
        let myStorn = Storn.🐨
        self.stone = myStorn.rawValue
    }
    
}
