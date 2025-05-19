//
//  SampleModel.swift
//  PracticeConcept0705
//
//  Created by Shreyas on 07/05/25.
//
import Foundation

struct Person: Identifiable{
    let id = UUID()
    let name: String
    let age: Int
}

struct PersonList{
    private var people: [Person]  //private becaause no one can access directly
    
    init (_ people: [Person]){
        self.people = people
    }
    subscript(index: Int) -> Person? {
        guard index >= 0 && index < people.count else{return nil}
        return people[index]
    }
    subscript(name: String)-> Person? {
        return people.first{$0.name.lowercased() == name.lowercased()}
    }
}

