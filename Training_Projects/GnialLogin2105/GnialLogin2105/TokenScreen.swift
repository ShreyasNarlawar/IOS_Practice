//
//  TokenScreen.swift
//  GnialLogin2105
//
//  Created by Siddhatech on 21/05/25.
//


import SwiftUI

struct TokenScreen: View {
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    RedirectTo.logIn()
                }, label: {
                    Image("arrow")
                        .renderingMode(.template)
                        .foregroundColor(.acqua500)
                })
                .frame(width: 24, height: 24)
                .padding(.leading,20)
                Spacer()
            }
            .padding(.bottom,20)
            
            Text("instala tu Token Digital")
                .font(Font.system(size: 20,weight: .heavy,design: .rounded))
                .foregroundStyle(.blue400)
                .padding(.bottom,20)
            Text("escanea tus huellas dactilares para\n asegurarnos que eres tú.")
                .font(Font.system(size: 18,weight: .medium,design: .rounded))
                .multilineTextAlignment(.center)
                .foregroundStyle(.granito400)
                .padding(.bottom,40)
            CustomImg(image: "TokenImage")
                .frame(width: 163,height: 200)
                .padding(.bottom,40)
            
            
            CheckboxView()

            
            CustomBtn(btnText: "escanear huellas", foreColor: Color.white, backColor: .granito300,strokeColor: .granito300, action: {})
                .padding(.bottom,10)
              
                
            
            CustomBtn(btnText: "ya tengo Token", foreColor: .acqua500, backColor: .clear,strokeColor: .acqua500,action: {})
                .padding(.bottom,25)
            
            HStack{
                VStack(alignment: .leading){
                    Text("¿inconvenientes escaneando huellas?")
                        .font(Font.system(size: 16,weight: .medium,design: .rounded))
                    Text("agenda tu cita en sucursal.")
                        .font(Font.system(size: 14,weight: .thin,design: .rounded))
                    
                }
                Button(action: {
                    RedirectTo.logIn()
                }, label: {
                    Image("BackOrange")
                        .renderingMode(.template)
                        .rotationEffect(Angle(degrees: 180))
                        .foregroundColor(.acqua500)
                })
                .frame(width: 32, height: 32)
//                .padding(.leading,10)
                
            }
            .padding(.leading,20)
            .overlay(RoundedRectangle(cornerRadius: 12)
                .fill(.acqua500.opacity(0.20))
               
                
                .frame(width: 343,height: 68)
            )
               
            
            Spacer()
        }
    }
}

struct CheckboxView: View {
    @State private var isChecked: Bool = false

    var body: some View {
        Button(action: {
            isChecked.toggle()
        }) {
            HStack {
                Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                    .resizable()
                    .renderingMode(.template)
                    
                    .foregroundColor(isChecked ? .green : .acqua500)
                    .frame(width: 20,height: 20)
                Text("He leído y aceptado los Términos y Condiciones.")
                    .multilineTextAlignment(.leading)
                    .font(Font.system(size: 16,weight: .medium,design: .rounded))
                    .foregroundStyle(.granito400)
            }
        }
        .padding()
    }
}
#Preview {
    TokenScreen()
}
