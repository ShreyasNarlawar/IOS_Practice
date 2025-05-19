//
//  ParentView.swift
//  PracticeConcept0705
//
//  Created by Shreyas on 07/05/25.
//

import SwiftUI

struct ParentView: View {
    @StateObject private var viewModel = PersonVM()
    
    var body: some View {
        VStack{
            Text("Parent View")
                .font(.title)
            ChildView(name:viewModel.name)
            
            TextField("Enter Name : ",text: $viewModel.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
        }
        .padding()
    }
}

#Preview {
    ParentView()
}
