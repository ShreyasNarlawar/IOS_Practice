//
//  LocationSearchView.swift
//  UBER-Clone2105
//
//  Created by Siddhatech on 21/05/25.
//

import SwiftUI

struct LocationSearchView: View {
    @State private var startLocationText = ""
    @State private var destinationLocationText = ""
    var body: some View {
        VStack{
            //header view
            HStack{
                VStack{
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width: 6,height: 6)
                    
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1,height: 24)
                    
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 6,height: 6)
                }
                VStack{
                    TextField("Current Location",text: $startLocationText)
                        .frame(height: 32)
                        .background(Color(.systemGroupedBackground))
                        .padding(.trailing)
                    
                    
                    TextField("Where to?",text: $destinationLocationText)
                        .frame(height: 32)
                        .background(Color(.systemGray4))
                        .padding(.trailing)
                }
            }
            .padding(.horizontal)
            
            //List of locations
            
            ScrollView{
                LazyVStack(alignment: .leading){
                    ForEach(0 ... 20, id:\.self){
                        _ in
                        
                    }
                }
            }
        }
    }
}

#Preview {
    LocationSearchView()
}
