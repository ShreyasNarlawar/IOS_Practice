//
//  DashBoard.swift
//  GnialLogin2105
//
//  Created by Siddhatech on 21/05/25.
//


import SwiftUI

struct Contact: Identifiable {
    let id: UUID = UUID()
    var img: String
    var name: String
    var number: String
}
struct custView: View {
    var contact: Contact
    var body: some View {
        
        
                
            HStack{
                Image(contact.img)
                    .padding(.leading,20)
                
                VStack(alignment: .leading)
                {
                    Text(contact.name)
                        .font(Font.system(size: 16,weight: .medium))
                        .foregroundStyle(.granito300)
                    Text(contact.number)
                        .font(Font.system(size: 16,weight: .heavy))
                        .foregroundStyle(.acqua500)
                }
                .padding(.leading,15)
                Spacer()
            }
            
            .frame(width: 343, height: 64)
            .background(Color.white)
            .cornerRadius(20)

    }
}

struct Dashboard: View {
    
    let contacts: [Contact] =
                [
                    Contact( img: "RD_Flag", name: "República Dominicana", number: "809-544-5555")
                    ,
                    Contact(img: "Estados_Unidos", name: "Estados Unidos", number: "1-888-864-8251")
                    ,
                    Contact(img: "Canada", name: "Canadá", number: "1-887-690-3774")
                    ,
                    Contact(img: "Espana", name: "España", number: "1-900-951-676")
                    ,
                    Contact(img: "Italia", name: "Italia", number: "1-800-17-2232")
                    
                ]
    
    var body: some View {
        VStack{
            
            HStack{
                topView
                    .padding()
                    .frame(alignment: .leading)
            }
            VStack{
                Text("contáctanos desde donde te encuentres:")
                    .font(Font.system(size: 16,weight: .medium))
                    .foregroundStyle(.granito300)
                    .frame(width: 343, height: 24, alignment: .leading)
                    .padding([.top],20)
                    .padding(.bottom,10)
                VStack{
                    
                    ForEach(contacts) { contact in
                        
                        custView(contact: contact)
                            
                            .frame(width: 343, height: 64)
                    }
                }
                
                Spacer()
            }
            .ignoresSafeArea()
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(Color(uiColor: UIColor.lightGray).opacity(0.3))
            
            Spacer()
          
        }
        
        .ignoresSafeArea(.all, edges: .bottom)
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
                })
            }

            Spacer() // Add Spacer to push the text to the right
           
            HStack{
                Text("números de contacto")
                    .font(Font.system(size: 18,weight: .heavy))
                    .foregroundStyle(.blue400)
            }
            .frame(alignment: .center)
            Spacer()
        }
    }
}


#Preview {
    Dashboard()
}
