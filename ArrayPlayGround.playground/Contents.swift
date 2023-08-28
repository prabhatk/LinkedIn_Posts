import UIKit

//Basic of Arrays
// its ordered collection type in the Swift standard library. It provide O(1) random access and dynamic reallocation. Array is generic type, so type of values it contains are known at compile time.

// Empty Array
var arrayOfStrings : [String] = []      // type annotation + array literal
var arrayOfStrings_1 = [String]()        // invoking the [String] initilizer
var arrayOfStrings_2 = Array<String>()   // without syntactic sugar

//Array Literals
//Array Litrals is written with square brackets surrounding comma-seperated elements:
let arrrayOfInts = [2,4,8]

//but type annotaions can override the default:
let arrayOfUInt98s : [UInt8] = [2,4,8]
let arrayOfUInt98s_1 = [2,4,8] as [UInt8]
let arrayOfUInt98s_2 = [2 as UInt8,4,8]

//Array with repeated values
// An immutable array of type [String], containg ["same", "same", "same]

let repeatedStringArray = Array(repeating: "same", count: 3)
let repeatedIntArray = Array(repeating: 0 , count: 3)

//Creating arrays from other sequences
let dictionary = ["foo" : 4, "bar" : 6, "other" : 8]
let arrayOfKeyValuePairs = Array(dictionary)

//Multi Diamentional Arrays
//In Swift multidiamentional arry is created by nesting arrays
//eg 2D array of int [[Int]]
let array2D = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]
//accessing 2D array
array2D[0][2]
array2D[1][2]
array2D[2][2]

// Extracting values of given type from Array with flatmap.
let items : [Any] = [1, "Hello", 2, "False", 5, 8 ,(t1: "hello", t2: "World")]
//extracting values of Int type only
let collectInts = items.flatMap{ $0 as? Int}
//$0 as? Int will discart all the nil values and put it alltogether in new array
print(collectInts)

// Combining an Array's elements with reduce(_:combine:)
let numbers = [2,3,4,5,6,7,8,10]
let sum = numbers.reduce(into: 0) { result, element in
    result += element
}
//45 as result
// here two element result and element, where result is initilized value 0 and keep addup next element in to result param.
let sum1 = numbers.reduce(into: 10) { result, element in
    result += element
}
// result is 45

//Flattening multidiamentional array
let flatten2DArray = array2D.flatMap { $0 }
print(flatten2DArray)
//[0, 1, 2, 3, 4, 5, 6, 7, 8]

//Flattening multidiamentional string array
let flattenStringArray = repeatedStringArray.flatMap {$0}
print(flattenStringArray)
//["s", "a", "m", "e", "s", "a", "m", "e", "s", "a", "m", "e"]

// Subscripting Array with Range
let words = ["Hi", "hello", "Bonjore", "Welcome", "Good", "Bad"]
let range = 1...3
let slicedArray = words[range] // ["Hello", "Bonjore", "Welcome"]
let slicedArray1 = words[2...4] // ["Bonjore", "Welcome", "Good"]
type(of: slicedArray) // its type of ArraySlice<String>.Type
// it is recommented to convert it back to array as soon as finish with calculation.
let convertedSlicedArray = Array(slicedArray)
type(of: convertedSlicedArray)

//Sorting Array of Strings
let sortedWords = words.sorted()
// ["Bad", "Bonjore", "Good", "Hi", "Welcome", "hello"]

let sortedWords2 = words.sorted {$0.caseInsensitiveCompare($1) == .orderedAscending}
print(sortedWords2) //["Bad", "Bonjore", "Good", "hello", "Hi", "Welcome"]


extension Array {
    subscript (safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}

let testSafe : Array<Int> = [1,2,3,4,5]
testSafe[safe: 10] // will not crash return nil instead
//testSafe[10] // crash the code
