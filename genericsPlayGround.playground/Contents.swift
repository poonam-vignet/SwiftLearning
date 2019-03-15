//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//1. Generics in methods
func add(firstNum:Int,secondNum:Int)->Int
{
    return firstNum + secondNum
}
var sum = add(firstNum: 2, secondNum: 3)

//If we send double we , it gives compilation error
//var sumOfDouble = add(firstNum: 2.34, secondNum: 3.55)
//Solution : will add new function as follow

func add(firstNum:Double,secondNum:Double)->Double
{
    return firstNum + secondNum
}
var sumOfDouble = add(firstNum: 2.34, secondNum: 3.34)
//Disadvantage : duplication of code

//Solution:  Generics
func add<T:Numeric>(first: T, second: T)->T
{
    return first + second
}

add(first: 3, second: 5)
add(first: 3.45, second: 5.34)

//2. generics  in  Structure

//a. without generics
//struct Stack{
//    var items:[String] = []
//
//      mutating func append(insertElement:String){
//        items.append(insertElement)
//    }
//    mutating func pop()->String{
//       return items.removeLast()
//    }
//
//}
//var stackOFStrings = Stack()
//stackOFStrings.append(insertElement: "abc")
//stackOFStrings.append(insertElement: 123) // i cant do this , to do this i need to have a different class or a differnt array of int and different methods accepting the integer

//Solution : Struct with generics

struct StackGeneric<T> {
    var items: [T] = []
    mutating func appened(elementToBeAdded: T)
    {
        items.append(elementToBeAdded)
    }
    mutating func pop(elemetToBePoped: T)-> T
    {
       return items.popLast()!
    }
}
var stackOfInt = StackGeneric<Int>()
stackOfInt.appened(elementToBeAdded: 1)
stackOfInt.appened(elementToBeAdded: 5)
//Not possible :
//stackOfInt.appened(elementToBeAdded: "qwe")
var stackOfString = StackGeneric<String>()
stackOfString.appened(elementToBeAdded: "Poonam")
stackOfString.appened(elementToBeAdded: "Bhadikar")

var stackOfAny = StackGeneric<Any>()
stackOfAny.appened(elementToBeAdded: "Poonam")
stackOfAny.appened(elementToBeAdded: 1)








