//
//  GolfHandicapCalculatorApp.swift
//  GolfHandicapCalculator
//
//  Created by Sean Stone  on 5/3/25.
//

import SwiftUI

@main
struct GolfHandicapCalculatorApp: App {
    let persistenceController = PersistenceController()

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
