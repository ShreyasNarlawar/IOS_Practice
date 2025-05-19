//
//  CountryView.swift
//  TheWeatherApp
//
//  Created by Shreyas on 13/05/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var countryViewModel = CountryViewModel()
    @StateObject private var stateViewModel = StateViewModel()
    @StateObject private var cityViewModel = CityViewModel()
    @StateObject private var weatherViewModel = WeatherViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15){
            
            //FOR COUNTRY
            
            Text("Country").font(.headline)
            Button(action:{
                withAnimation{
                    countryViewModel.isDropDownVisible.toggle()
                }
            }){
                HStack{
                    Text(countryViewModel.selectedCountry ?? "Select a Country")
                        .foregroundColor(countryViewModel.selectedCountry == nil ? .gray: .purple.opacity(0.7))
                    Spacer()
                    Image(systemName: countryViewModel.isDropDownVisible ? "chevron.down" : "chevron.up")
                        .foregroundColor(.purple)
                }
                .padding()
                .background(Color(.gray.opacity(0.3)))
            }
            
            if countryViewModel.isDropDownVisible{
                ScrollView{
                    LazyVStack(alignment: .leading, spacing: 5){
                        ForEach(countryViewModel.countries){ country in
                            Button(action:{
                                withAnimation{
                                    countryViewModel.selectedCountry = country.name
                                    countryViewModel.isDropDownVisible = false
                                    stateViewModel.fetchState(for: country.name)
                                    // Clear dependent selections
                                    stateViewModel.selectedState = nil
                                    cityViewModel.selectedcity = nil
                                    cityViewModel.cities = []
                                }
                            }){
                                Text(country.name)
                                    .foregroundColor(.blue.opacity(0.9))
                                    .padding(.vertical,5)
                                    .padding(.horizontal)
                            }
                        }
                    }
                }
            }
            
            //FOR State
            
            if let _ = countryViewModel.selectedCountry{
                Text("State").font(.headline)
                Button(action:{
                    withAnimation{
                        stateViewModel.isDropDownVisible.toggle()
                    }
                }){
                    HStack{
                        Text(stateViewModel.selectedState ?? "Select a State")
                            .foregroundColor(stateViewModel.selectedState == nil ? .gray: .purple.opacity(0.7))
                        Spacer()
                        Image(systemName: stateViewModel.isDropDownVisible ? "chevron.down" : "chevron.up")
                            .foregroundColor(.purple)
                    }
                    .padding()
                    .background(Color(.gray.opacity(0.3)))
                }
                
                if stateViewModel.isDropDownVisible{
                    ScrollView{
                        LazyVStack(alignment: .leading, spacing: 5){
                            ForEach(stateViewModel.states){ state in
                                Button(action: {
                                    withAnimation{
                                        stateViewModel.selectedState = state.name
                                        stateViewModel.isDropDownVisible = false
                                        cityViewModel.fetchCity(for: countryViewModel.selectedCountry ?? "", states: state.name)
                                        cityViewModel.selectedcity = nil
                                    }
                                }){
                                    Text(state.name)
                                        .foregroundColor(.blue)
                                        .padding(.vertical,3)
                                        .padding(.horizontal)
                                }
                            }
                        }
                    }
                }
            }
            
            //FOR CITY
            
            if let _ = stateViewModel.selectedState{
                Text("City").font(.headline)
                Button(action:{
                    withAnimation{
                        cityViewModel.isDropDownVisible.toggle()
                    }
                }){
                    HStack{
                        Text(cityViewModel.selectedcity ?? "Select a City")
                            .foregroundColor(cityViewModel.selectedcity == nil ? .gray: .purple.opacity(0.7))
                        Spacer()
                        
                        Image(systemName: cityViewModel.isDropDownVisible ? "chevron.down" : "chevron.up")
                            .foregroundColor(.purple)
                    }
                    .padding()
                    .background(Color(.gray.opacity(0.3)))
                }
                
                if cityViewModel.isDropDownVisible{
                    ScrollView{
                        LazyVStack(alignment: .leading, spacing: 5){
                            ForEach(cityViewModel.cities){ city in
                                Button(action: {
                                    withAnimation{
                                        cityViewModel.selectedcity = city.name
                                        cityViewModel.isDropDownVisible = false
                                    }
                                }){
                                    Text(city.name)
                                        .foregroundColor(.blue)
                                        .padding(.vertical,3)
                                        .padding(.horizontal)
                                }
                            }
                        }
                    }
                }
            }
            
            //Next View Button
            
            if let city = cityViewModel.selectedcity,
               let state = stateViewModel.selectedState,
               let country = countryViewModel.selectedCountry{
                NavigationLink(destination: WeatherDetailView(viewModel:weatherViewModel, city: city, state: state, country: country)){
                    Spacer()
                    Text("Result")
                        .bold()
                        .font(.system(size:20))
                        .frame(width: 150,height: 40)
                        .background(.purple)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .shadow(radius: 100)
                        .padding()
                }
            }
        }.padding()
         .onAppear{
            countryViewModel.fetchCountry()
        }
    }
}


#Preview {
    HomeView()
}
