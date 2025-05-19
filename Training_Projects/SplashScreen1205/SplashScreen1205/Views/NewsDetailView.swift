//
//  NewsDetailView.swift
//  SplashScreen1205
//
//  Created by Siddhatech on 12/05/25.
//

import SwiftUI

struct NewsDetailView: View {
    let article: NewsArticleModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            if let imageUrl = article.urlToImage,
                let url = URL(string: imageUrl)
            {
                AsyncImage(url: url){ phase in
                    switch phase{
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    case .failure:
                        Image(systemName: "exclamationmark.triangle")
                            .foregroundColor(.yellow)

                    @unknown default:       // Handles any unknown future states and keeps my code safe.
                        EmptyView()
                    }
                }
            }
            Text(article.title)
                .font(.subheadline)
                .bold()
            
            if let desc =  article.description{
                Text(desc)
                    .font(.caption)
                    .fontWeight(.regular)
            }
        }
        .padding()
        .navigationTitle("Article Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
