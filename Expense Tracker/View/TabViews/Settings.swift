//
//  Settings.swift
//  Expense Tracker
//
//  Created by Vikrant Vani on 04/08/24.
//

import SwiftUI

struct Settings: View {
    //User properties
    @AppStorage("userName") private var userName: String = ""
    //App lock properties
    @AppStorage("isAppLockEnabled") private var isAppLockEnabled: Bool = false
    @AppStorage("lockWhenAppGoesBackground") private var lockWhenAppGoesBackground: Bool = false
    
    var body: some View {
        NavigationStack{
            List{
                Section("User Name"){
                    TextField("Vikrant", text: $userName)
                }
                Section("App Lock"){
                    Toggle("Enable App Lock", isOn: $isAppLockEnabled)
                    
                    if isAppLockEnabled{
                        Toggle("Lock When App Goes Background", isOn: $lockWhenAppGoesBackground)
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    ContentView()
}
