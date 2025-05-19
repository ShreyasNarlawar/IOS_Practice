//
//  NewsListView.swift
//  SplashScreen1205
//
//  Created by Shreyas on 12/05/25.
//

import Foundation

import SwiftUI

struct NewsListView: View {
    @StateObject private var viewModel = NewsViewModel()        //view model tied with UI lifecycle
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Fetching news...")
                        .progressViewStyle(CircularProgressViewStyle())
                } else {
                    List(viewModel.articles) { article in
                        NavigationLink(destination: NewsDetailView(article: article)) {
                            HStack {
                                if let imageUrl = article.urlToImage,
                                   let url = URL(string: imageUrl) {
                                    AsyncImage(url: url) { phase in
                                        switch phase {
                                        case .empty:
                                            ProgressView()
                                                .frame(width: 80, height: 80)
                                            
                                        case .success(let image):
                                            image
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 80, height: 80)
                                                .clipped()
                                            
                                        case .failure:
                                            Image(systemName: "exclamationmark.triangle")
                                                .frame(width: 80, height: 80)
                                            
                                        @unknown default:
                                            EmptyView()
                                        }
                                    }
                                } else {
                                    Rectangle()
                                        .fill(Color.gray)
                                        .frame(width: 80, height: 80)
                                }
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(article.title)
                                        .font(.headline)
                                        .lineLimit(2)
                                    
                                    if let desc = article.description {
                                        Text(desc)
                                            .font(.subheadline)
                                            .lineLimit(2)
                                            .foregroundColor(.secondary)
                                    }
                                }
                            }
                            .padding(.vertical, 8)
                        }
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Latest Headlines")
            .onAppear {
                viewModel.fetchNews()
            }
        }
    }
}
