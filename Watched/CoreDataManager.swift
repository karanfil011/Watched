//
//  CoreDataManager.swift
//  Watched
//
//  Created by Ali on 10.12.2019.
//  Copyright © 2019 Ali. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    
    let persistantContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "WatchedModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error {
                print("Loading store failed", error)
            }
        })
        return container
    }()
    
    func fetchWatched() -> [Watched] {
        let context = persistantContainer.viewContext
        let fetchRequest = NSFetchRequest<Watched>(entityName: "Watched")
        
        do {
            let watched = try context.fetch(fetchRequest)
            return watched
        }
        catch {
            print("Failed to catch watched", error)
            return []
        }
    }
    
    
    
    
}
