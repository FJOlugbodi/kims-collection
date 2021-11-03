//
//  SearchBatchToPopulate.swift
//  KimsCollection
//
//  Created by Oluwafolajinmi Olugbodi on 7/18/21.
//

import SwiftUI

struct SearchBatchToPopulate: View {
    
    //MARK: - PROPERTIES
    @FetchRequest(entity: Batch.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Batch.name, ascending: true)]) var batches: FetchedResults<Batch>
    
    @State var searchBatchName: String = ""
    @State var isSearching: Bool = false
    
    @StateObject private var chartingManager = ChartingManager()
    
    var body: some View {
        
        NavigationView
        {
            ScrollView
            {
                Spacer()
                
                SearchBatchPopulateBar(searchBatchName: $searchBatchName, isSearching: $isSearching)//: HStack
                
                //filter upon search by the batch name (interpolate name as String)
                ForEach(batches.filter({ "\($0.name ?? "Unknown")".contains(searchBatchName)}), id: \.self)
                { batch in
                    
                    HStack
                    {
                        NavigationLink(
                            destination:
                                //upon selected batch, show a tabview of batch questions-> attriubutes 
                                ChartingTabViewBatchView(selection: 0, batchEntity: batch).navigationBarHidden(true),
//                                BatchSpeciesPickerView(batchEntity: batch).navigationBarHidden(false),
                            label:
                                {
                                    Text("\(batch.name ?? "Unknown")")
                                        .font(.system(size: 16, weight: .semibold))
                                        .foregroundColor(Color.accentColor)
                                })
//                            .onTapGesture
//                            {
//                                //add the given batch to populate chart info when Batch selected
//                                chartingManager.addBatch(batch: batch)
//
//                                print("Added batch")
//                            }
                        
                        Spacer()
                    }//: HStack
                    .padding()
                    
                    Divider()
                        .padding(.vertical, 4)
                        .padding(.leading)
                }//:ForEach
                
                Spacer()
                
            }//: Scroll View
            .navigationBarTitle("Data Entry")
        }//: NavigationView
        

    }
}

struct SearchBatchToPopulate_Previews: PreviewProvider {
    static var previews: some View {
        SearchBatchToPopulate()
    }
}

struct SearchBatchPopulateBar: View {
    
    @Binding var searchBatchName: String
    @Binding var isSearching: Bool
    
    var body: some View {
        
        HStack
        {
            
            HStack
            {
                TextField("Search Batch to Chart", text: $searchBatchName)
                    .padding(.leading, 22)
            }//: HStack
            .padding(8)
            .background(Color(.systemGray5))
            .cornerRadius(9)
            .padding(.horizontal, 24)
            .onTapGesture
            {
                //display the x when searching
                isSearching = true
            }//: OnTapGesture
            .overlay(
                
                HStack
                {
                    Image(systemName: "magnifyingglass")
                        .padding(.leading, -9)
                    
                    Spacer()
                    
                    if isSearching
                    {
                        Button(action:
                                {
                                    //clear the TextField
                                    searchBatchName = ""
                                },
                               label:
                                {
                                    Image(systemName: "multiply.circle.fill")
                                        .padding(.vertical)
                                })//: Button
                    }//: if
                }//: HStack
                .padding(.horizontal, 38)
                .foregroundColor(.gray)
            )//: Overlay
            
            //if searching, display cancel button
            if isSearching
            {
                Button(action:
                        {
                            //remove the x
                            isSearching = false
                            //clear the search bar
                            searchBatchName = ""
                            //hide keyboard
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        },
                       label:
                        {
                            Text("Cancel")
                                .padding(.trailing)
                                .padding(.leading, -15)
                        })
                    .transition(.move(edge: .trailing))
                    .animation(.spring())
            }//if Searching
        }//:HStack
    }
}
