//
//  ContentView.swift
//  App545
//
//  Created by IGOR on 02/05/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var current_tab: Tab = Tab.Goals

    @AppStorage("status") var status: Bool = false
    
    init() {
        
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack(spacing: 0, content: {
                
                TabView(selection: $current_tab, content: {
                    
                    GoalsView()
                        .tag(Tab.Goals)
                    
                    ACtivitiesView()
                        .tag(Tab.Activities)

                    SettingsView()
                        .tag(Tab.Settings)

                })
                
                TabBar(selectedTab: $current_tab)
            })
            .ignoresSafeArea(.all, edges: .bottom)
            .onAppear {
                
                
            }
        }
    }
}

#Preview {
    ContentView()
}
