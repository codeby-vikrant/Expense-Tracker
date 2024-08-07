//
//  Search.swift
//  Expense Tracker
//
//  Created by Vikrant Vani on 04/08/24.
//

import SwiftUI

struct Search: View {
    //View properties
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack{
            ScrollView(.vertical){
                LazyVStack(spacing: 12){
                    
                }
            }
            .overlay(content: {
                ContentUnavailableView("Search Transaction", systemImage: "magnifyingglass")
                    .opacity(searchText.isEmpty ? 1 : 0)
            })
            .onChange(of: searchText, {oldValue, newValue in
                    print(searchText)
            })
            .searchable(text: $searchText)
            .navigationTitle("Search")
            .background(.gray.opacity(0.15))
        }
    }
}

#Preview {
    Search()
}
