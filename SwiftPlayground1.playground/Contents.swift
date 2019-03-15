//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"



var someString = "This is an string example";

print("First character of string  is ",someString[someString.startIndex]);


print(" last character of string is",someString[someString.index(before: someString.endIndex)]);


//print(someString[0]) this gives an error

var index = (someString.index(someString.startIndex, offsetBy: 8)) // prints char at index 8

print("",someString[index])



var index1 = (someString.index(someString.startIndex, offsetBy: 8)) // prints char at index 8

var subString = someString.substring(to: index)
 let range = 0..<5


someString.insert("!", at: someString.endIndex)


//=======================================================================================
//INDEX OF SOME CHARACTER
var characters = someString.characters;
var indexOfs = characters.index(of: "s");

var indexOfy = characters.index(of: "y");

//if charecter is not prsent , it will print nil


//=======================================================================================
//ARRAYS

var arrayOfInt = [Int]();

print("Count is ",arrayOfInt.count);

print("arrayOfInt is empty",arrayOfInt);

arrayOfInt.append(12);

arrayOfInt.insert(16, at: 1) // at perticular position ,but u cant give above range , means above count+1


//-----------------------------

var arrayOfInt1 = [1,2,3,5]

//-----------------------------
var array = Array(repeating: 6, count: 4) // setting default value as 6 and 4 elements in an array

//print(array[5]) gives error as we are trying to access emement which is not in array

//-----------------------------

var mergerdArray = arrayOfInt + arrayOfInt1; // arrays should have same data type

//-----------------------------
var arrayOfNumbers :[String] = ["One","Two"];
print(arrayOfNumbers)
arrayOfNumbers.append("Three")

//-----------------------------
var arrayInt:Array<Int> = Array()
arrayInt.append(55)

if arrayOfNumbers.isEmpty
{
print("empty array")
}
else
{
print("non empty array")
 
}
//-----------------------------


if(arrayOfNumbers.contains("Two"))
{

    arrayOfNumbers.index(of: "Two")
}
//-----------------------------

arrayOfNumbers.insert("four", at: 3) // we can give index as integer , in string we needed to give index


//-----------------------------

// arrayOfNumbers.remove(at: 6) gives error as there is no element at 6th position

arrayOfNumbers.remove(at: 3) // returns removed number


//-----------------------------

for number in arrayOfNumbers
{
print(number)
}

//-----------------------------

for (index,value) in arrayOfNumbers.enumerated()
{
    
    print("Number at  \(index)  is \(value)")
    
}



//=======================================================================================

//Dictionaries


var numbersDictionary = [Int:String]();  // 1st way of creating dictionary

numbersDictionary[1] =  "One";
numbersDictionary[2] = "Two";
print("Dictionary is ",numbersDictionary);

//Key is unique if we try to enter value on same key it is replaced.

numbersDictionary[2] = "Three";
print("Dictionary is ",numbersDictionary);

//Dictionaries is not ordered


var first = numbersDictionary

//we can get all the keys
print(numbersDictionary.keys);

// we can get count

print("count is ",numbersDictionary.count);

for key in numbersDictionary.keys
{
    print("Value at key \(key) is \(numbersDictionary[key]!)")

}

//We can update

numbersDictionary.updateValue("Two", forKey: 2);
print("Dictionary is ",numbersDictionary);

//not sequential insertion as array // not ordered


// Using If Let

//------------------------------------------------------------------------------
 if let number = numbersDictionary[3]
 {
 print("number for 3 \(number)")
 }
 else
 {
 print("There is no entry for 3 in dictionary")
 }

//Null is not allowed
numbersDictionary[4] = nil;
numbersDictionary[2] = nil; // key value entry for 2 is removed if we assign it a value nil
print("Dictionary is ",numbersDictionary);



numbersDictionary[2] = "Two"; // key value entry for 2 is removed if we assign it a value nil

//How to get keys before iterarting through it


print([Int](numbersDictionary.keys)) // convert keys to array on Int (as keys are of data type int)



var alphabets: Dictionary<String, String> // 2nd way of creating dictionary

alphabets = Dictionary<String, String>()

alphabets["a"] = "first alphabet"


alphabets.removeValue(forKey: "a");

print (alphabets)

var someDictionary = ["V","Violet"]

var somedictionry2 = [Int:Int]() // initialized

var somedictionry1 : [String:String] = ["India":"Delhi"] // something of type (:) dictionary




//============================================================================================

//Using Sets :

//Set has all unique value

//not  ordered

var letters = Set<Character>()
letters = ["a","b","c","d","e","f"]
print("Set of character :",letters)


//Ways of declaring sets

letters.insert("b") // will not give exception but only one value is maintained
letters.insert("g")
print("Set of character after inserting g :",letters)


// checking whether set is empty
if(letters.isEmpty)
{
    print("set has no value");
}
else
{
    print("set has some value");

}



if(letters.contains("b"))
{
print("set of letters contains  b")
    letters.remove("b")
    print("B is removed")

}
else
{
print("set of letters does not contain  b")
}


if(letters.contains("b"))
{
    print("set of letters contains  b")
    letters.remove("b")
    
}
else
{
    print("set of letters does not contain  b")
}

//Iteratinhg over set

for char in letters
{
print("\(char) \n")
}

//Sorting a set

for char in letters.sorted()
{
print("sorted chars are  \(char)")
}

// different ways of creating sets:

var days = Set<String>()
days.insert("Monday")
days.insert("Tuesday")
days.insert("Thuresday")

var colors:Set = ["Violet","Red","Blue","Green"]

var indexOfThisColor = colors.index(of: "Violet")

print(indexOfThisColor!)



colors.remove(at: indexOfThisColor!)

print(colors)


//============================================================================================


























