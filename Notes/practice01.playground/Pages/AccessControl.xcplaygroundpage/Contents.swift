import Foundation

struct MovieModel{
     var title: String
     var genre: MovieGenre
     private(set) var isFav: Bool
    
    func updateFavStatus(newbool:Bool) -> MovieModel {
        MovieModel(title: title, genre: genre, isFav: newbool)
    }
//    func updateTitle(newMov:String) -> MovieModel {
//        MovieModel(title: newMov, genre: genre, isFav: isFav)
//    }
//    func updateGenre(newGen:MovieGenre) -> MovieModel {
//        MovieModel(title: title, genre: newGen, isFav: isFav)
//    }
}
enum MovieGenre{
    case action , horror , drama , comedy , romantic
}

class MovieManagement{
    
    public var movie1 = MovieModel(title: "Singham", genre: .action, isFav: true)
    
    private var movie2 = MovieModel(title: "kanchana", genre: .comedy, isFav: false)

    private(set) var movie3 = MovieModel(title: "housefull", genre: .comedy, isFav: false)
   
    func updateMovie3(isFavour: Bool){
       movie3 = movie3.updateFavStatus(newbool: isFavour)
    }
}

let manager = MovieManagement()
 
let someVal = manager.movie3

//manager.movie1 = manager.movie1.updateFavStatus(newbool: false)
//manager.movie3.updateFavStatus(newbool: false)

manager.updateMovie3(isFavour: true)
print(manager.movie3)


let movie1 = manager.movie1
manager.movie1.updateFavStatus(newbool: false)







//manager.movie1 = manager.movie1.updateTitle(newMov: "Student of the year")
//print(manager.movie1)

//manager.movie2 = manager.movie2.updateGenre(newGen: .horror)
//print(manager.movie2)
//
//manager.movie3 = manager.movie3.updateFavStatus(newbool: false)
//print(manager.movie3)
