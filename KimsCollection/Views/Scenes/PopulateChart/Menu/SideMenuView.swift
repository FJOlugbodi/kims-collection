//
//  SideMenuView.swift
//  KimsCollection
//
//  Created by Oluwafolajinmi Olugbodi on 7/16/21.
//

import SwiftUI

struct SideMenuView: View {
    
    //bind to PopulateChartView
    @Binding var isMenuShowing: Bool

    var body: some View {
        
        ZStack
        {
            //background for sideMenu of PopulateChartView
            LinearGradient(gradient: Gradient(colors: [Color.accentColor, Color.blue.opacity(0.4)]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack
            {
                HierarchicalOrderMenuHeaderView(isMenuShowing: $isMenuShowing)
                    .frame(height: 50)
                    .padding(.leading, 300)
                
                //Heiarchacal Order View Items
                HierarchicalOrderItemsView()
                
               Spacer()
            }//VStack
            .padding()
//            .ignoresSafeArea()
        }//: ZStack
        .navigationBarHidden(true)
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(isMenuShowing: .constant(true))
    }
}
