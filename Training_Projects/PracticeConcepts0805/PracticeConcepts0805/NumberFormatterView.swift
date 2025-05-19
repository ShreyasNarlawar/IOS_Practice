//
//  NumberFormatterView.swift
//  PracticeConcepts0805
//
//  Created by Siddhatech on 08/05/25.
//

import SwiftUI

struct NumberFormatterView: View {
    let amout: Double = 12345.67
    let percentage: Double = 0.2451
    
    var body: some View {
        VStack(spacing: 30){
            Text("Number Formatting").font(.title2).bold()
            
            // Currency Format
            Text("Currency: \(formatCurrency(amout))")
            
            //Percentage Format
            Text("Percentage: \(formatPercent(percentage))")
            
            //Raw Number Format
            Text("Decimal: \(formatDecimal(amout))")
        }
        .padding()
    }
    
    func formatCurrency(_ value: Double)-> String{
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        return formatter.string(from:NSNumber(value: value)) ?? "--"
    }
    
    func formatPercent(_ value: Double)-> String{
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 2
        return formatter.string(from: NSNumber(value: value)) ?? "--"
    }
    
    func formatDecimal(_ value: Double)-> String{
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = Locale.current.groupingSeparator
        return formatter.string(from: NSNumber(value: value)) ?? "--"
    }
    
}

#Preview {
    NumberFormatterView()
}
