
import Foundation

// classes are slow compared to structs
// classes are stored in the heap
//objects in the heap are the reference types
//reference types points to an object in memory and update the object in memory
//


class ScreenViewModel{
    let title : String
    var showButton: Bool
    
    init(title: String, showButton: Bool) {
        self.title = title
        self.showButton = showButton
    }
    deinit {
        //runs as the object is being removed from the Memory
    }
    func hideButton(){
        showButton = false
    }
    func updateShowButton(newValue:Bool){
        showButton = newValue
    }
}

let viewModel: ScreenViewModel = ScreenViewModel(title: "New Screen", showButton: true)
//viewModel.showButton = false
let value = viewModel.showButton

viewModel.hideButton()
viewModel.updateShowButton(newValue: false)
