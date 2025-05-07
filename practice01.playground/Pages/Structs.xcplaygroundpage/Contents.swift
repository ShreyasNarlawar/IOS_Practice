
import Foundation

/*
 Structs are fast..
 Structs are stored in the stack(memory)
 Objects in the stack are value types.
 value types are copied and mutated.
 */

//struct Quiz{
//    let title: String
//    let date: Date
//}
//let myyObject:String="Hello, Shreyas..!"
//
//let myQuiz : Quiz = Quiz(title: "MyQuiz1", date: .now)
//print(myQuiz.date)
//print(myQuiz.title)


struct UserModel1{
    let name: String
    let isPremium: Bool
    
    func markUserAsPremium(newValue: Bool) -> UserModel1 {
        UserModel1(name: name, isPremium: newValue)
    }
}
var user1: UserModel1 = UserModel1(name: "DjAlok", isPremium: false)
user1 = user1.markUserAsPremium(newValue: true)
    	
let myObj: String = "Welcome to World !"
