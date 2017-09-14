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
b.displayBoard(bord: b)

var Player1 = Player(stone: "k")
print(Player1.stone)

print("make your move. input ex)1 2")
let input2 = readLine()


var gManager = GameManager.init()
if(gManager.getNumInput(input:input2) == "Empty"){
    print("empty")
}
if(gManager.checkMove(board: b) == false){
    print("can not put storn")
}
print(gManager.isExistMyStornInRow(board: b, player: Player1))

var rec = gManager.actualColIdx
b.boad[gManager.actualRowIdx][gManager.actualColIdx] = Player1.stone
gManager.flipStorn2(board: b, player: Player1,rec: &rec!)

//b.boad[0][0]=Player1.stone

//gManager.flipStorn(board: b, player: Player1)
b.displayBoard(bord: b)

//print(gManager.checkMove(input:input2,board: b))
//b.boad[1].replaceSubrange(Range(1...2), with: [Player1.stone,Player1.stone])





switch input!{
case "1":
    print("selected 1")
case "2":
    print("selected 2")
default:
    print("selected defalt")
}














