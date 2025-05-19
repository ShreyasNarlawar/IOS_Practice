import Foundation

struct Databaseuser{
var name: String
var isPremium: Bool
var order:Int
}

var allUsers: [Databaseuser] = [
    Databaseuser(name:"Nikyaa", isPremium:true,  order:124),
    Databaseuser(name:"Gotyaa", isPremium:false, order:54),
    Databaseuser(name:"Ganyaa", isPremium:false, order:65),
    Databaseuser(name:"Chikya", isPremium:true,  order:568),
    Databaseuser(name:"Manyaa", isPremium:false, order:54),
]
//var allPremiumUsers: [Databaseuser] = allUsers.filter { user in
//    if user.isPremium{
//        return true
//    }
//        return false
//}

//for user in allUsers {
//    if user.isPremium {
//        allPremiumUsers.append(user)
//    }
//}
//print(allPremiumUsers)

//var allPremiumUsers: [Databaseuser] = allUsers.filter { user in
//    return user.isPremium
//}
//print(allPremiumUsers)
//
//var allPremiumUsers2: [Databaseuser] = allUsers.filter({$0.isPremium})
//print(allPremiumUsers2)

//var InOrderedUsers: [Databaseuser] = allUsers.sorted { user1, user2 in
//    return user1.order < user2.order
//}
//print(InOrderedUsers)
//
//var InOrderedUsers2: [Databaseuser] = allUsers.sorted(by:{ $0.order < $1.order})
//
//print(InOrderedUsers2)

//var username:[String] = allUsers.map{user in
//    return user.name
//}
//print(username)
//
//var totalOrders:[Int] = allUsers.map{user in
//    return user.order
//}
//print(totalOrders)
