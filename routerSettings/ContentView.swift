//
//  ContentView.swift
//  routerSettings
//
//  Created by Dimitar Angelov on 14.03.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            MainView()
                .tabItem {
                    Label("Routers", systemImage: "network")
                }
            TvView()
                .tabItem{
                    Label("TVs", systemImage: "tv")
                }
            
        }
    }
}

#Preview {
    ContentView()
    
}
