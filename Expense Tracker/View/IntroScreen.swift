//
//  IntroScreen.swift
//  Expense Tracker
//
//  Created by Vikrant Vani on 04/08/24.
//

import SwiftUI

struct IntroScreen: View {
    @AppStorage("isFirsTime") private var isFirstTime: Bool = false
    var body: some View {
        VStack(spacing: 15){
            Text("What's new in the\nExpense Tracker")
                .font(.largeTitle.bold())
                .multilineTextAlignment(.center)
                .padding(.top, 65)
                .padding(.bottom, 35)
         
            //Points View
            VStack(alignment: .leading, spacing: 25, content: {
                
            })
        }
    }
    @ViewBuilder
    func PointView(symbol: String, title: String, subTitle: String) -> some View{
        HStack(spacing: 15){
            Image(systemName: symbol)
                .font(.largeTitle)
            
        }
    }
}

#Preview {
    IntroScreen()
}
