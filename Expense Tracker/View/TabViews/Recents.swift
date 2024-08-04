//
//  Recents.swift
//  Expense Tracker
//
//  Created by Vikrant Vani on 04/08/24.
//

import SwiftUI

struct Recents: View {
    //User properties
    @AppStorage("userName") private var userName: String = ""
    
    //View properties
    @State private var startDate: Date = .now.startOfMonth
    @State private var endDate: Date = .now.endOfMonth
    
    var body: some View {
        GeometryReader{
            //Animation
            let size = $0.size
            
            NavigationStack{
                ScrollView(.vertical){
                    LazyVStack(spacing: 10, pinnedViews: [.sectionHeaders]){
                        Section{
                            //Date Filter Button
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Text("")
                            })
                        } header: {
                            HeaderView(size)
                        }
                    }
                    .padding(15)
                }
            }
        }
    }
    //Header view
    @ViewBuilder
    func HeaderView(_ size: CGSize) -> some View{
        HStack(spacing: 10){
            VStack(alignment: .leading, spacing: 5, content: {
                Text("Welcome!")
                    .font(.title.bold())
                
                if !userName.isEmpty{
                    Text(userName)
                        .font(.callout)
                        .foregroundStyle(.gray)
                }
            })
            .visualEffect{content, geometryProxy in
            content
                    .scaleEffect(headerScale(size, proxy: geometryProxy), anchor: .topLeading)
            }
            Spacer(minLength: 0)
            
            NavigationLink{
                
            } label: {
                Image(systemName: "plus")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 45, height: 45)
                    .background(appTint.gradient, in: .circle)
                    .contentShape(.circle)
            }
        }
        .padding(.bottom, userName.isEmpty ? 10 : 5)
            .background{
                VStack(spacing: 0){
                    Rectangle()
                        .fill(.ultraThinMaterial)
                    
                    Divider()
                }
                .visualEffect { content, geometryProxy in
                    content
                        .opacity(headerBGOpacity(geometryProxy))
                }
                    .padding(.horizontal, -15)
                    .padding(.top, -(safeArea.top + 15))
            }
    }
    
    func headerBGOpacity(_ proxy: GeometryProxy) ->  CGFloat{
        let minY = proxy.frame(in: .scrollView).minY + safeArea.top
        return minY > 0 ? 0 : (-minY / 15)
    }
    
    func headerScale(_ size: CGSize, proxy: GeometryProxy) ->  CGFloat{
        let minY = proxy.frame(in: .scrollView).minY
        let screenHeight = size.height
        
        let progress = minY / screenHeight
        let scale = min(max(progress, 0), 1) * 0.4
        return 1 + scale
    }
}

#Preview {
    ContentView()
}
