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
            RoutersView()
                .tabItem {
                    Label("Routers", systemImage: "network")
                }
            
        }
    }
}

#Preview {
    ContentView()
}
