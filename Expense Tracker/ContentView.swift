//
//  ContentView.swift
//  Expense Tracker
//
//  Created by Vikrant Vani on 04/08/24.
//

import SwiftUI

struct ContentView: View {
    //intro visibility status
    @AppStorage("isFirsTime") private var isFirstTime: Bool = true
    
    //App lock properties
    @AppStorage("isAppLockEnabled") private var isAppLockEnabled: Bool = false
    @AppStorage("lockWhenAppGoesBackground") private var lockWhenAppGoesBackground: Bool = false
    
    //active tab
    @State private var activeTab: Tab = .recents
    
    var body: some View {
        LockView(lockType: .biometric, lockPin: "", isEnabled: isAppLockEnabled, lockWhenAppGoesBackground: lockWhenAppGoesBackground){
            
            TabView(selection: $activeTab){
                Recents()
                    .tag(Tab.recents)
                    .tabItem { Tab.recents.tabContent }
                
                Search()
                    .tag(Tab.search)
                    .tabItem { Tab.search.tabContent }
                
                Graphs()
                    .tag(Tab.charts)
                    .tabItem { Tab.charts.tabContent }
                
                Settings()
                    .tag(Tab.settings)
                    .tabItem { Tab.settings.tabContent }
            }
            .tint(appTint)
            .sheet(isPresented: $isFirstTime, content: {
                IntroScreen()
                    .interactiveDismissDisabled()
            })
        }
    }
}

#Preview {
    ContentView()
}
