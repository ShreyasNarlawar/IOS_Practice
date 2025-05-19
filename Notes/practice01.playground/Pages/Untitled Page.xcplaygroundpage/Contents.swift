import Foundation

// // ARRAYS

// var shoppingList: [String] = ["Eggs", "Milk"]

// shoppingList.append("Flour")

// shoppingList += ["Baking Powder"]

// shoppingList += ["Chocolate Spread", "Cheese", "Butter"]

// var firstItem = shoppingList[0]

// shoppingList[0] = "Six Eggs"

// //print(shoppingList[0])

// shoppingList[4...6] = ["Bananas","Apples"]

// //print(shoppingList[5])

// shoppingList.insert("Maple Syrup", at: 0)

// //print(shoppingList[0])

// let mapleSyrup = shoppingList.remove(at: 0)

// //print(mapleSyrup)

// //print(shoppingList[0])

// let apples = shoppingList.removeLast()

// //print(apples)

// for itme in shoppingList {
//   print(itme)
// }

// for (index,value) in shoppingList.enumerated(){
//   print("\(index+1). \(value)")
// }

// // SETS

// var letters = Set<Character>()
// letters.insert("S")
// letters.insert("H")
// letters.insert("R")
// letters.insert("E")
// letters.insert("Y")
// letters.insert("A")
// letters.insert("S")
// letters.insert("N")
// letters.insert("A")
// letters.insert("R")
// letters.insert("L")
// print(letters)
// print("Letters is of type Set<Character> with \(letters.count) items.")


// var favGenres : Set<String> = ["Rock","Classical","Hip-Hop","Trance"]

// print(favGenres)

// let oddNums: Set = [1,3,5,7,9]
// let EvenNums: Set = [0,2,4,6,8]
// let primeNums: Set = [2,3,5,7]

// print(oddNums.union(EvenNums).sorted())

// print(oddNums.intersection(EvenNums).sorted())

// print(oddNums.subtracting(primeNums).sorted())

// print(oddNums.symmetricDifference(primeNums).sorted())

// var finalFruits: [String] = ["Apple","Banana","Oranges","Strawberries","Apple"]

// // print(finalFruits)
// var var1 = finalFruits[1]
// print(var1)

// var fruitsSet: Set = ["Apple","Banana","Oranges","Strawberries","Apple"]
 
// // print(fruitsSet)

// var myFirstDictionary: [String : Bool] = [
//     "Apple" : true,
//     "Orange" : false
// ]
// let item1 = myFirstDictionary["Apple"]
// print(item1)


// var mySecDictionary: [Int : String] = [
//   42: "Apple",
//   2582: "Orange"
// ]
// let item2 = mySecDictionary[42]
// print(item2)


// var myThirdDictionary: [String : String] = [
//   "xda": "Apple",
//   "bpd": "Mango"
//   ]
// let item3 = myThirdDictionary["bpd"]
// print(item3)

// myThirdDictionary["asd"] = "Guava"
// print(myThirdDictionary)

// myThirdDictionary.removeValue(forKey:"xda")
// print(myThirdDictionary)

// struct PostModel{
//   let id : String
//   let title : String
//   let likeCount : Int
// }

// var postArray : [PostModel] = [
//   PostModel(id: "abc", title: "Post 01", likeCount: 565),
//   PostModel(id: "def", title: "Post 02", likeCount: 254),
//   PostModel(id: "mno", title: "Post 03", likeCount: 321),
//   PostModel(id: "pqr", title: "Post 04", likeCount: 584),
//   PostModel(id: "wxy", title: "Post 05", likeCount: 356),
//   ]

// if postArray.indices.contains(1){
//   let item = postArray[3]
//   print(item)
// }

// for item in postArray{
//   print(item)
// }

// var postDict: [String:PostModel] = [
//   "abc": PostModel(id: "abc", title: "Post 01", likeCount: 565),
//   "def": PostModel(id: "def", title: "Post 02", likeCount: 254),
//   "mno": PostModel(id: "mno", title: "Post 03", likeCount: 321),
//   "pqr": PostModel(id: "pqr", title: "Post 04", likeCount: 584),
//   "wxy": PostModel(id: "wxy", title: "Post 05", likeCount: 356),
//   ]
  
//   let item = postDict["mno"]
//   print(item)

//var finalFruits: [String] = ["Apple","Banana","Oranges","Strawberries","Apple"]
//
//print(finalFruits)
//
//var fruitsSet: Set = ["Apple","Banana","Oranges","Strawberries","Apple"]
// 
//print(fruitsSet)
//
//var myFirstDictionary: [String : Bool] = [
//    "Apple" : true,
//    "Orange" : false
//]
//

//let minute = 60
//for tick in 0..<minute{
//    print(tick)
//}

//let hours = 12
//let hourInterval = 3
//for tickMark in stride(from: 3, through: hours, by: hourInterval){
//    print(tickMark)
//}

let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)

board[03] = +08
board[06] = +11
board[09] = +09
board[10] = +02
board[14] = -10
board[19] = -11
board[22] = -02
board[24] = -08

var square = 0
var diceRoll = 0

while square < finalSquare{
    diceRoll += 1
    if diceRoll == 7
    {diceRoll=1}
    square += diceRoll
    if square < board.count{
        square += board[square]
    }
}
print("Game is Over.")
