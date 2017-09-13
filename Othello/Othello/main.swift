//
//  main.swift
//  Othello
//
//  Created by kaori hirata on 2017-09-12.
//  Copyright © 2017 kaori hirata. All rights reserved.
//

import Foundation

print("WELCOM TO OTHELLO GAME")

struct Player {
    var mark : String
    init(mark:String) {
        self.mark = mark
    }
}

var objPlayer = Player(mark: "O")

print(objPlayer.mark)
