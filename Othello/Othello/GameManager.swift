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
    
    func isExistMyStornInRow(board:Board,player:Player)->Bool{
        var exist = false
        existIndexOfStornInRow = board.boad[actualRowIdx].index(of: player.stone)
        guard let unwrappedIndexStorn = existIndexOfStornInRow, unwrappedIndexStorn != nil else {
            exist = false // if not found my storn(unwrappedIndexSrotn/existIndexOfStornInRow is nil)
            return exist
        }
        exist = true // if found my storn then insert true in exist
        return exist
    }

    func flipStorn(board:Board,player:Player)->Void{
        // check row
        
        // check there is existed your storn or not.
        let existIndexOfStornInRow = board.boad[actualRowIdx].index(of: player.stone)
        guard let unwrappedIndexStorn = existIndexOfStornInRow, unwrappedIndexStorn != nil else {
            return
        }
        // flip storn in the selected row. if selected index less than existed mystorn index, range will be from existed index to selected index -1. because if you replace same element , the index will be gone.
        if(actualColIdx < unwrappedIndexStorn){
            board.boad[actualRowIdx].replaceSubrange(Range(actualColIdx...(unwrappedIndexStorn - 1)), with: [Player1.stone,Player1.stone])
        }
        else{
            board.boad[actualRowIdx].replaceSubrange(Range((unwrappedIndexStorn + 1)...actualColIdx), with: [Player1.stone,Player1.stone])
        }
        
        // check colm
        // check diagonal
    }
    func flipStorn2(board:Board,player:Player,rec: inout Int)->Void{
        if(actualColIdx > existIndexOfStornInRow){ //flip to left
            var n = board.boad[actualRowIdx][rec]
            if(n == 0){ // if find empty area then break.
                return
            }else{
                board.boad[actualRowIdx][rec] = player.stone
                rec = rec - 1
                flipStorn2(board: b, player: Player1,rec:&rec)
            }
        }
        else{                                      //flip to right
            var n = board.boad[actualRowIdx][rec]
            if(n == 0){ // if find empty area then break.
                return
            }else{
                board.boad[actualRowIdx][rec] = player.stone
                rec = rec + 1
                flipStorn2(board: b, player: Player1,rec:&rec)
            }
        
        }
    }
}
