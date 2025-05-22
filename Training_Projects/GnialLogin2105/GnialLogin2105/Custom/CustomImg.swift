//
//  CustomImg.swift
//  GnialLogin2105
//
//  Created by Siddhatech on 21/05/25.
//

import SwiftUI

struct CustomImg: View {
    let image: String
    var imageColor: Color? = nil
    var rotationDegree: CGFloat? = nil
    
    init(image: String, imageColor: Color? = nil, rotationDegree: CGFloat? = nil) {
        self.image = image
        self.imageColor = imageColor
        self.rotationDegree = rotationDegree
    }
    var body: some View{
        if imageColor != nil && rotationDegree != nil{
            Image(self.image).resizable().renderingMode(.template).foregroundColor(imageColor).rotationEffect(.degrees(rotationDegree ?? 0)).scaledToFit()
        }else if rotationDegree != nil{
            Image(self.image).resizable().rotationEffect(.degrees(rotationDegree ?? 0)).scaledToFit()
        }else if imageColor != nil{
            Image(self.image).resizable().renderingMode(.template).foregroundColor(imageColor).scaledToFit()
        }else{
            Image(self.image).resizable().aspectRatio(contentMode: .fit)
        }
    }
}
