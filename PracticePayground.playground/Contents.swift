//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var stringVar = "abc"
var intVat = 123


//Annotation
var intvar2:Int = 123
let sdv = "sdv"
print("sdv is \(sdv)")

//Constant : Let
let pi = 3.14
//pi = 4.23 // not possible

//type alice

typealias nonFractional = UInt16
var minLinitNonFractional = nonFractional.min;

//
var isEven = true
if isEven
{
    print("its even")
}
else
{
    print("its odd")
}
var someValue = 1
//if someValue// not possible (error: PracticePayground.playground:30:4: error: 'Int' is not convertible to 'Bool)
//{
//
//}
//else{
//
//}
var tupleOfServerrespose: (Int , String) = (404,"Not found")

var statusCode = tupleOfServerrespose.0 // way 1
var (statusCode1, Message) = tupleOfServerrespose // way 2
print("Status code is \(statusCode1)  and message is \(tupleOfServerrespose)")
var (statusCode2,_) = tupleOfServerrespose // way 2
print("Status code is \(statusCode2)") // way 3 , ignoring some part of tuple

//Optionls
var someValueString = "121";
var value = Int(someValueString) // conversion to int is by default optional
if(value != nil){
    let sum = 1 + value! // ! is required as Conversion to int is optional
}
//Declaring variable as optional
var optionalString:String?// by defaut value is nil
print("Optional string \(optionalString)") // nil

//var optionalString1:String // asks for initialization
//print("Optional string \(optionalString1)") // nil

//Optional binding // if let , if var
if var convertedValue = Int(someValueString){
   convertedValue = convertedValue+1
    print("Converted value + 1 is ",convertedValue)
}
if let convertedValue = Int(someValueString){
   var  incrementedValue = convertedValue+1 // no need of forced unwrapping
    print("Incremented value  ",incrementedValue)
}
//Can have multiple optional binding

if let a = Int("10"),let b = Int("e") // All the conditions in optional binding should be true
{
    let c = a+b;
    print("C is \(c)")
}
else{
    print("Encountered some issue in parsing")
}

//Implicit unwrapped
var stringWithValue:String! = "Some String Literal"
var stringWithValue1 = stringWithValue // no "!" to access its value

var unwrappedValueWithNil:String! = nil
//var concaneated = unwrappedValueWithNil + "Abvcd" // gives exception ,you will also have to take care of such senarios
//Ternary operator a?b:c

var booleanToCheck = true
booleanToCheck ? print("Hi") : print("Bye")

//nil coalescing operator(a??b)= > if a not equal to nil use a else use b(defualt val)
var roseColor : String?
//var roseColor : String? =  "Pink"

print(roseColor ?? "Red")
//range Operator

//Closed range
print("Closed range 1...5")

for index in 1...5 //for index in 7...5 not possible (a...b )(//note : a<=b)
{
    print(index)
}
//half open range
print("Half range 1..<5")

for index in 1..<5
{
print(index)
}

print("Half range 1..<5")

let names = ["Anna", "dnj", "Brian", "Jack"]
print("Array , [1...]")

//One sided range
print("One sided array range [1...]")

for name in names[1...] //...1
{
    print(name)

}
print(Int.max)
print(Int.min)

//Array
var arrayOfColor = [String]()
var arrayOfNumbers = Array(repeating:1.1,count:3)
var arrayOfPlayer = ["Dhoni","Sachin"]
if(arrayOfColor.isEmpty)
{
    print("Array of color is empty")
}else
{
    print("Array of color has values")
}

arrayOfPlayer.append("Sania")
arrayOfPlayer += ["Sindhu"]

//arrayOfColor[arrayOfColor.count] = "Salman" // not valid

arrayOfPlayer[1...2] = ["Virat","Poonam"]

for player in arrayOfPlayer
{
    print(player)
}
for (index, value) in arrayOfPlayer.enumerated(){
    print("Player at \(index) is \(value)")
}

arrayOfPlayer.remove(at: 3)
arrayOfPlayer.removeLast()
print(arrayOfPlayer.count)

arrayOfPlayer.insert("Poonam", at: 2)


var arrayOfint : Array<Int> = [1,2,3]


//Sets
var setOfAnmimals :Set<String> = ["cat","dog"]

var setOfBirds:Set<String> = ["Peacock","Sparrow"]
setOfBirds.insert("Crow")

var isDisjoint = setOfBirds.isDisjoint(with: setOfAnmimals)

var setOfAnimalsAndBirds = setOfBirds.union(setOfAnmimals) // doesnot change original set

print("set of animal")
for animal in setOfAnmimals{
    print(animal)
}
print("union of animal and birds")
for animal in setOfAnimalsAndBirds{
    print("\n\(animal)")
}
print("Intersection")
var setOFInterSection:Set = setOfAnmimals.intersection(setOfAnimalsAndBirds)
print(setOfBirds.count)

setOfAnmimals.isEmpty
setOfAnmimals.contains("Bird")
setOfAnimalsAndBirds.remove("Peacock")
var symmetricDiff :Set = setOfBirds.symmetricDifference(setOfAnimalsAndBirds)
var subsractFromBirdsAnimal = setOfAnimalsAndBirds.subtracting(setOfAnmimals)
setOfAnmimals = setOfBirds
for animal in setOfAnmimals{
    print(animal)
    
}
print("all")
for animal in setOfAnimalsAndBirds{
    print(animal)
    
}
setOfBirds.isSubset(of: setOfAnimalsAndBirds)
var SetOFNumber:Set = [1,2,3]
var SetOFNumber1:Set = [1,2,3]
var SetOFNumbers:Set = [1,2,3,5,5,6,6]

SetOFNumber.isStrictSubset(of: SetOFNumbers)
SetOFNumbers.isStrictSubset(of: SetOFNumber1)

var sortedAnimalAndBirds = setOfAnmimals.sorted()


//Dictionaries
var dictionaryOfResources = [String:String]()
var dictionryOfWords = ["a":"Apple","b":"Ball"]
var dictionaryOfwordsNew:Dictionary<String,String> = ["c":"cat","d":"Dog"]


dictionaryOfResources["ok_key"] = "Okay"
//
dictionaryOfResources = [:]

dictionaryOfResources["close_key"] = "Please close the dialog"
dictionaryOfResources["done_key"] = "Done"
dictionaryOfResources.updateValue("DONE", forKey: "done_key")
dictionaryOfResources.updateValue("YES", forKey: "yes_key")// since this key was not present it sends nil as previous value
var yesString = dictionaryOfResources["yes_key"]
dictionaryOfResources.removeValue(forKey: "yes_key")
dictionaryOfResources["done_key"] =  nil

dictionaryOfResources.count
for (key,value) in dictionaryOfResources
{
    print("value for key : \(key) is \(value)")
}

for key in dictionaryOfResources.keys
{
    print(key)
}

for value in dictionaryOfResources.values
{
    print(value)
}

let  arrayOfValue = [String](dictionaryOfResources.values)

//Control flow
//value at perticular interval
print("at every 5 mins ")

for tick in stride(from: 0, to: 60, by: 5)
{
    print("\(tick)")
}

//Switch
var alphabet = "A"
switch alphabet
{
case "A":
    print("This is A")// it can nnot be empty , no fall through allowed in swift , if we want to have same behaviour to two diff case combine them as case "A","a"
case "a":
print("This is A")
case "B":
    print("This is A")
case "C":
    print("This is A")

default:
    "Alphabet did not match"
}

//No break is used coz once any condition is matched flow comes out of switch
//Wild card char (_)
var caseToMatch = (0,1)

switch caseToMatch {
case (_,0):
    print("pt on x axis")
case (0,_):
    print("pt on y axis")
default:
    print("some point neighther on x or y axis")

}
// value binding

switch caseToMatch {
case (0,let x):
    print("pt on y axis with x = \(x)")
case (0,_):
    print("pt on y axis")
default:
    print("some point neighther on x or y axis")
    
}

var caseToMatch1 = (1,1)

switch caseToMatch1 {
case (_,0):
    print("pt on x axis")
case (0,_):
    print("pt on y axis")
case let(x,y):
    print("point with x = \(x) and y = \(y)")
default:
    print("some point neighther on x or y axis")
    
}
//switch with range(interval matching)
var numberTomatch = 2
switch numberTomatch {
case 1...10:
    print("Number in first 10")
case 11...20:
    print("Number from 11 to 20")
default:
    print("Number greater than 20")
}
//Switch with where clause

var tupleToMatch = (2,2)
switch tupleToMatch {
case let(x,y) where x == y:
    print("both co-ordinates are same")
case let(x,y)where x != y:
    print("both co-ordinates are not same")
default:
    print("default")
//default is not compulsory if cases covers alll the cases
}
//Switch with cmpound cases
var alphabet1 = "a"
switch alphabet1 {
case "a","e","i","o","u":
    print("vowel") // alighment has significance
case "b","c","d","f","g","h":
    print("consonant")
default:
    print("neither vowel nor consonant")
}


//Stord properties : are the (normal var) variables where value is stored in memory, COmputed properties(getter setter) values are not stored any where its value is calculated using code in side get

//Access Control
//Internal : by default internal is the access control : accessible by any object in app or framework
//Private :  only callable from a object
//privateSet : accessible outside the class as readonly
//File private : accessible by any code in source file
//public (for framworks) :can be used outside the framework
//open : public and object outside the frameowrk can sub class this


//Extensions: // add vars and functions to existing classes

//Enums : it can have case, vars(only computed properties)
//Mutating enum () mutating self requires mutating func
// Optional is kind of enum with 2 cases : case 1. some value, case 2. nil
//Optional chaning : ?.?.?
//Reference counting :
//Memory mangments : a. strong b. weak, c. unowned (memory cycles : learn more about it)

