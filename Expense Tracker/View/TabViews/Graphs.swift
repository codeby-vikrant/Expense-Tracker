//
//  Graphs.swift
//  Expense Tracker
//
//  Created by Vikrant Vani on 04/08/24.
//

import SwiftUI
import Charts
import SwiftData

struct Graphs: View {
    
    //View properties
    @Query(animation: .snappy) private var transactions: [Transaction]
    @State private var chartGroups: [ChartGroup] = []
    
    var body: some View {
        ScrollView(.vertical){
            LazyVStack(spacing: 10){
                //Chart view
                Chart{
                    ForEach(chartGroups){ group in
                        ForEach(group.categories){ chart in
                            BarMark(x: .value("Month", format(date: group.date, format: "MM yy")), y: .value(chart.category.rawValue, chart.totalValue))
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    Graphs()
}
