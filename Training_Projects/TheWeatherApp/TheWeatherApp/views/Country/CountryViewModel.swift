//
//  CountryViewModel.swift
//  TheWeatherApp
//
//  Created by Shreyas on 13/05/25.
//

import Foundation

class CountryViewModel: ObservableObject {

    @Published var countries: [Country]=[]
    @Published var selectedCountry: String? = nil
    @Published var isDropDownVisible = false
    
    func fetchCountry(){
        guard let url = URL(string: "https://countriesnow.space/api/v0.1/countries/positions") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
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
                let decode = try JSONDecoder().decode(CountryAPIResponse.self, from: data)
                DispatchQueue.main.async {
                    self.countries = decode.data.map{Country(name: $0.name)}
                }
            }catch{
                print("Error while decoding :\(error)")
            }
        }.resume()
    }
}
