//
//  SomeTransaction.swift
//  TransactionFetcherTwo
//
//  Created by oren shalev on 19/02/2023.
//

import Foundation

import CoreData
import Foundation

// Exists to provide a movie to use with MovieDetailView and MovieEditView
extension CDTransaction {
    
    // Example movie for Xcode previews
    static var example: CDTransaction {
        
        // Get the first movie from the in-memory Core Data store
        let context = PersistenceController.preview.container.viewContext
        
        let fetchRequest: NSFetchRequest<CDTransaction> = CDTransaction.fetchRequest()
        fetchRequest.fetchLimit = 1
        
        let results = try? context.fetch(fetchRequest)
        
        return (results?.first!)!
    }
    
}
