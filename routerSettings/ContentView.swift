//
//  ContentView.swift
//  routerSettings
//
//  Created by Dimitar Angelov on 13.02.24.
//

import SwiftUI

struct ContentView: View {
    let routers = [
        Router(name: "Router Model 1", tutorialYouTubeLink: "https://youtu.be/exampleLink1"),
        Router(name: "Router Model 2", tutorialYouTubeLink: "https://youtu.be/exampleLink2")
    ]

    var body: some View {
        NavigationView {
            List(routers) { router in
                NavigationLink(destination: RouterDetailView(router: router)) {
                    Text(router.name)
                }
            }
            .navigationTitle("Routers")
        }
    }
}


#Preview {
    ContentView()
}
