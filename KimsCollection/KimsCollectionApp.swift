//
//  KimsCollectionApp.swift
//  KimsCollection
//
//  Created by Oluwafolajinmi Olugbodi on 7/11/21.
//

import SwiftUI

@main
struct KimsCollectionApp: App {
    
    let coreDM = CoreDataManager.shared
    
//    @AppStorage("isOnBoarding") var isOnBoarding: Bool = true
    
    
    //save the managedObjectCOntext when the app goes into the "background"
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene
    {
        
//        WindowGroup
//        {
//            if isOnBoarding == true
//            {//if at onBoarding screen, display onboarding window
//
//                OnBoardingView()
//            }
//            else {//else display content window
//
//                MainView()
//                    .environment(\.managedObjectContext, coreDM.context) //add environment to contentView()
//            }
//        }//: WindowGroup
//        .onChange(of: scenePhase) { (newScenePhase) in
//
//            switch newScenePhase
//            {
//                case .background:
//                    print("Scence is in background")
//                    coreDM.save()
//                case .inactive:
//                    print("Scence is in inactive")
//                    coreDM.save()
//                case .active:
//                    print("Scence is in active")
//                @unknown default:
//                    print("Something's changed")
//            }//: Switch
//        }//: onChange
        
        WindowGroup
        {
            MainView()
                .environment(\.managedObjectContext, coreDM.context) //add environment to contentView()
        }//: WindowGroup
        .onChange(of: scenePhase) { (newScenePhase) in

            switch newScenePhase
            {
                case .background:
                    print("Scence is in background")
                    coreDM.save()
                case .inactive:
                    print("Scence is in inactive")
                    coreDM.save()
                case .active:
                    print("Scence is in active")
                @unknown default:
                    print("Something's changed")
            }//: Switch
        }//: onChange
        
    }//: BODY
}
