//
//  NewsViewModel.swift
//  SplashScreen1205
//
//  Created by Shreyas on 12/05/25.
//

import Foundation

class NewsViewModel: ObservableObject{
    @Published var articles:[NewsArticleModel] = []
    @Published var isLoading = true
    
    private let apikey = "d15979fd07374eab8367361fd725540e"
    
    func fetchNews(){
        guard let url = URL(string: "https://newsapi.org/v2/everything?q=apple&from=2025-05-12&to=2025-05-12&sortBy=popularity&apiKey=\(apikey)") else {
                    print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url){data, response, error in         //works dataTask async in background thread
            DispatchQueue.main.async {
                self.isLoading = false
            }
            
            if let error = error{
                print("Error: \(error)")
                return
            }
            
            guard let data = data else{
                print("No data found")
                return
            }
            do{
                let result = try JSONDecoder().decode(NewsResponce.self, from: data)
                DispatchQueue.main.async {
                    self.articles = result.articles
                }
            } catch {
                    print("Failed \(error)")
                }
        }.resume()
    }
}
