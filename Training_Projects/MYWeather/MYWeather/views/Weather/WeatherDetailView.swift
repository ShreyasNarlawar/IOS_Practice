//
//  WeatherDetailView.swift
//  TheWeatherApp
//
//  Created by Shreyas on 15/05/25.

import SwiftUI

struct WeatherDetailView: View {
    @StateObject var viewModel = WeatherViewModel()
    var city: String
    var state: String
    var country: String
    
    var body: some View {
        VStack(spacing: 20) {
            if viewModel.isLoading {
                ProgressView()
                
            } else if let weatherData = viewModel.weatherData {
                Text("Weather in \(city), \(state), \(country)")
                    .font(.title2)
                    .bold()
                
                Text("Time: \(weatherData.observation_time)")
                    .font(.subheadline)
                    .bold()
                
                if let condition = weatherData.weather_descriptions.first {
                    Text(condition)
                        .font(.headline)
                }
                
                Text("Temperature: \(weatherData.temperature)°C")
                    .font(.system(size: 30))
                    .bold()
                
                Text("Humidity: \(weatherData.humidity)%")
                    .font(.headline)
                
                Text("Precipitation: \(weatherData.precip)mm")
                    .font(.headline)
                
                Text("Pressure: \(weatherData.pressure)hPa")
                    .font(.headline)
                
                Text("WindSpeed: \(weatherData.wind_speed)km/hr")
                    .font(.headline)
                
                Spacer()
                
                NavigationLink(destination: CountryInfoView(country: country)) {
                    Text("Country Info")
                        .bold()
                        .font(.system(size: 20))
                        .frame(width: 150, height: 40)
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .shadow(radius: 10)
                }
                .padding(.bottom)
                
            } else if let error = viewModel.errorMessage {
                Text("Error: \(error)")
                    .foregroundColor(.red)
                    .padding()
                Spacer()
            } else {
                Spacer()
            }
        }
        .padding()
        .onAppear {
            viewModel.fetchWeather(for: state)
        }
    }
}
