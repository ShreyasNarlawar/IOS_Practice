//
//  LocationSearchResultCell.swift
//  UBER-Clone2105
//
//  Created by Siddhatech on 22/05/25.
//

import SwiftUI

struct LocationSearchResultCell: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        HStack{
            Image(systemName: "mappin.circle.fill")
                .resizable()
                .foregroundStyle(.blue)
                .accentColor(.white)
                .frame(width: 40,height: 40)
            
            VStack(alignment: .leading){
                Text(title)
                    .font(.body)
                Text(subtitle)
                    .font(.system(size: 15))
                    .foregroundStyle(.gray)
                
                Divider()
            }
            .padding(.leading,8)
            .padding(.vertical,8)
        }
        .padding(.leading)
    }
}
