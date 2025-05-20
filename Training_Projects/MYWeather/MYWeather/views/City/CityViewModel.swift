//
//  CityViewModel.swift
//  TheWeatherApp
//
//  Created by Shreyas on 14/05/25.
//

import Foundation

class CityViewModel: ObservableObject{
    @Published var cities: [Cities] = []
    @Published var selectedcity: String? = nil
    @Published var isDropDownVisible = false
    
    func fetchCity(for country: String, states: String){
    
        guard let url = URL(string: "https://countriesnow.space/api/v0.1/countries/state/cities")
        else { return }
        
        let body: [String: String] = ["country": country, "state": states]
        var request = URLRequest(url : url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        
        URLSession.shared.dataTask(with: request){ data, response, error in
            guard let data = data else { return }
            
            do{
                let decode = try JSONDecoder().decode(CitiesAPIResponse.self, from: data)
                DispatchQueue.main.async {
                    self.cities = decode.data.map {Cities(name: $0)}
                }
            }catch{
                print("Error while decoding :\(error)")
            }
        }.resume()
    }
}
