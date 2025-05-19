//
//  NewsArticleModel.swift
//  SplashScreen1205
//
//  Created by Siddhatech on 12/05/25.
//

import Foundation

struct NewsResponce: Codable{
    let articles: [NewsArticleModel]
}

struct NewsArticleModel: Codable,Identifiable{
    let id = UUID()
    let title: String
    let description: String?
    let url: String
    let publishedAt: String
    let urlToImage: String?
    
}
