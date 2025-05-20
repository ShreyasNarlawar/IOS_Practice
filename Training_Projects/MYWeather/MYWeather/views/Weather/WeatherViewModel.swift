//
//  WeatherViewModel.swift
//  TheWeatherApp
//
//  Created by Shreyas on 14/05/25.
//

import Foundation

class WeatherViewModel: ObservableObject{
    @Published var weatherData: WeatherData?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let apiKey = "9bef6afc73f3a8830e14563e8a0b4fde"
    
    func fetchWeather(for city: String){
        let location = city
        fetchWeatherData(for: location)
    }
    
    private func fetchWeatherData(for location: String){
        isLoading = true
        errorMessage = nil
        
        guard let url = URL(string: "https://api.weatherstack.com/current?access_key=\(apiKey)&query=\(location)") else{
            DispatchQueue.main.async{
                self.isLoading = false
                self.errorMessage = "Invalid URL"
            }
            return
        }
        
        URLSession.shared.dataTask(with: url){ data, _, _ in
            DispatchQueue.main.async {
                self.isLoading = false
            }

            
            guard let data = data else {
                DispatchQueue.main.async {
                    self.errorMessage = "No data received"
                }
                return
            }
            
            do{
                let decode = try JSONDecoder().decode(WeatherAPIResponse.self, from: data)
                DispatchQueue.main.async{
                    self.weatherData = decode.current
                }
            }catch{
                DispatchQueue.main.async{
                    self.errorMessage = "Decoding issue"
                }
            }
        }
        .resume()
    }
}
