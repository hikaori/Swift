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
    
    func checkMove(board b:Board)->Bool{
        var result = false
        actualRowIdx = Int(inputNum[0] - 1) // inputNum[0] - 1 => represent index of array position
        actualColIdx = Int(inputNum[1] - 1) // inputNum[1] - 1 => represent index of array position
        if(b.currentBoard[actualRowIdx][actualColIdx] == 0){
            result = true
        }
        return result
    }

// flip Row section
    func flipChipRow(board b:Board,player p:Player)->Void{
        var recRow = actualRowIdx
        var recCol = actualColIdx
        flipChipRowR(board:b,player:p,recRow: &recRow!,recCol: &recCol!)
        recRow = actualRowIdx // for back to base position
        recCol = actualColIdx // for back to base position
        flipChipRowL(board:b,player:p,recRow: &recRow!,recCol: &recCol!)
        

    }
    
    func flipChipRowR(board b:Board,player p:Player,recRow: inout Int,recCol: inout Int)->Void{
        let n = b.currentBoard[recRow][recCol]
        if(n == 0){ // if find empty area then break.
            return
        }else{
            b.currentBoard[recRow][recCol] = p.chip
            recCol = recCol + 1
            flipChipDiaRup(board: b, player: p, recRow:&recRow,recCol:&recCol)
        }
    }
    func flipChipRowL(board b:Board, player p:Player, recRow: inout Int, recCol: inout Int)->Void{
        let n = b.currentBoard[recRow][recCol]
        if(n == 0){ // if find empty area then break.
            return
        }else{
            b.currentBoard[recRow][recCol] = p.chip
            recCol = recCol - 1
            flipChipDiaRup(board: b, player: p,recRow:&recRow,recCol:&recCol)
        }
    }
    

// flip colm section
    func flipChipCol(board b:Board,player p:Player)->Void{
        var recRow = actualRowIdx
        var recCol = actualColIdx
        flipChipColup(board:b,player:p,recRow: &recRow!,recCol: &recCol!)
        recRow = actualRowIdx // for back to base position
        recCol = actualColIdx // for back to base position
        flipChipColdown(board:b,player:p,recRow: &recRow!,recCol: &recCol!)
    }
    
    func flipChipColup(board b:Board,player p:Player,recRow: inout Int,recCol: inout Int)->Void{
        let n = b.currentBoard[recRow][recCol]
        if(n == 0){ // if find empty area then break.
            return
        }else{
            b.currentBoard[recRow][recCol] = p.chip
            recRow = recRow - 1
            flipChipDiaRup(board: b, player: p,recRow:&recRow,recCol:&recCol)
        }
    }
    
    func flipChipColdown(board b:Board, player p:Player,recRow: inout Int,recCol: inout Int)->Void{
        let n = b.currentBoard[recRow][recCol]
        if(n == 0){ // if find empty area then break.
            return
        }else{
            b.currentBoard[recRow][recCol] = p.chip
            recRow = recRow + 1
            flipChipDiaRup(board: b, player: p,recRow:&recRow,recCol:&recCol)
        }
    }
    
// flip diagonal section
    func flipChipDia(board b:Board,player p:Player)->Void{
        var recRow = actualRowIdx
        var recCol = actualColIdx
        flipChipDiaRup(board:b,player:p,recRow: &recRow!,recCol: &recCol!)
        recRow = actualRowIdx // for back to base position
        recCol = actualColIdx // for back to base position
        flipChipDiaLdown(board:b,player:p,recRow: &recRow!,recCol: &recCol!)
        recRow = actualRowIdx // for back to base position
        recCol = actualColIdx // for back to base position
        flipChipDiaLup(board:b,player:p,recRow: &recRow!,recCol: &recCol!)
        recRow = actualRowIdx // for back to base position
        recCol = actualColIdx // for back to base position
        flipChipDiaRdown(board:b,player:p,recRow: &recRow!,recCol: &recCol!)
    }
    
    
    func flipChipDiaRup(board b:Board,player p:Player,recRow: inout Int,recCol: inout Int)->Void {
        let n = b.currentBoard[recRow][recCol]
        if (n == 0) { // if find empty area then break.
            return
        } else {
            b.currentBoard[recRow][recCol] = p.chip
            recRow = recRow - 1
            recCol = recCol + 1
            flipChipDiaRup(board: b, player: p, recRow:&recRow,recCol:&recCol)
        }
    }
    
    func flipChipDiaLdown(board b:Board,player p:Player,recRow: inout Int,recCol: inout Int)->Void{
        let n = b.currentBoard[recRow][recCol]
        if(n == 0){ // if find empty area then break.
            return
        }else{
            b.currentBoard[recRow][recCol] = p.chip
            recRow = recRow + 1
            recCol = recCol - 1
            flipChipDiaLdown(board: b, player: p,recRow:&recRow,recCol:&recCol)
        }
    }
    
    func flipChipDiaRdown(board b:Board,player p:Player,recRow: inout Int,recCol: inout Int)->Void{
        let n = b.currentBoard[recRow][recCol]
        if(n == 0){ // if find empty area then break.
            return
        }else{
            b.currentBoard[recRow][recCol] = p.chip
            recRow = recRow + 1
            recCol = recCol + 1
            flipChipDiaLdown(board: b, player: p,recRow:&recRow,recCol:&recCol)
        }
    }
    
    func flipChipDiaLup(board b:Board,player p:Player,recRow: inout Int,recCol: inout Int)->Void{
        let n = b.currentBoard[recRow][recCol]
        if(n == 0){ // if find empty area then break.
            return
        }else{
            b.currentBoard[recRow][recCol] = p.chip
            recRow = recRow - 1
            recCol = recCol - 1
            flipChipDiaLdown(board: b, player: p,recRow:&recRow,recCol:&recCol)
        }
    }
}
