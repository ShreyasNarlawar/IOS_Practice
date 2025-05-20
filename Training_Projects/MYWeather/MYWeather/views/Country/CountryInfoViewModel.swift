//
//  CountryInfoViewModel.swift
//  TheWeatherApp
//
//  Created by Shreyas on 19/05/25.
//

import Foundation
import SwiftUI

class CountryInfoViewModel: ObservableObject {
    @Published var countryInfo: CountryInfo?
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let apiKey = "YOUR_API_KEY" // Replace with your actual CountryLayer or backend API key

    func fetchCountryInfo(for country: String) {
        guard let encodedCountry = country.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: "https://api.countrylayer.com/v2/name/\(encodedCountry)?access_key=\(apiKey)") else {
            self.errorMessage = "Invalid URL"
            return
        }

        isLoading = true
        errorMessage = nil

        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                self.isLoading = false

                if let error = error {
                    self.errorMessage = "Network error: \(error.localizedDescription)"
                    return
                }

                guard let data = data else {
                    self.errorMessage = "No data received."
                    return
                }

                do {
                    let decoded = try JSONDecoder().decode([CountryInfo].self, from: data)
                    self.countryInfo = decoded.first
                } catch {
                    self.errorMessage = "Decoding failed: \(error.localizedDescription)"
                }
            }
        }.resume()
    }
}
