//
//  RatingView.swift
//  BooksApp1605
//
//  Created by Shreyas on 19/05/25.
//

import SwiftUI

struct RatingView: View {
    var maxRating: Int
    @Binding var currentRating: Int
    var width: CGFloat

    var body: some View {
        HStack {
            ForEach(1...maxRating, id: \.self) { index in
                Image(systemName: index <= currentRating ? "star.fill" : "star")
                    .resizable()
                    .frame(width: width, height: width)
                    .foregroundColor(.yellow)
                    .onTapGesture {
                        currentRating = index
                    }
            }
        }
    }
}
