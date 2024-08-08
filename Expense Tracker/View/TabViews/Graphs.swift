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
                ChartView()
                    .padding(10)
                    .frame(height: 200)
                    .background(.background, in: .rect(cornerRadius: 10))
            }
        }
        .onAppear{
            //Creating chart group
            createChartGroup()
        }
    }
    
    @ViewBuilder
    func ChartView() -> some View{
        //Chart view
        Chart{
            ForEach(chartGroups){ group in
                ForEach(group.categories){ chart in
                    BarMark(
                        x: .value("Month", format(date: group.date, format: "MM yy")),
                        y: .value(chart.category.rawValue, chart.totalValue), width: 20
                    )
                    .position(by: .value("Category", chart.category.rawValue), axis: .horizontal)
                    .foregroundStyle(by: .value("Category", chart.category.rawValue))
                }
            }
        }
        //Making chart scrollable
        .chartScrollableAxes(.horizontal)
        
        //Foreground colors
        .chartForegroundStyleScale(range: [Color.green.gradient, Color.red.gradient])
    }
    
    func createChartGroup() {
        Task.detached(priority: .high){
            let calendar = Calendar.current
            let groupedByDate = Dictionary(grouping: transactions){ transaction in
                let components = calendar.dateComponents([.month, .year], from: transaction.dateAdded)
                return components
            }
            //Sorting groups by date
        }
    }
}

#Preview {
    Graphs()
}
