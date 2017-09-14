//
//  Board.swift
//  Othello
//
//  Created by kaori hirata on 2017-09-12.
//  Copyright © 2017 kaori hirata. All rights reserved.
//

import Cocoa

class Board: CustomStringConvertible {
    var currentBoard:[[Int]]
    var rowCount: Int {
        get {return currentBoard.count - 1}
    }
    var colCount: Int{
        get{return currentBoard[0].count - 1}
    }
    
    init() {
        self.currentBoard = [[0,0,0,0,0,0,0,0],
                     [0,0,0,0,0,0,0,0],
                     [0,0,0,0,0,0,0,0],
                     [0,0,0,1,2,0,0,0],
                     [0,0,0,2,1,0,0,0],
                     [0,0,0,0,0,2,0,0],
                     [0,0,0,0,0,0,0,0],
                     [0,0,0,0,0,0,0,0],
                     [0,0,0,0,0,0,0,0],
        ]
    }
    
    public var description: String {
        return "Board: \(currentBoard)"
    }
    
    func displayBoard(board:Board)->Void{
        var line = 0
        
        print("-----------------------")
        for _ in 0...rowCount-1{
            for sell in self.currentBoard[line] {  // create one row
                print("| \(sell) | ", terminator: "")
            }
            print("")
            print("-----------------------")
            line += 1
        }
    }
}
