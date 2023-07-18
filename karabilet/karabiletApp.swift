//
//  karabiletApp.swift
//  karabilet
//
//  Created by mahmut kara on 19.06.2023.
//

import SwiftUI
import CoreData

@main
struct karabiletApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


var persistentContainer: NSPersistentContainer = {

    let container = NSPersistentContainer(name: "Model")
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
        if let error = error as NSError? {
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
    })
    return container
}()

func saveContext () {
    let context = persistentContainer.viewContext
    if context.hasChanges {
        do {
            try context.save()
        } catch {
            
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
}
