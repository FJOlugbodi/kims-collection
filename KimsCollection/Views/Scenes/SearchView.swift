//
//  SearchView.swift
//  KimsCollection
//
//  Created by Oluwafolajinmi Olugbodi on 7/16/21.
//

import SwiftUI

struct SearchView: View {
    
    let coreDM = CoreDataManager.shared
    
    //fetch the entities
    @FetchRequest(entity: Batch.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Batch.name, ascending: true)]) var batches: FetchedResults<Batch>
    
    @FetchRequest(entity: Group.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Group.name, ascending: true)]) var groups: FetchedResults<Group>
    
    @FetchRequest(entity: Sample.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Sample.id, ascending: true)]) var samples: FetchedResults<Sample>
    
    
    var body: some View {
        
        NavigationView
        {
            ScrollView
            {
                
                ForEach(batches, id: \.self)
                { batch in
                    
                    HStack
                    {
                        Text("\(batch.name ?? "Unknown")")
                        
                        Spacer()
                    }//: HStack
                    .padding()
                    
                    Divider()
                        .padding(.vertical, 4)
                        .padding(.leading)
                }//:ForEach
                
            }//: ScrollView
            .navigationBarTitle("Search")
        }//: NavigationView
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
        SearchView().preferredColorScheme(.dark)
    }
}
