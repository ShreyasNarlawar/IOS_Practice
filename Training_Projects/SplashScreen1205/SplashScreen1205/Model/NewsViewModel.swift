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
    
    private let apikey = N_API.apiKey
    
    func getNewsURL() -> URL? {
        let apiKey = N_API.apiKey
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let today = Date()
        // Calculate yesterday by subtracting 1 day (24 * 60 * 60 seconds)
        guard let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: today) else {
            print("Failed to calculate yesterday's date")
            return nil
        }
        
        let fromDate = formatter.string(from: yesterday)
        let toDate = formatter.string(from: today)
        
        let urlString = "https://newsapi.org/v2/everything?q=apple&from=\(fromDate)&to=\(toDate)&sortBy=popularity&apiKey=\(apiKey)"
        
        return URL(string: urlString)
    }

    
    func fetchNews(){
        guard let url = getNewsURL() else {
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

struct N_API {
    static var apiKey: String {
        guard let key = Bundle.main.infoDictionary?["News_API"] as? String else {
            fatalError("❌ API_KEY not found in Info.plist")
        }
        return key
    }
}
