//
//  Speech_World_Controller_MainApp.swift
//  Speech-World-Controller-Main
//
//  Created by Nalinda on 20/2/2023.
//

import SwiftUI
import Firebase


final class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}


@main
struct Speech_World_Controller_MainApp: App {


    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
       @StateObject var sessionService = SessionServiceImpl()
       
       var body: some Scene {
           WindowGroup {
               NavigationView {
                   switch sessionService.state {
                       case .loggedIn:
                           HomeView()
                               .environmentObject(sessionService)
                       case .loggedOut:
                           LoginView()
                       }
                   
               }
           }
       }
}
