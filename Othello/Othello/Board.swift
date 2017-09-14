//
//  Board.swift
//  Othello
//
//  Created by kaori hirata on 2017-09-12.
//  Copyright © 2017 kaori hirata. All rights reserved.
//

import Cocoa

class Board: CustomStringConvertible {
    var boad:[[Int]]
    var rowCount: Int {
        get {return boad.count - 1}
    }
    var colCount: Int{
        get{return boad[0].count - 1}
    }
    
    init() {
        self.boad = [[0,0,0,0,0,0,0,0],
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
        return "Board: \(boad)"
    }
    
    func displayBoard(bord:Board)->Void{
        var line = 0
//        let row = boad.count
        //let colm = boad[0].count
        //print("row:\(row) colm:\(colm)")
        
        print("-----------------------")
        for _ in 0...rowCount-1{
            for sell in boad [ line ] {  // create one row
                print("| \(sell) | ", terminator: "")
            }
            print("")
            print("-----------------------")
            line += 1
        }
    }
}
