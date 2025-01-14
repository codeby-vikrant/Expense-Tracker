//
//  Expense_TrackerApp.swift
//  Expense Tracker
//
//  Created by Vikrant Vani on 04/08/24.
//

import SwiftUI
import WidgetKit

@main
struct Expense_TrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear{
                    WidgetCenter.shared.reloadAllTimelines()
                }
        }
        .modelContainer(for: [Transaction.self])
    }
}
