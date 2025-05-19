//
//  SubScriptdemoView.swift
//  PracticeConcept0705
//
//  Created by Siddhatech on 07/05/25.
//

import SwiftUI

struct SubScriptdemoView: View {
    let SampleList = PersonList([
        Person(name: "Shreyas", age: 22),
        Person(name: "Vinay", age: 23),
        Person(name: "Anna", age: 84)
    ])
    
    var body: some View {
        VStack(spacing:20){
            if let person = SampleList[0]{
                Text("Accessed by: \(person.name), Age: \(person.age)")
            }
            if let person = SampleList["Vinay"]{
                Text("hacked By: \(person.name), Age: \(person.age)")
            }
            if SampleList[3] == nil {
                Text("Index out of bounds..").foregroundColor(.red)
            }
        }
        .padding()
        .navigationTitle("Subscripts Demo")
    }
}

#Preview {
    SubScriptdemoView()
}
