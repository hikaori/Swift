//
//  GameManager.swift
//  Othello
//
//  Created by kaori hirata on 2017-09-13.
//  Copyright © 2017 kaori hirata. All rights reserved.
//

import Cocoa

class GameManager: NSObject {
    var inputNum = [Int]()
    var actualRowIdx:Int!
    var actualColIdx:Int!
    var existIndexOfStornInRow:Int!
    
    override init() {
    }
    
    func getNumInput(input:String?)->String{
        var result = "Empty"
        guard let unwrappedInt = input, unwrappedInt != "" else{
            return result
        }
        let arrayIndexNumber = unwrappedInt.components(separatedBy: " ") // run when input has value
        inputNum.append(Int(arrayIndexNumber[0])!)
        inputNum.append(Int(arrayIndexNumber[1])!)
        result = "Get"
        return result
    }
    
    func checkMove(board:Board)->Bool{
        var result = false
        actualRowIdx = Int(inputNum[0] - 1) // inputNum[0] - 1 => represent index of array position
        actualColIdx = Int(inputNum[1] - 1) // inputNum[1] - 1 => represent index of array position
        if(board.boad[actualRowIdx][actualColIdx] == 0){
            result = true
        }
        return result
    }

// flip Row section
    func flipStornRow(board:Board,player:Player)->Void{
        var recRow = actualRowIdx
        var recCol = actualColIdx
        flipStornRowR(board:board,player:player,recRow: &recRow!,recCol: &recCol!)
        recRow = actualRowIdx // for back to base position
        recCol = actualColIdx // for back to base position
        flipStornRowL(board:board,player:player,recRow: &recRow!,recCol: &recCol!)
        

    }
    
    func flipStornRowR(board:Board,player:Player,recRow: inout Int,recCol: inout Int)->Void{
        var n = board.boad[recRow][recCol]
        if(n == 0){ // if find empty area then break.
            return
        }else{
            board.boad[recRow][recCol] = player.stone
            recCol = recCol + 1
            flipStornDiaRup(board: b, player: Player1,recRow:&recRow,recCol:&recCol)
        }
    }
    func flipStornRowL(board:Board,player:Player,recRow: inout Int,recCol: inout Int)->Void{
        var n = board.boad[recRow][recCol]
        if(n == 0){ // if find empty area then break.
            return
        }else{
            board.boad[recRow][recCol] = player.stone
            recCol = recCol - 1
            flipStornDiaRup(board: b, player: Player1,recRow:&recRow,recCol:&recCol)
        }
    }
    

// flip colm section
    func flipStornCol(board:Board,player:Player)->Void{
        var recRow = actualRowIdx
        var recCol = actualColIdx
        flipStornColup(board:board,player:player,recRow: &recRow!,recCol: &recCol!)
        recRow = actualRowIdx // for back to base position
        recCol = actualColIdx // for back to base position
        flipStornColdown(board:board,player:player,recRow: &recRow!,recCol: &recCol!)
    }
    func flipStornColup(board:Board,player:Player,recRow: inout Int,recCol: inout Int)->Void{
        var n = board.boad[recRow][recCol]
        if(n == 0){ // if find empty area then break.
            return
        }else{
            board.boad[recRow][recCol] = player.stone
            recRow = recRow - 1
            flipStornDiaRup(board: b, player: Player1,recRow:&recRow,recCol:&recCol)
        }
    }
    func flipStornColdown(board:Board,player:Player,recRow: inout Int,recCol: inout Int)->Void{
        var n = board.boad[recRow][recCol]
        if(n == 0){ // if find empty area then break.
            return
        }else{
            board.boad[recRow][recCol] = player.stone
            recRow = recRow + 1
            flipStornDiaRup(board: b, player: Player1,recRow:&recRow,recCol:&recCol)
        }
    }
    
// flip diagonal section
    func flipStornDia(board:Board,player:Player)->Void{
        var recRow = actualRowIdx
        var recCol = actualColIdx
        flipStornDiaRup(board:board,player:player,recRow: &recRow!,recCol: &recCol!)
        recRow = actualRowIdx // for back to base position
        recCol = actualColIdx // for back to base position
        flipStornDiaLdown(board:board,player:player,recRow: &recRow!,recCol: &recCol!)
        recRow = actualRowIdx // for back to base position
        recCol = actualColIdx // for back to base position
        flipStornDiaLup(board:board,player:player,recRow: &recRow!,recCol: &recCol!)
        recRow = actualRowIdx // for back to base position
        recCol = actualColIdx // for back to base position
        flipStornDiaRdown(board:board,player:player,recRow: &recRow!,recCol: &recCol!)
    }
    
    
    func flipStornDiaRup(board:Board,player:Player,recRow: inout Int,recCol: inout Int)->Void{
            var n = board.boad[recRow][recCol]
            if(n == 0){ // if find empty area then break.
                return
            }else{
                board.boad[recRow][recCol] = player.stone
                recRow = recRow - 1
                recCol = recCol + 1
                flipStornDiaRup(board: b, player: Player1,recRow:&recRow,recCol:&recCol)
            }
    }
    func flipStornDiaLdown(board:Board,player:Player,recRow: inout Int,recCol: inout Int)->Void{
        var n = board.boad[recRow][recCol]
        if(n == 0){ // if find empty area then break.
            return
        }else{
            board.boad[recRow][recCol] = player.stone
            recRow = recRow + 1
            recCol = recCol - 1
            flipStornDiaLdown(board: b, player: Player1,recRow:&recRow,recCol:&recCol)
        }
    }
    func flipStornDiaRdown(board:Board,player:Player,recRow: inout Int,recCol: inout Int)->Void{
        var n = board.boad[recRow][recCol]
        if(n == 0){ // if find empty area then break.
            return
        }else{
            board.boad[recRow][recCol] = player.stone
            recRow = recRow + 1
            recCol = recCol + 1
            flipStornDiaLdown(board: b, player: Player1,recRow:&recRow,recCol:&recCol)
        }
    }
    func flipStornDiaLup(board:Board,player:Player,recRow: inout Int,recCol: inout Int)->Void{
        var n = board.boad[recRow][recCol]
        if(n == 0){ // if find empty area then break.
            return
        }else{
            board.boad[recRow][recCol] = player.stone
            recRow = recRow - 1
            recCol = recCol - 1
            flipStornDiaLdown(board: b, player: Player1,recRow:&recRow,recCol:&recCol)
        }
    }
}
