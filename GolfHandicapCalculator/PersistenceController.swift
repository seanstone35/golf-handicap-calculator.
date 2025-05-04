//
//  PersistenceController.swift
//  GolfHandicapCalculator
//
//  Created by Sean Stone  on 5/3/25.
//


struct PersistenceController {
    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "GolfHandicapModel")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error: \(error), \(error.userInfo)")
            }
        }
    }
}
