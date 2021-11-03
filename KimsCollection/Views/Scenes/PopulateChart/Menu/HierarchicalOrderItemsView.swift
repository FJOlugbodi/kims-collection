//
//  HierarchicalOrderItemsView.swift
//  KimsCollection
//
//  Created by Oluwafolajinmi Olugbodi on 7/16/21.
//

import SwiftUI

struct HierarchicalOrderItemsView: View {
    
    @ObservedObject private var chartManager = ChartingManager()
    
    var body: some View {
        
        VStack
        {
            HStack(spacing: 16)
            {
//                Text("Batch")
//                    .font(.system(size: 24, weight: .heavy))
                
                //show the current Batch TabView Scene
                NavigationLink(
                    destination: ChartingTabViewBatchView(selection: chartManager.getBatchSelection(), batchEntity: chartManager.getBatch()),
                    label:
                        {
                        Text("Batch")
                            .font(.system(size: 24, weight: .heavy))
                    })
                
                
//                Button(action:
//                        {
//                            print("Batch Button Pressed")
//
//                            //show the current Batch TabView Scene
////                            ChartingTabViewBatchView(selection: chartManager.getBatchSelection(), batchEntity: chartManager.getBatch())
//
//
//                            //send true to make a certain screen appear on the press of the button
////                            SampleSpeciesPickerView()
//                        },
//                       label:
//                        {
//                            Text("Batch")
//                                .font(.system(size: 24, weight: .heavy))
//                        })
//
                
                
                Spacer()
            }//: HStack Group
            .foregroundColor(Color.black.opacity(0.7))
            .padding()
            
            HStack(spacing: 16)
            {
                Text("Group")
                    .font(.system(size: 24, weight: .heavy))
                
                
                
                Spacer()
            }//: HStack Group
            .foregroundColor(Color.black.opacity(0.7))
            .padding()
            
            HStack(spacing: 16)
            {
                Text("Sample")
                    .font(.system(size: 24, weight: .heavy))
                
                
                
                Spacer()
            }//: HStack Group
            .foregroundColor(Color.black.opacity(0.7))
            .padding()
            
        }//: VStack
    }
}

struct HierarchicalOrderItemsView_Previews: PreviewProvider {
    static var previews: some View {
        HierarchicalOrderItemsView()
    }
}
