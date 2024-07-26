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
                    Label("Routers", systemImage: "wifi.router")
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
