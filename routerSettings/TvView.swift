//
//  TvView.swift
//  routerSettings
//
//  Created by Dimitar Angelov on 14.03.24.
//

import SwiftUI

struct TvView: View {
    let tvs = [
        
        Tv(name: "NEO LED-40F1FHD", tutorialYouTubeLink:"https://youtu.be/-GDECa7YxNo", image: "neoled40f1fhd"),
        Tv(name: "NEO LED-2212VFDD", tutorialYouTubeLink:"https://youtu.be/hnw3HKHRrjU", image: "neoled2212vfhd"),
        Tv(name: "Samsung UE40KU6472UXXH", tutorialYouTubeLink:"https://youtu.be/e1gr09uy2YM", image: "samsungue40ku6472uxxh"),
        Tv(name: "PHILIPS 37PFL5405H/12", tutorialYouTubeLink:"https://youtu.be/faiI3MfQIWI", image: "philips37pfl5405h/12"),
        Tv(name: "HITACHI 24HB4T05", tutorialYouTubeLink:"https://youtu.be/s8421GJ4Qzk", image: "HITACHI24HB4T05"),
        Tv(name: "PHILIPS 32PHS4032/12", tutorialYouTubeLink:"https://youtu.be/jLVcmihOs5kk", image: "philips32phs403212"),
        Tv(name: "PHILIPS 55PU56401/12", tutorialYouTubeLink:"https://youtu.be/47p3A18U5RY", image: "PHILIPS55PU5640112"),
        Tv(name: "TESLA 43T319BF", tutorialYouTubeLink:"https://youtu.be/yxypOXP-rVc", image: "Tesla43t319bf"),
        Tv(name: "KIVI 40F750NB", tutorialYouTubeLink:"https://youtube.com/shorts/BCItqHJfyDM", image: "kivi40f750nb"),
        Tv(name: "FINLUX 43FFB4561", tutorialYouTubeLink:"https://youtu.be/t6W_33Hv_AA", image: "finlux43ffb4561"),
        Tv(name: "TELEFUNKEN 24HB4701", tutorialYouTubeLink:"https://youtu.be/t6W_33Hv_AA", image: "telefunken24hb4701"),
        Tv(name: "CROWN 32MB01F", tutorialYouTubeLink:"https://youtu.be/qP8bFkIa6Uk", image: "crown32mb01f")
    ]

    let backgroundGradientMain = LinearGradient(gradient: Gradient(colors: [Color.orange, Color.pink]), startPoint: .leading, endPoint: .trailing)

    @State private var searchText = ""

    var sortedTvs: [Tv] {
        tvs.sorted { $0.name < $1.name }
    }

    var body: some View {
        NavigationView {
            List(sortedTvs.filter { tv in
                searchText.isEmpty || tv.name.localizedCaseInsensitiveContains(searchText)
            }) { tv in
                NavigationLink(destination: TvDetailView(tv: tv)) {
                    Text(tv.name)
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
            .navigationTitle("TVs")
            .searchable(text: $searchText)
            .background(backgroundGradientMain) // Background color for the list/container
            .listStyle(PlainListStyle()) // Style of the list
        }
       
            }
    }

#Preview {
    TvView()
}
