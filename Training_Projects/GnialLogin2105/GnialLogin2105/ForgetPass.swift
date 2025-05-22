//
//  ForgetPass.swift
//  GnialLogin2105
//
//  Created by Siddhatech on 21/05/25.
//


import SwiftUI

struct ForgetPass: View {
    var body: some View {
        VStack{
                topView
                .padding(.bottom,10)
//                .padding(.top,-40)
                .frame(alignment: .leading)
                
            VStack(alignment: .center){
                CustomImg(image: "forgotPass")
                    .frame(width: 201,height: 169)
                    .padding(.bottom,30)
                
                Text("tu perfil está bloqueado")
                    .font(Font.system(size: 20,weight: .heavy, design: .rounded))
                    .foregroundStyle(.blue400)
                    .padding(.bottom,20)
                Text("superaste la cantidad de intentos\n permitidos para iniciar sesión.\n")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.granito400)
                    .font(Font.system(size: 18,weight: .medium,design: .rounded))
                Text("para desbloquear tu usuario llama a\n Telebanco Popular al 809-544-5555 o\n visítanos en la sucursal más cercana a ti,\n agenda tu cita para evitar filas.\n")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.granito400)
                    .font(Font.system(size: 18,weight: .medium,design: .rounded))
                    .foregroundStyle(.granito400)
                Text("si te encuentras en el extranjero, consulta\n nuestros números de contacto.")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.granito400)
                    .font(Font.system(size: 18,weight: .medium,design: .rounded))
                    .foregroundStyle(.granito400)
            }
            .padding(.bottom,50)
            
            
            
            CustomBtn(btnText: "agendar una cita", foreColor: Color.white, backColor: .blue400, strokeColor: .blue400,action: {})
                .padding(.bottom,10)
                
                
            
            CustomBtn(btnText: "salir", foreColor: .acqua500, backColor: .clear, strokeColor: .acqua500,action: {})
                .padding(.bottom,20)
            Spacer()
        }
//        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity)
    }
    private var topView: some View {
        HStack{
            HStack{
                Button(action: {
                    RedirectTo.logIn()
                }, label: {
                    Image("arrow")
                        .renderingMode(.template)
                        .foregroundColor(.acqua500)
                        .frame(width: 24, height: 24)
                        .padding(.leading,20)
                })
            }

            Spacer()
        }
    }
}

