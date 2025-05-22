//
//  CustomFieldView.swift
//  GnialLogin2105
//
//  Created by Siddhatech on 21/05/25.
//

import SwiftUI

struct CustomFieldView: View {
    @Binding var bindingField: String
    var placeholder: String
    var size: CGFloat = 20
    var icon: String
    
    var body: some View {
        HStack{
            Image(icon)
                .renderingMode(.original)
                .frame(width: 24, height: 24)
                .foregroundStyle(.granito300)
                .padding([.leading],10)
            TextField(placeholder,text: $bindingField)
                .padding([.leading],10)
                .autocorrectionDisabled(true)
                .autocapitalization(.none)
        }
        .frame(width: 343, height: 30)
        .padding([.leading],15)
        .padding([.vertical],12)
        .overlay(RoundedRectangle(cornerRadius: 25.0, style: .continuous)
            .stroke(.granito300, lineWidth: 1))
    }
}
