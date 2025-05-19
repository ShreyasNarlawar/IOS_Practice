//
//  RegionTimeZone.swift
//  PracticeConcepts0805
//
//  Created by Siddhatech on 08/05/25.
//

import SwiftUI

struct RegionTimeZone: View {
    var body: some View {
        VStack(spacing: 20){
            HStack{
                Text("🌍").font(.title)
                Text(" Region & Time Info.")
                    .font(.title).underline()
                    .bold()
            }
            HStack{
                Text("Current Region:")
                    .font(.headline)
                Text(Locale.current.identifier)
                    .foregroundColor(.cyan)
        }
            HStack{
                Text("Current Time Zone:")
                    .font(.headline)
                Text(TimeZone.current.identifier)
                    .foregroundColor(.cyan)
        }
            HStack{
                Text("GMT OffSet:")
                    .font(.headline)
                Text("\(TimeZone.current.secondsFromGMT() / 3600) hours")
                    .foregroundColor(.orange)
        }
            Spacer()
        }
        .padding()
        .navigationTitle("Region Settings")
    }
}

#Preview {
    RegionTimeZone()
}
