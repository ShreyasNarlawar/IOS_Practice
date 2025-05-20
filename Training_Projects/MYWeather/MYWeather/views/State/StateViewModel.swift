//
//  StateViewModel.swift
//  TheWeatherApp
//
//  Created by Shreyas on 13/05/25.
//
import Foundation

class StateViewModel: ObservableObject{

    @Published var states: [States] = []
    @Published var selectedState: String? = nil
    @Published var isDropDownVisible = false
    
    func fetchState(for country: String){
        guard let url = URL(string:"https://countriesnow.space/api/v0.1/countries/states")
        else{
            return
        }
        
        let body: [String: String] = ["country": country]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            
            do{
                let decode = try JSONDecoder().decode(StatesAPIResponse.self, from: data)
                DispatchQueue.main.async {
                    self.states = decode.data.states
                }
            }catch{
                print("Error while decoding :\(error)")
            }
        }.resume()
    }
}
