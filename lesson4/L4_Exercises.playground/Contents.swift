//: # Lesson 4 Exercises - Control Flow

import UIKit

//: ## Fast enumeration with for-in
//: ### Exercise 1
//: For each title in the array print the following string: "title + with Puppets", e.g "Point Break with Puppets!"
var movieTitleArray = ["Point Break", "The Dark Knight", "Star Wars", "When Harry Met Sally"]

for title in movieTitleArray{
    print("\(title) + with Puppets\", e.g \"Point Break with Puppets!")
}
//: ### Exercise 2
//: Rent is increasing by 20% this year. Use a for-in loop to apply this increase to each item in the oldMountainViewRent array.  Store the new values in the array newMountainViewRent.
var oldMountainViewRent:[Double] = [2150, 1775, 2221, 1261, 1325, 2110, 1870]
var newMountainViewRent = [Double]()

for oldRent in oldMountainViewRent{
    var newlent = Double(oldRent * 0.2)
    newMountainViewRent.append(newlent)
}
print(newMountainViewRent)
//: ### Exercise 3
//: For each food with a true value, print out "<food>, yum!" For each food with a false value print out, "<food>, yuck!"
var polarizingFoods = ["Anchovies":true, "Coconut":true, "Cilantro":true, "Liver": false]
for (key, value) in polarizingFoods{
    if(value == true){
        print("<food>, yum!")
    }
    else{
        print("<food>, yuck!")
    }
}

//: ### Exercise 4
//: The Oakland area code is changing from 415 to 510. Replace all occurrences of the area code 415 with 510 in the dictionary below.
var rapperPhoneNumbers = ["Azealia Banks":"(212)548-8777", "Boots Riley":"(415)755-9887", "MC Hammer":"(415)533-9899", "Missy Elliot":"(757)488-5552", "Shock G":"(415)499-7676", "Sir Mix-a-lot":"(206)123-4567", "Snoop Dogg":"(213)760-6664"]


var count = 0
for (key, value) in rapperPhoneNumbers {
//    if(value.range(of: "(415)") != nil){
    if(value.contains("(415)")){
        count = count + 1
        print(value)
        value.replacingOccurrences(of: "(415)", with: "(510)")
        print(value)
    }
}

let aString = "This is my string"
let newString = aString.replacingOccurrences(of: " ", with: "+")
print(count)
print(newString)
print(rapperPhoneNumbers)


//: ## Switch Statements
//: Translate the following if-else statements into switch statements. Feel free to modify print statements as desired.
//: ### Exercise 5
//: Below is an if statement determining what team to cheer for given a sport.
enum Sport {
    case baseball, basketball, football, hockey, soccer
}

var sport = Sport.baseball

if sport == .baseball {
    print("Go A's!")
} else if sport == .basketball {
    print("Go Warriors!")
} else if sport == .football {
    print( "Go Raiders!")
} else if sport == .hockey {
    print("Go Sharks!")
} else if sport == .soccer {
    print("Go Earthquakes!")
}

switch sport {
case .baseball:
    print("Switch : Go A's!")
case .basketball:
    print("Switch : Warriors!!")
case .football:
    print("Switch : Raiders!")
case .hockey:
    print("Switch : Sharks!")
case .soccer:
    print("Switch : Earthquakes!")
default:
    print("Switch : def")
}

// ??? what is '.'(.soccer)　means?
//: ### Exercise 6
//: Below is an enum and an if-else statement for implementing the game Rock-Paper-Scissors.
enum roshamboMove {
    case rock, paper, scissors
}

var myMove = roshamboMove.scissors
var yourMove = roshamboMove.scissors

var resultsMessage = ""

if myMove == .rock && yourMove == .paper || myMove == .paper && yourMove == .rock {
    resultsMessage = "Paper covers Rock."
} else if myMove == yourMove {
    resultsMessage = "It's a tie!"
} else if myMove == .rock && yourMove == .scissors || myMove == .scissors && yourMove == .rock {
    resultsMessage = "Rock crushes Scissors. "
} else if myMove == .paper && yourMove == .scissors || myMove == .scissors && yourMove == .paper {
    resultsMessage = "Scissors cut Paper."
}

print(resultsMessage)

//: ### Exercise 7
//: Below is an if-else statement matching an assignment score to a letter grade.
var score = 97
var letterGrade = ""

if 90...100 ~= score {
    letterGrade = "A"
} else if 80...89 ~= score {
    letterGrade = "B"
} else if 70...79 ~= score {
    letterGrade = "C"
} else if 60...69 ~= score {
    letterGrade = "D"
} else {
    letterGrade = "Incomplete"
}

print(letterGrade)
//: ### Exercise 8
//: The if-else statement below translates a word into Pig Latin. Without using the "vowels" array, write an equivalent switch statement.

var word = "can"
var firstLetter = word[word.startIndex]
var newWord = ""
var vowels: [Character] = ["a", "e", "i", "o", "u"]

//if vowels.contains(firstLetter) {
//    newWord = word + "yay"
//} else {
//    word.remove(at: word.startIndex)
//    newWord = "\(word)\(firstLetter)ay"
//}

switch firstLetter {
case "a":
    newWord = word + "yay"
case "e":
    newWord = word + "yay"
case "i":
    newWord = word + "yay"
case "o":
    newWord = word + "yay"
case "u":
    newWord = word + "yay"
default:
    newWord = "\(word)\(firstLetter)ay"
}

print(newWord)
