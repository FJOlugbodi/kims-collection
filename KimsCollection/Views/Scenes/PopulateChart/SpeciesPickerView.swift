//
//  SpeciesPickerView.swift
//  KimsCollection
//
//  Created by Oluwafolajinmi Olugbodi on 7/19/21.
//

import SwiftUI

struct SpeciesPickerView: View {
    
    @State var selection: String = ""
    let species: [String] = ["Human", "Mouse - Mus musculus", "Rat - Rattus Norvegicus", "Danio Rerio - Zebrafish", "Coturnix Japonica - Japanese Quail", "Drosophila Melanogaster - Fruit/Vinegar Fly", "S. Cerevisiae - Baker's/Brewer's Yeast", "C. Elegans", "Mycobacterium Tuberculosis", "Planaria", "Water (for negative controls without nucleic material)"]
    
    //create an instance of the GroupRelation  to access methods
    @StateObject private var sampleRelation = SampleRelationship()
    @StateObject private var groupRelation = GroupRelationship()
    @StateObject private var batchRelation = BatchRelationship()
    
    @Binding var isBatchLevel: Bool
    @Binding var isGroupLevel: Bool
    @Binding var isSampleLevel: Bool
    
    let sampleEntity: Sample
    
    var body: some View {
        
        HStack
        {
            //create a picker "Drop down" menu to choose the appropriate species
            Picker(selection: $selection,
                   label:
                    HStack
                    {
                        Text("Species: ")
                        Text(selection)
                    }//: HStack
                    .font(.headline)
                    .padding(.leading)
                    .multilineTextAlignment(.center)
                    .lineLimit(2),//: HStack
                   content:
                    {
                        ForEach(species, id: \.self)
                        {species in
                            Text(species).tag(species)
                            
                        }//: ForEach species
                    })
                .pickerStyle(MenuPickerStyle())
            
            Spacer()
            
        }//: HStack
        .padding(.leading, 17)

    }
}

struct SpeciesPickerView_Previews: PreviewProvider {
    static var previews: some View {
        SpeciesPickerView(isBatchLevel: .constant(true), isGroupLevel: .constant(false), isSampleLevel: .constant(false), sampleEntity: Sample())
    }
}
