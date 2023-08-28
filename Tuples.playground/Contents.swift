import Foundation
/*
A tuple type is formed by grouping together a sequence of types, separated by commas and enclosed within parentheses.

Additionally, this sequence of types can be associated with names for its elements, allowing these names to be used when referencing the values of each individual element.

An element's name is created using an identifier followed by a colon (:). This construct is commonly employed to define the return type of a function, empowering the function to deliver a unified tuple carrying various values.
*/

// What are Tuples?
//Tuples group multiple values into a single compound value. The values within a tuple can be of any type and do not have to be of the same type as each other.
//Tuples are created by grouping any amount of values:

let tuple = ("Hi", 5, "World")
// Values are read using index numbers starting at zero
print(tuple.0) //Hi
print(tuple.1) // 5
print(tuple.2) // World

//Also individual values can be named when the tuple is defined:
let namedTuple = (first : "Hi", second: 5, third : "World")
print(namedTuple.first) //Hi
print(namedTuple.second) // 5
print(namedTuple.third) // World

//Decomposing into individual variables
//Tuples can be decomposed into individual variables with the following syntax:

let (a, b, c) = tuple
print(a) //Hi
print(b) // 5
print(c) // World

//properties can be ignored by using underscore (_):

let (_, _, r) = tuple
print(r) // World

//Tuples as the Return Value of Functions
//functions can return tuples

func tupleAsReturnType() -> (String, String) {
    return ("Hello", "World")
}

let catchTuple = tupleAsReturnType()
print(catchTuple.0) //Hello
print(catchTuple.1) // World

//Employing a typealias to assign a name to your tuple type.
// Define a circle tuple by its center point and radius
typealias Circle = (center: (x: CGFloat, y: CGFloat), radius: CGFloat)
let cir : Circle = ((10.0, 10.0),10.0)

func getAreaOfCircle(circle: Circle) -> CGFloat {
    return .pi * circle.radius * circle.radius
}

getAreaOfCircle(circle: cir) //314.15

//Swapping Values
var nameA = "Foo"
var nameB = "Bar"

(nameA,nameB) = (nameB, nameA)
print(nameA) //Bar
print(nameB) //Foo

//Using Tuple with Switch

let testSwitch = (true,true)

switch testSwitch {
case (false, false):
    print("all false")
case (false, true):
    print("false, true")
case (true, false):
    print("true, false")
case (true, true):
    print("all true")
}
// all true will be output

