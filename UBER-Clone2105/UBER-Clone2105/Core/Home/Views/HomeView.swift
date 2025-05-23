//
//  HomeView.swift
//  UBER-Clone2105
//
//  Created by Siddhatech on 21/05/25.
//

import SwiftUI

struct HomeView: View {
    @State private var mapState = MapviewState.noInput
    
    var body: some View {
        ZStack(alignment: .top){
            UberMapViewRepresentable(mapState: $mapState)
                .ignoresSafeArea()
            
            if mapState == .searchingForLocation{
                LocationSearchView(mapState: $mapState)
            }
            else if mapState == .noInput{
                LocationSearchActivationview()
                    .padding(.top, 72)
                    .onTapGesture {
                        withAnimation(.spring()){
                            mapState = .searchingForLocation
                        }
                    }
            }
            MapViewActionButton(mapState: $mapState)
                .padding(.leading)
                .padding(.top, 4)
        }
    }
}

#Preview {
    HomeView()
}
