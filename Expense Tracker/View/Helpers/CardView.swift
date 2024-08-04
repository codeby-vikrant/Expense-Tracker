//
//  CardView.swift
//  Expense Tracker
//
//  Created by Vikrant Vani on 04/08/24.
//

import SwiftUI

struct CardView: View {
    var income: Double
    var expense: Double
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .fill(.background)
            
            VStack(spacing: 0){
                HStack(spacing: 12){
                    Text("\(currencyString(income - expense))")
                        .font(.title.bold())
                    
                    Image(systemName: expense > income ? "chart.line.downtrend.xyaxis" : "chart.line.uptrend.xyaxis")
                        .font(.title3)
                        .foregroundStyle(expense > income ? .red : .green)
                }
                .padding(.bottom, 25)
                
                HStack(spacing: 0){
                    ForEach(Category.allCases, id: \.rawValue){ category in
                        let symbolImage = category == .income ? "arrow.down" : "arrow.up"
                        HStack(spacing: 10){
                            
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ScrollView{
        CardView(income: 4590, expense: 2389)
    }
}
