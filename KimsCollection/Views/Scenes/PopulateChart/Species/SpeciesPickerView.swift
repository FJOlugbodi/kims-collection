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
    
    @Binding var isBatchLevel: Bool
    @Binding var isGroupLevel: Bool
    @Binding var isSampleLevel: Bool
    let sampleEntity: Sample
    
    @StateObject private var speciesManager = SpeciesManager()
    
    var body: some View {
        
        NavigationView
        {
            VStack
            {
//                VStack
//                {
//                    Text("Species")
//                        .font(.system(size: 50, weight: .semibold))
//                        .padding(.top)
//                }//: VStack
//
                HStack
                {
                    //create a picker "Drop down" menu to choose the appropriate species
                    Picker(selection: self.$selection,
                           label:
                            HStack
                            {
                                Text("Species: ")
                                Text(self.selection)
                            }//: HStack
                            .font(.headline)
                            .padding(.leading)
                            .multilineTextAlignment(.center)
                            .lineLimit(2),//: HStack
                           content:
                            {
                                ForEach(self.species, id: \.self)
                                {species in
                                    Text(species).tag(self.species)
                                }//: ForEach species
                            })//: Picker
                        .pickerStyle(MenuPickerStyle())
                    
                    Spacer()
                    
                }//: HStack
                .padding(.leading, 17)
                
                
                //if picker selection is not empty, show the "Continue" button which will add the selection to sample; then move to next screeen
                if !selection.isEmpty
                {
                    Button(action:
                            {
                                speciesManager.addSpecies(isBatchLevel: isBatchLevel, isGroupLevel: isGroupLevel, isSampleLevel: isSampleLevel, species: selection, sampleEntity: sampleEntity)
                                
                                selection = ""
                            },
                           label:
                            {
                                Text("Continue")
                            })
                        .accentColor(Color(.systemBlue))
                    
                } //: if !selection.isEmpty

                
            }//: VStack
            .navigationBarTitle("Species")
//            .navigationBarTitle(Text("\(sampleEntity.batch?.name ?? "")"))
            
        }//: NavigationView

    }
    
}

struct SpeciesPickerView_Previews: PreviewProvider {
    static var previews: some View {
        SpeciesPickerView(isBatchLevel: .constant(true), isGroupLevel: .constant(false), isSampleLevel: .constant(false), sampleEntity: Sample()).preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
