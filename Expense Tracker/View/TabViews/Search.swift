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
            LazyVStack(spacing: 12){
                
            }
            .searchable(text: $searchText)
        }
    }
}

#Preview {
    Search()
}
