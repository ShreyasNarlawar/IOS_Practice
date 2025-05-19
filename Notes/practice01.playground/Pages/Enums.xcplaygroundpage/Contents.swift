import Foundation

//struct carModel{
//    let brand: cardBrandOption
//    let model: String
//}
//
//struct carBrand{
//    let title: String
//}
//
//enum cardBrandOption{
//    case Tata
//    case Hyundai
//    case Toyota
//}
//var car1: carModel = carModel(brand: "Toyota", model: "Fortuner")
//var car1: carModel = carModel(brand: "Tata", model: "Safari")
//var car1: carModel = carModel(brand: "Toyota", model: "Innova")
//var brand1 = carBrand(title: "Tata")
//var brand2 = carBrand(title: "Hyundai")
//var brand3 = carBrand(title: "Toyota")

//var car1 = carModel(brand:brand1, model: "Avinya")
//var car2 = carModel(brand:brand2, model: "Verna")
//var car3 = carModel(brand:brand3, model: "Fortuner")

//print(car1)
//var car1 = carModel(brand: .Tata, model: "Avinya")
//var car2 = carModel(brand: .Hyundai, model: "Verna")
//
//print(car1)


///Without Type
/// In Without type we can access the hashvalue but we cannot access the RawValue

    enum Collegewithout{
        case StudName
        case CollName
        case StudId
    }
    func withType(){
        let collTypeDetail = Collegewith.CollName
        print(collTypeDetail)
    
        let collTypeRaw = Collegewith.CollName.rawValue
        print(collTypeRaw)
    
        let collHas = Collegewith.StudId.rawValue
        print(collHas)
    }
    //withType()



/// With Type

    enum Collegewith: String{
        case StudName = "HariOm"
        case CollName = "Pawnaa Leka"
        case StudId = "11"
    }
    func withoutType(){
        //let collDetail = College.CollName
        let name = Collegewithout.StudName
        //switch collDetail{
        switch name{
        case .CollName:
            print("MIT College")
        case .StudId:
            print("30")
        case .StudName:
            print("Shrey")
        }
    }
//      withoutType()
    

///Function in Enum

    enum collegeFunc{
        case StudName
        case CollName
        case StudId
        
        func description()-> String{
            switch self {
            case .StudName:
                return "My name is shrey"
            case .CollName:
                return "MIT"
            case .StudId:
                return "11"
            }
        }
    }
    let collegeFuncDetail = collegeFunc.StudName.description()
    print(collegeFuncDetail)
    
    
//With Arguments

enum Student{
    case studentName(String)
    case Marks(Int,Int,Int)
}

func withArg(){
    let stdname = Student.studentName("Shreyas")
    let stdmks = Student.Marks(80, 74, 87)
    
    switch stdmks{
    case .studentName(let studname):
        print("My name is \(studname)")
    case .Marks(let m1, let m2, let m3):
        print("Marks are \(m1) , \(m2) , \(m3)")
    }
}
withArg()
    
    



