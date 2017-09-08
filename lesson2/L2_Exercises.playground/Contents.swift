import UIKit

//: # Lesson 2 Exercises
//: ## Optionals
//: ### Exercise 1
//: When retrieving a value from a dictionary, Swift returns an optional.
//:
//: 1a) The variable, director, is an optional type. Its value cannot be used until it is unwrapped. Use `if let` to carefully unwrap the value returned by `moviesDict[movie]`
var moviesDict:Dictionary = [ "Star Wars":"George Lucas", "Point Break":"Kathryn Bigelow"]
var movie = "Point Break"
var director = moviesDict[movie]

if let director = moviesDict[movie] {
    print(director)
}else{
    print("No the movie find")
}

//: 1b) Test your code by inserting different values for the variable `movie`.


//: ### Exercise 2
//: The LoginViewController class below needs a UITextField to hold a user's name. Declare a variable for this text field as a property of the class LoginViewController. Keep in mind that the textfield property will not be initialized until after the view controller is constructed.
class LoginViewController: UIViewController {
    var userName:UITextField!
}

//: ### Exercise 3
//: The Swift Int type has an initializer that takes a string as a parameter and returns an optional of type Int?.
//:
//: 3a) Finish the code below by safely unwrapping the constant, `number`.
var numericalString = "3"
var number = Int(numericalString)
    // *why this one is optional type? Dosent need "?" in end of value name?
//TODO: Unwrap number to make the following print statement more readable.
if let number = Int(numericalString){
    print("\(number) is the magic number.")
}
else{
    print("This Number hasn't been set.")
}

//: 3b) Change the value of numericalString to "three" and execute the playground again.
// var numericalString = "3"  ==== out put ===> 3 is the magic number.
// var numericalString = "three"  ==== out put ===> This Number hasn't been set.
//                                            ('three' can not be change to int so it gives 'nil')
//: ### Exercise 4
//: The class UIViewController has a property called tabBarController.  The tabBarController property is an optional of type UITabBarController?. The tabBarController itself holds a tabBar as a property. Complete the code below by filling in the appropriate use of optional chaining to access the tab bar property.
var viewController = UIViewController()
if let tabBar = viewController.tabBarController?.tabBar{//TODO: Optional chaining here {
    // why need'?' after 'tabBarController' ====> 'tabBarController' is type of 'UITabBarController?'
    print("Here's the tab bar.")
} else {
    print("No tab bar controller found.")
}
//: ### Exercise 5
//: Below is a dictionary of paintings and artists.
//:
//: 5a) The variable, artist, is an optional type. Its value cannot be used until it is unwrapped. Use `if let` to carefully unwrap the value returned by `paintingDict[painting]`.

var paintingDict:Dictionary = [ "Guernica":"Picasso", "Mona Lisa": "da Vinci", "No. 5": "Pollock"]
var painting = "Mona Lisa"
var artist = paintingDict[painting]
if let artist = paintingDict[painting] {
    print(artist)
}else{
    print("artist not found.")
}

//: 5b) Test your code by inserting different values for the variable `painting`.

//: ### Exercise 6
//: Set the width of the cancel button below.  Notice that the cancelButton variable is declared as an implicitly unwrapped optional.
var anotherViewController = UIViewController()
var cancelButton: UIBarButtonItem!
cancelButton = UIBarButtonItem()
cancelButton.width = 100
print(cancelButton.width)
// TODO: Set the width of the cancel button.
//: ### Exercise 7
//: The class UIViewController has a property called parent.  The parent property is an optional of type UIViewController?. We can't always be sure that a given view controller has a parent view controller.  Safely unwrap the parent property below using if let.
var childViewController = UIViewController()
var a = childViewController.parent
if let a = childViewController.parent{
    print("safty unwrap")
}else{
    print("no value")
}

// TODO: Safely unwrap childViewController.parent
