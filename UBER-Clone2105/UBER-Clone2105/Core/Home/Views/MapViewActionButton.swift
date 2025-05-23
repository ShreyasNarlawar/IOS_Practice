//
//  MapViewActionButton.swift
//  UBER-Clone2105
//
//  Created by Siddhatech on 21/05/25.
//

import SwiftUI

struct MapViewActionButton: View {
    @Binding var mapState: MapviewState
    
    var body: some View {
        Button{
            withAnimation(.spring()){
               actionForState(mapState)
            }
        }label: {
            Image(systemName: imageNameForState(mapState))
                .font(.title2)
                .foregroundStyle(.black)
                .padding()
                .background(.white)
                .clipShape(Circle())
                .shadow(color: .black, radius: 5)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    func actionForState(_ state: MapviewState){
        switch state{
        case .noInput:
            print("Debug: No input")
        case .searchingForLocation:
            mapState = .noInput
        case .locationSelected:
            print("Debug: Cleared the MapView")
        }
    }
    
    func imageNameForState(_ state: MapviewState)-> String{
        switch state{
        case .noInput:
            return "line.3.horizontal"
        case .searchingForLocation, .locationSelected:
            return "arrow.left"
        }
    }
}
