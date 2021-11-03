//
//  EnterSampleView.swift
//  KimsCollection
//
//  Created by Oluwafolajinmi Olugbodi on 7/15/21.
//

import SwiftUI

struct EnterSampleView: View {
    
    //constants and variables
    
    let batchEntity: Batch
    let groupEntity: Group
    
    @FetchRequest(entity: Sample.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Sample.id, ascending: true)]) var samples: FetchedResults<Sample>
    
    var body: some View {
        
        NavigationView
        {
            ScrollView
            {
                VStack(alignment: .center, spacing: 20)
                {
                    Spacer().padding(.bottom)
                    
                    EnterSampleName(batchEntity: batchEntity, groupEntity: groupEntity)
                    
                    ScrollView(.horizontal, showsIndicators: false)
                    {
                        HStack(alignment: .center)
                        {
                            //for each of the requested groups of the chose Batch box
                            ForEach(samples)
                            { sample in
                                
                                SampleRelationshipView(sampleEntity: sample)
                            }//:ForEach
                            
                        }//:HStack
                    }//ScrollView inner Sample
                    
            
                }//: VStack
                .navigationBarTitle(Text("Samples"))
            }//: ScrollView
        }//NavigationView
        
    }
}

struct EnterSampleView_Previews: PreviewProvider {
    static var previews: some View {
        EnterSampleView(batchEntity: Batch(), groupEntity: Group())
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
