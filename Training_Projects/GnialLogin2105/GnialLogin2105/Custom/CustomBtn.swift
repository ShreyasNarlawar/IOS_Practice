//
//  CustomBtn.swift
//  GnialLogin2105
//
//  Created by Siddhatech on 21/05/25.
//

import SwiftUI

struct CustomBtn: View {
    var btnText: String
    var foreColor: Color
    var backColor: Color
    var strokeColor: Color
    var action:() -> ()
    
    var body: some View{
        
        Button(action: {
            action()
        }
            , label: {
            Text(btnText)
                .font(Font.system(size: 16, weight: .heavy))
                .foregroundStyle(foreColor)
        })
        .frame(width: 342, height: 48)
        .background(RoundedRectangle(cornerRadius: 25.0, style: .continuous).fill(backColor).stroke(strokeColor,lineWidth:2))
        .ignoresSafeArea()
    }
}

