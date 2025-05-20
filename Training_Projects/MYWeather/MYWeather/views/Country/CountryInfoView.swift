//
//  CountryInfoView.swift
//  TheWeatherApp
//
//  Created by Shreyas on 19/05/25.
//

import SwiftUI

struct CountryInfoView: View {
    @StateObject private var viewModel = CountryInfoViewModel()
    let country: String

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else if let info = viewModel.countryInfo {
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text(info.country_name)
                                .font(.largeTitle)
                                .bold()
                            Spacer()
                            AsyncImage(url: URL(string: info.flag)) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 60, height: 40)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                        }

                        Group {
                            LabeledContent("Capital", value: info.capital)
                            LabeledContent("Region", value: info.region)
                            LabeledContent("Subregion", value: info.subregion)
                            LabeledContent("Population", value: "\(info.population.formatted())")
                            LabeledContent("Area", value: "\(info.area) km²")
                            LabeledContent("Currency", value: info.currency.name + " (\(info.currency.code))")
                            LabeledContent("Language", value: info.languages.joined(separator: ", "))
                            LabeledContent("Timezones", value: info.timezones.joined(separator: ", "))
                        }
                    }
                    .padding()
                } else if let error = viewModel.errorMessage {
                    Text("Error: \(error)")
                        .foregroundColor(.red)
                        .padding()
                }
            }
            .padding()
        }
        .navigationTitle("Country Info")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.fetchCountryInfo(for: country)
        }
    }
}
