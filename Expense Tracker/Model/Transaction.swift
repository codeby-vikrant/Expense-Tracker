//
//  Transaction.swift
//  Expense Tracker
//
//  Created by Vikrant Vani on 04/08/24.
//

import SwiftUI

struct Transaction: Identifiable {
    let id: UUID = .init()
    //Properties
    var title: String
    var remarks: String
    var amount: Double
    var dateAdded: Date
    var category: String
    var tintColor: String
    
    init(title: String, remarks: String, amount: Double, dateAdded: Date, category: Category, tintColor: TintColor) {
        self.title = title
        self.remarks = remarks
        self.amount = amount
        self.dateAdded = dateAdded
        self.category = category.rawValue
        self.tintColor = tintColor.color
    }
    //extracting colors
    var color: Color{
        return tints.first(where: {$0.color == tintColor})?.value ?? appTint
    }
}

//Sample transactions for UI Building
var sampleTransaction: [Transaction] = [
    .init(title: "Magic Keyboard", remarks: "Apple Product", amount: 7500, dateAdded: .now, category: .expense, tintColor: tints.randomElement()!),
    .init(title: "Apple Music", remarks: "Subscription", amount: 99, dateAdded: .now, category: .expense, tintColor: tints.randomElement()!),
    .init(title: "iCloud+", remarks: "Subscription", amount: 5900, dateAdded: .now, category: .expense, tintColor: tints.randomElement()!),
    .init(title: "Payment", remarks: "Payment Received", amount: 2499, dateAdded: .now, category: .income, tintColor: tints.randomElement()!),
]
