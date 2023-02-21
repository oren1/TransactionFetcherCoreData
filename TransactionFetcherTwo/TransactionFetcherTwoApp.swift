//
//  TransactionFetcherTwoApp.swift
//  TransactionFetcherTwo
//
//  Created by oren shalev on 20/04/2022.
//

import SwiftUI

@main
struct TransactionFetcherTwoApp: App {
    @Environment(\.scenePhase) var scenePhase
    let modelData = ModelData()
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
//                .background(Color(red: 0.106, green: 0.129, blue: 0.204))
                .environmentObject(modelData)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) { _ in
            persistenceController.save()
        }
    }
}
