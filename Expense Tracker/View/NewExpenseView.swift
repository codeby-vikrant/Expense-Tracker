//
//  NewExpenseView.swift
//  Expense Tracker
//
//  Created by Vikrant Vani on 07/08/24.
//

import SwiftUI

struct NewExpenseView: View {
    //View properties
    @State private var title: String = ""
    @State private var remarks: String = ""
    @State private var amount: Double = .zero
    @State private var dateAdded: Date = .now
    @State private var category: Category = .expense
    
    //Random tint
    var tint: TintColor = tints.randomElement()!
    
    var body: some View {
        ScrollView(.vertical){
            VStack(spacing: 15){
                Text("Preview")
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .hSpacing(.leading)
                
                //Preview transaction card view
                TransactionCardView(transaction: .init(title: title.isEmpty ? "Title" : title, remarks: remarks.isEmpty ? "Remarks" : remarks, amount: amount, dateAdded: dateAdded, category: category, tintColor: tint))
                
            }
            .padding(15)
        }
        .navigationTitle("Add Transaction")
        .background(.gray.opacity(0.15))
    }
    
    @ViewBuilder
    func CustomSection(_ title: String, value: Binding<String>) -> some View{
        VStack(alignment: .leading, spacing: 10, content: {
            Text("Title")
                .font(.caption)
                .foregroundStyle(.gray)
                .hSpacing(.leading)
            
            TextField("Magic Keyboard", text: $title)
                .padding(.horizontal, 15)
                .padding(.vertical, 12)
                .background(.background, in: .rect(cornerRadius: 10))
        })
    }
}

#Preview {
    NavigationStack{
        NewExpenseView()
    }
}
