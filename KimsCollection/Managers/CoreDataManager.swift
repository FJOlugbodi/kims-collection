//
//  CoreDataManager.swift
//  KimsCollection
//
//  Created by Oluwafolajinmi Olugbodi on 7/11/21.
//

import Foundation
import CoreData


class CoreDataManager
{
    static let shared = CoreDataManager()
    
    //create an instance of persistent Container
    let persistentContainer: NSPersistentContainer

    
    //get reference to the managed object context
    let context: NSManagedObjectContext
    
    /*instruct the container to load the persistent stores and complete the creation of the Core Data stack*/
    init()
    {
        //data-storage unit initilization to contain Kim's Collection Model
        persistentContainer = NSPersistentContainer(name: "KimsCollectionModel")
        
        //load all persistent stores -- in this case a SQLite store (relational database)
        persistentContainer.loadPersistentStores
        { (decsription, error) in
            
            //if you get an error, unwrap the error
            if let error = error {fatalError("Core Data Store Failure \(error.localizedDescription)")}
            
        }//: LoadPersistentStores
        
        self.context = persistentContainer.viewContext
        
    }//: init
    
    
    /*Save Batch*/
    func save()
    {
//        //create an instance of batch to the managed objects graph
//        let batch = Batch(context: context)
//        batch.name = batchName
        
        //if changes made to object graph, try to save, else diplay error
        if self.context.hasChanges
        {
            
            do
            {
                try context.save()
                print("Saved Successfully!")
            }
            catch
            {
                print("Failed to save \(error)")
            }
            
        }//: if context
        
    }//: save
    
    func delete(_ object: NSManagedObject)
    {
        self.context.delete(object)
        
        do
        {
            try self.context.save()
        }
        catch
        {
            self.context.rollback() //restores everything to its last stored value
            print("Failed to delete \(error)")
        }
    }
    
//    func getBatches() -> [Batch] //return an array of batches
//    {
//        //initalize a fetch request from the fetch request fucntion of Batch class
//        let request: NSFetchRequest<Batch> = Batch.fetchRequest()
//
//        //sort the Batches in ascending order
//        let sort = NSSortDescriptor(key: "name", ascending: true) //sort by the name
//        request.sortDescriptors = [sort] //let the fetchRequest produce a sorted Batch array
//
//        //fetch data from Core Data
//        do
//        { //try to return the created Batches
//            return try context.fetch(request) //from the Managed Objects viewContext, fetch the givenbatches
//        }
//        catch
//        {
//            print("Failed to retrieve saved Bathces \(error)")
//            return [] //return an empty array
//        }
//    }//: getBatches
//
//    func updateBatch(_ batchName: String)
//    {
//        if self.context.hasChanges
//        {
//
//            do
//            {
//                try context.save()
//            }
//            catch
//            {
//                self.context.rollback() //restores everything to its last stored value
//                print("Failed to update \(batchName): \(error)")
//            }
//
//        }//: if context
//    }
    
    
}//: CoreDataManager



