//
//  TintColor.swift
//  Expense Tracker
//
//  Created by Vikrant Vani on 04/08/24.
//

import SwiftUI

//Tint Colors for rows
struct TintColor: Identifiable{
    let id: UUID = .init()
    let color: String
    var value: Color
}

var tints: [TintColor] = [
    .init(color: "Red", value: .red),
    .init(color: "Blue", value: .blue),
    .init(color: "Pink", value: .pink),
    .init(color: "Yellow", value: .yellow),
    .init(color: "Brown", value: .brown),
    .init(color: "Orange", value: .orange),
]
