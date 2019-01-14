//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


class Person
{
    var age:Int
    var name : String

    init()
    { // All prperties should be initialized
        self.age = 0
        self.name = ""
    }
    init(age:Int,name:String)
    {
        self.age = age
        self.name = name
    }
    func  setAgeValue(age:Int)
    {
        self.age = age

    }
    func  setNameValue(name:String)
    {
        self.name = name
        
    }
}

class Employee:Person //Inheritance
{
    var empID:Int
    override init()
    {
        self.empID = 0
        super.init()
    }
    init(empId:Int)
    {
        self.empID = empId
        super.init()
    }
}

let a = Employee(empId: 1)
a.setAgeValue(age: 25)
a.setNameValue(name: "EmployeeOne")
print(a.empID,a.age,a.name)


//Method overload : function with same name

//Structure
struct StudentMarks
{
    var mark1 = 100
    var mark2 = 200
    var mark3 = 300
    
}




let marks = StudentMarks()
print("Mark1 is \(marks.mark1)")
print("Mark2 is \(marks.mark2)")
print("Mark2 is \(marks.mark3)")


//Structure VS class :

// aClass are reference var so both object are ponting to same memory location (Referenc Type)

class SomeClass
{
    var name:String
    init(name:String)
    {
        self.name = name
    }
}
var aClass = SomeClass(name: "Poonam")
//var cClass = SomeClass() // if we write parametrised once , no by default is called
var bClass = aClass
bClass.name = "Pooja"
print(aClass.name)
print(bClass.name)


//struct(Value Type) coping leads to creating two different memory locations
struct SomeStruct
{
    var name:String
    init(name:String)
    {
        self.name = name
    }
}
var aStruct = SomeStruct(name: "Bob")
var bStruct = aStruct
bStruct.name = "Sue"
print(aStruct.name)
print(bStruct.name)














//let p = Person(age: 25, name: "ABC")
//let p = Person()

