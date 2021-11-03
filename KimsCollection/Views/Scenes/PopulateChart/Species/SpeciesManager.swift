//
//  SpeciesManager.swift
//  KimsCollection
//
//  Created by Oluwafolajinmi Olugbodi on 7/19/21.
//

import Foundation
import SwiftUI


class SpeciesManager: ObservableObject
{
    
    //create an instance of the @%Relation  to access methods
    @StateObject private var sampleRelation = SampleRelationship()
    @StateObject private var groupRelation = GroupRelationship()
    @StateObject private var batchRelation = BatchRelationship()
//
//    @State private var isBatchLevel: Bool = false
//    @State private var isGroupLevel: Bool = false
//    @State private var isSampleLevel: Bool = false
//    @State private var species: String = ""
//
//    let sampleEntity: Sample
    
//    //initlialization function
//    init(isBatchLevel: Bool, isGroupLevel: Bool, isSampleLevel: Bool, sample: Sample)
//    {
//        self.isBatchLevel = isBatchLevel
//        self.isGroupLevel = isGroupLevel
//        self.isSampleLevel = isSampleLevel
//        self.sampleEntity = sample
//    }
    
    func addSpecies(isBatchLevel: Bool, isGroupLevel: Bool, isSampleLevel: Bool, species: String, sampleEntity: Sample)
    {
        //if sample, choose to add to only sample
        if isSampleLevel
        {
//            isGroupLevel = false
//            isBatchLevel = false
            
            sampleRelation.addSampleSpecies(species: species, sample: sampleEntity)
        }
        
        //if sample, choose to add to group of samples
        if isGroupLevel
        {
//            isSampleLevel = false
//            isBatchLevel = false
            
            groupRelation.addGroupSpecies(species: species, sample: sampleEntity)
        }
        
        //if sample, choose to add to batch of samples
        if isBatchLevel
        {
//            isSampleLevel = false
//            isGroupLevel = false
            
            batchRelation.addBatchSpecies(species: species, sample: sampleEntity)
        }
        
        
    }//: addSpecies
    
}//: class
