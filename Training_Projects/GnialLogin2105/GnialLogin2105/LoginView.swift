//
//  LoginView.swift
//  GnialLogin2105
//
//  Created by Siddhatech on 21/05/25.
//
import SwiftUI

struct LoginView: View {
    @State var username: String = ""
    @State var password: String = ""
    
    
    func validateButton()-> Bool {
        let flag = username == "" || password == ""
        return flag
    }
    func validate()-> Bool {
        let flag = username == "shrey" && password == "pass"
        return flag
    }
    
    func login() -> Void {
        if validate() {
            RedirectTo.dashboard()
        }
    }
    func signUp() -> Void {
        RedirectTo.tokenScreen()
    }
    var body: some View {
        ZStack{
            VStack {
                HStack{
                    Spacer()
                    Image("menu")
                        .resizable()
                        .foregroundStyle(.red)
                        .frame(width: 32,height: 32)
                        
                }
                .padding(.bottom)
                HStack{
                    Image("Gnial")
                        .resizable()
                        .frame(width: 135,height: 80)
                }
                .padding(.bottom,80)
                
                
                LoginFormView
                    .padding([.bottom],150)
                CustomBtn(btnText: "iniciar sesión", foreColor: Color.white, backColor: .granito300,strokeColor: .granito300, action: login)
                    .padding(.bottom,10)
                    .opacity(validateButton() ? 0.8 : 1)
                    .disabled(validateButton())
                    
                
                CustomBtn(btnText: "hazte cliente", foreColor: .acqua500, backColor: .clear, strokeColor: .acqua500,action: signUp)
                    .padding(.bottom,20)
                
                Text("¿problemas para iniciar sesión?")
                    .font(Font.system(size: 16,weight: .heavy))
                    .foregroundColor(.acqua500)
                    .frame(width: 258,height: 24)
                    .onTapGesture {
                        RedirectTo.forgetPass()
                    }
                
                Spacer()
                
            }
            .padding()
           
        }
    }
    private var LoginFormView : some View{
        VStack{
            CustomFieldView(bindingField: $username,placeholder: "usuario", icon: "user")
                .padding([.bottom],20)
            
            CustomFieldView(bindingField: $password,placeholder: "contraseña",  icon: "passwordLock")
                .padding([.bottom],10)
            
        }
    }
}
