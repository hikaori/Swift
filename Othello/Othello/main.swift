//
//  main.swift
//  Othello
//
//  Created by kaori hirata on 2017-09-12.
//  Copyright © 2017 kaori hirata. All rights reserved.
//

import Foundation

print("==== OTHELLO GAME =======")
print("1 - person vs person")
print("2 - person vs computer")
print("enter your choice ")
let input = readLine()

var b = Board.init()
b.displayBoard(board: b)

var p1 = Player(chip: "k")
print(p1.chip)
var p2 = Player(chip: "k")
print(p2.chip)

var gm = GameManager.init()


func move(Gmanager gm:GameManager,board b:Board, player p: Player){
    print("%d make your move. input ex)1 2",p)
    let input = readLine()
    
    if(gm.getNumInput(input:input) == "Empty"){
        print("empty")
    }
    if(gm.checkMove(board: b) == false){
        print("can not put storn")
    }
}
func flipChip(manager gm:GameManager,board b: Board, player p: Player){
    
    b.currentBoard[gm.actualRowIdx][gm.actualColIdx] = p.chip
    
    // put and flip in row
    gm.flipChipRow(board: b, player: p)
    
    // flip in col
    gm.flipChipCol(board: b, player: p)
    
    //flip in diagonal
    gm.flipChipDia(board: b, player: p)
    
    b.displayBoard(board: b)
    
}

move(Gmanager: gm, board: b, player: p1)
flipChip(manager: gm,board: b, player: p1)


switch input!{
case "1":
    print("selected 1")
case "2":
    print("selected 2")
default:
    print("selected defalt")
}














