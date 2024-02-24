//
//  ContentView.swift
//  routerSettings
//
//  Created by Dimitar Angelov on 13.02.24.
//

import SwiftUI

struct MainView: View {
    let routers = [
        Router(name: "Ruijie  RG-EW1200G PRO", tutorialYouTubeLink: "https://youtu.be/XH5fdCTmQU8"),
        Router(name: "Tenda AC5 AC1200", tutorialYouTubeLink: "https://youtu.be/eGPME-raBU4")
    ]

    @State private var searchText = ""

    var body: some View {
        NavigationView {
            List(routers.filter { router in
                searchText.isEmpty || router.name.localizedCaseInsensitiveContains(searchText)
            }) { router in
                NavigationLink(destination: RouterDetailView(router: router)) {
                    Text(router.name)
                        .fontWeight(.medium)
                        .foregroundColor(.black) // Text color
                        .padding() // Padding for the text
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.red) // Item background color
                        .cornerRadius(10) // Rounded corners
                        .shadow(color: .gray.opacity(0.3), radius: 3, x: 0, y: 2) // Shadow for depth
                        .padding(.vertical, 4) // Spacing between items
                }
                .listRowBackground(Color.orange) // Use this to set the background color for the entire row
                .listRowInsets(EdgeInsets()) // Adjust or remove to match your design
            }
            .navigationTitle("Routers")
            .searchable(text: $searchText)
            .background(Color.orange) // Background color for the list/container
            .listStyle(PlainListStyle()) // Style of the list
        }
    }
}



#Preview {
    MainView()
}
