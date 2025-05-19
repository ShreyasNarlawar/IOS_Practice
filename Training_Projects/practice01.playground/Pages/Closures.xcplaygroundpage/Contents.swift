import Foundation

//var myName = {
//    print("Helllo from closured.")
//}
//func printName(name: String){
//    print("Helllo \(name)")
//}
////printName(name: "Aditya")
//
//
//var printVarFunct:(String)->() = printName
//    
//printVarFunct("Dev")

//var printVarClosure:(String)->()={
//    (name)->() in
//  print("Hello My Dear Friend, \(name)")
//}
////printVarClosure("Shrey")
//
//
//// USing Function
//func appendTwoStrings(name1:String, name2:String)->String{
//    return "Hello, \(name1) and \(name2)"
//}
//print(appendTwoStrings(name1: "Anu", name2: "Mannu"))
//
//
//// USing Closure
//var appendTwoStringClosure:(String,String)->String={
//    (name1,name2)->String in
//    return "Hello, \(name1) and \(name2)"
//     
//}
//print(appendTwoStringClosure("Anu","Mannu"))

//func myFunction(myClosure:()->()){
//    print("Function Invoked.")
//    myClosure()
//}

//myFunction(myClosure:{
//    print("Closure Invoked.")
//})

//// Trailing Closure Version
//myFunction{
//    print("Closure Invoked.")
//}

///Parameter Trailing Closure Syntax
//func doSomething(name: String,myAction:()->Void){
//    print("Hello \(name)")
//    myAction()
//}
//
//doSomething(name:"shrey"){
//    print("Action Performed.")
//}

/// Trailing Closure with parameter and without return value

//func Greet(action:(String)->Void){
//    print("Preparing...")
//    action("Shrey")
//}
//
//Greet{
//    name in
//    print("Hello \(name)")
//}

///Trailing Closure with parameter and return value

//func Calculation(addition:(Int,Int)->Int){
//    let total = addition(5,4)
//    print("Result is \(total)")
//}
//Calculation{val1,val2 in
//    return val1+val2
//}
//Calculation{$0 + $1} ///Shorthand Syntax


///Return Closure with parameter and return value from the function

//func Multiplier()->(Int)->(Int){
//    return{
//        num in
//        num*2
//    }
//}
//
//let doubler = Multiplier()
//print(doubler(5))


///@escaping Closures

//func delayed(action: @escaping ()->Void){
//    DispatchQueue.main.asyncAfter(deadline: .now(), execute: action)
//}
//delayed {
//    print("I ran after delay!")
//}
