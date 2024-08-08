//
//  ChartModel.swift
//  Expense Tracker
//
//  Created by Vikrant Vani on 08/08/24.
//

import SwiftUI

struct ChartGroup: Identifiable{
    let id: UUID = .init()
    var date: Date
    var categories: [ChartCategory]
    var totalIncome: Double
    var totalExpense: Double
}

struct ChartCategory: Identifiable{
    let id: UUID = .init()
    let totalValue: Double
    let category: Category
}
