//
//  Extensions.swift
//  PracticeConcept0705
//
//  Created by Shreyas on 07/05/25.
//

import SwiftUI

extension Color{
    static let themePrimary = Color(.gray)
    static let themeAssent = Color.blue
    static let cardBackground = Color.gray.opacity(0.2)
}

extension String{
    var capitalizedFirst: String{
        return prefix(1).capitalized + dropFirst()
    }
    
    func isNumeric() -> Bool{
        return Double(self) != nil
    }
}

extension Date{
    func formatted(style: DateFormatter.Style = .medium) -> String{
        let formatter = DateFormatter()
        formatter.dateStyle = style
        return formatter.string(from: self)
    }
}
