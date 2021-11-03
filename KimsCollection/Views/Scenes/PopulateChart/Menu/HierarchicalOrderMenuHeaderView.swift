//
//  HierarchicalOrderMenuHeaderView.swift
//  KimsCollection
//
//  Created by Oluwafolajinmi Olugbodi on 7/16/21.
//

import SwiftUI

struct HierarchicalOrderMenuHeaderView: View {
    
    //Bind to SideMenuView
    @Binding var isMenuShowing: Bool
    
    var body: some View {
        
        ZStack(alignment: .topTrailing)
        {
            Button(action:
                    {
                        //if button pressed, stop showing menuHeader with a "spring" animiation
                        withAnimation(.spring())
                        {
                            isMenuShowing.toggle()
                        }
                    },
                   label:
                    {
                        Image(systemName: "arrow.up.backward")
                            .frame(width: 38, height: 38)
                            .foregroundColor(Color.black.opacity(0.7))
                            .padding()
                })//: Button
            
        }
        .padding()//: ZStack
    }
}

struct HierarchicalOrderMenuHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HierarchicalOrderMenuHeaderView(isMenuShowing: .constant(true))
    }
}
