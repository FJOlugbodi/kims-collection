//
//  PopulateChartView.swift
//  KimsCollection
//
//  Created by Oluwafolajinmi Olugbodi on 7/16/21.
//

import SwiftUI

struct PopulateChartView: View {
    
    @State private var isMenuShowing = false
    
//    let sampleEntity: Sample
    
    var body: some View {
        
        NavigationView
        {
            ZStack //meant to interact between the Menu and the ChartingView
            {
                //show the side menuView if isMenuSHowing == true
                if isMenuShowing
                {
                    
                    SideMenuView(isMenuShowing: $isMenuShowing)
                }
                
                ChartingView()
                    .cornerRadius(isMenuShowing ? 20 : 10) //round of edge of Charting view when menu is showing
                    .offset(x: isMenuShowing ? 300 : 0, y: isMenuShowing ? 45 : 0) //if menuShowing -> increase width of menu
                    .scaleEffect(isMenuShowing ? 0.8 : 1) //scale the Chartingview down a bit when Menu is showing
                    .navigationBarItems(leading:
                                            
                                            Button(action:{
                                                
                                                withAnimation(.spring())
                                                {
                                                    //make isMenuSHowing true to show the SideMenu with a "spring" action animation
                                                    isMenuShowing.toggle()
                                                }
                                                
                                            },
                                            label:
                                                {
                                                    Image(systemName: "list.bullet.indent").foregroundColor(Color.accentColor)
                                                }))
                    .navigationBarHidden(false)
                
            }//: ZStack
            
        }//: NavigationView
    }
}

struct PopulateChartView_Previews: PreviewProvider {
    static var previews: some View {
        PopulateChartView()
    }
}

struct ChartingView: View {
    
    @State private var isBatchLevel: Bool = false
    @State private var isGroupLevel: Bool = false
    @State private var isSampleLevel: Bool = false
    
    
//    let sampleEntity: Sample
    
    var body: some View {
        
        NavigationView
        {
//            ZStack
//            {
//                Color(.lightGray)
//
//
//
//            }//: ZStack
//            .ignoresSafeArea()
            
            SearchBatchToPopulate().navigationBarHidden(true)
            
            
        }//NavigationView
        
        
        
    }
}
