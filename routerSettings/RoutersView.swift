//
//  ContentView.swift
//  routerSettings
//
//  Created by Dimitar Angelov on 13.02.24.
//

import SwiftUI

struct RoutersView: View {
    let routers = [
        Router(name: "Ruijie RG-EW1200G PRO", tutorialYouTubeLink: "https://youtu.be/XH5fdCTmQU8", image: "Ruijie  RG-EW1200G PRO"),
        Router(name: "Tenda AC5", tutorialYouTubeLink: "https://youtu.be/eGPME-raBU4", image: "tendaac5"),
        Router(name: "Mercusys MW305R", tutorialYouTubeLink: "https://youtu.be/iyobEgfG2LE", image: "Mercusys MW305R"),
        Router(name: "Tp-link WR840N", tutorialYouTubeLink: "https://youtu.be/jQbcM67CQ7g", image: "tp-linkwr840n"),
        Router(name: "Cudy WR3000", tutorialYouTubeLink: "https://youtu.be/X85fAv070KU", image: "cudywr3000"),
        Router(name: "Tp-link C80", tutorialYouTubeLink: "https://youtu.be/jUDpgfuv0_8", image: "tp-linkc80"),
        Router(name: "Tp-link C60", tutorialYouTubeLink: "https://youtu.be/1KcwsOCbI3E", image: "tp-linkc60"),
        Router(name: "Tenda AC6", tutorialYouTubeLink: "https://youtu.be/cEhdW0tdEpw", image: "Tendaac6"),
        Router(name: "Tenda AC10", tutorialYouTubeLink: "https://youtu.be/z_1MpOG7BJE", image: "tendaac10"),
        Router(name: "Tp-link Archer C64", tutorialYouTubeLink: "https://youtu.be/Fb66skQXeo4", image: "tplinkarcherc64"),
        Router(name: "Tenda W311R", tutorialYouTubeLink: "https://youtu.be/qe9dTVNAsBo", image: "tendaw311r")
    ]

    let backgroundGradientMain = LinearGradient(gradient: Gradient(colors: [Color.orange, Color.pink]), startPoint: .leading, endPoint: .trailing)

    @State private var searchText = ""

    var sortedRouters: [Router] {
        routers.sorted { $0.name < $1.name }
    }

    var body: some View {
        NavigationView {
            List(sortedRouters.filter { router in
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
                .listRowBackground(backgroundGradientMain) // Use this to set the background color for the entire row
                .listRowInsets(EdgeInsets()) // Adjust or remove to match your design
            }
            .navigationTitle("Routers")
            .searchable(text: $searchText)
            .background(backgroundGradientMain) // Background color for the list/container
            .listStyle(PlainListStyle()) // Style of the list
        }
       
            }
    }



#Preview {
    RoutersView()
}
