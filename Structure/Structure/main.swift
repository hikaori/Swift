//
//  main.swift
//  Structure
//
//  Created by kaori hirata on 2017-09-12.
//  Copyright © 2017 kaori hirata. All rights reserved.
//

import Foundation

print("Hello, World!")

struct Tshirt {
    var size: String
    var color: String
    var material: String
    init(size:String,color:String,material:String) {
        self.size = size
        self.color = color
        self.material = material
    }
    
}

let sizeDictionaly = ["S" : 3 ,"M" : 5 ,"L" : 7]
let colorsDictionaly = ["red" : 2 ,"blue" : 3 ,"white" : 1]
let materialDictionaly = ["regular" : 5 ,"organic" : 10]

func calculatePrice(t:Tshirt)->Int{
    var price:Int = 0
    if(sizeDictionaly[t.size] != nil) {
        price += sizeDictionaly[t.size]!
    }
    if(colorsDictionaly[t.color] != nil) {
        price += colorsDictionaly[t.color]!
    }
    if(materialDictionaly[t.material] != nil) {
        price += materialDictionaly[t.material]!
    }
    return price
}

var tshirt = Tshirt(size: "M", color: "red", material: "organic")
print("area of rectangle is \(tshirt.size+tshirt.color)")
print(calculatePrice(t:tshirt))
