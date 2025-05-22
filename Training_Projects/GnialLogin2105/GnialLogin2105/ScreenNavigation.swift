//
//  ScreenNavigation.swift
//  GnialLogin2105
//
//  Created by Siddhatech on 21/05/25.
//
import SwiftUI

struct ScreenNames{
    static let SplashView = "SplashView"
    static let LoginView = "LoginView"
    static let SignUpView = "SignUpView"
    static let DashBoard = "DashBoard"
    static let TokenScreen = "TokenScreen"
    static let ForgetPass = "ForgetPass"
}

class HostingController<ContentView>: UIHostingController<ContentView> where ContentView : View{
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
}

struct ScreenNavigation<Content> where Content : View{
    var screenName : String? = ""
    func redirectToScreen(nextView: Content) {
        if screenName == ScreenNames.DashBoard {
            DispatchQueue.main.async {
                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                    let window = windowScene.windows.first
                    window?.rootViewController = HostingController(rootView: nextView)
                    window?.makeKeyAndVisible()
                }
            }
        }else{
            DispatchQueue.main.async {
                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                    let window = windowScene.windows.first
                    window?.rootViewController = UIHostingController(rootView: nextView)
                    window?.makeKeyAndVisible()
                }
            }
        }
    }
}

struct RedirectTo{
    
    static func logIn(){
        ScreenNavigation(screenName: ScreenNames.DashBoard).redirectToScreen(nextView: LoginView())
    }
    static func dashboard(){
        ScreenNavigation(screenName: ScreenNames.DashBoard).redirectToScreen(nextView: Dashboard())
    }
    static func tokenScreen(){
        ScreenNavigation(screenName: ScreenNames.TokenScreen).redirectToScreen(nextView: TokenScreen())
    }
    static func forgetPass(){
        ScreenNavigation(screenName: ScreenNames.ForgetPass).redirectToScreen(nextView: ForgetPass())
    }
   
    
}

