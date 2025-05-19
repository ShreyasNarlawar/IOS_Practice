//
//  ChildView.swift
//  PracticeConcept0705
//
//  Created by Siddhatech on 07/05/25.
//

import SwiftUI

struct ChildView: View {
    let name: String
    var body: some View {
        Text("child sees Name: \(name)")
            .foregroundColor(.orange)
    }
}
