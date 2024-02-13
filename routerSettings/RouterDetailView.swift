//
//  RouterDetailView.swift
//  routerSettings
//
//  Created by Dimitar Angelov on 13.02.24.
//

import SwiftUI

struct RouterDetailView: View {
    var router: Router

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(router.name)
                .font(.headline)

            if let url = URL(string: router.tutorialYouTubeLink), UIApplication.shared.canOpenURL(url) {
                Link("Watch Tutorial", destination: url)
                    .foregroundColor(.blue)
            } else {
                Text("Tutorial link is not available")
            }
        }
        .padding()
        .navigationBarTitle(Text(router.name), displayMode: .inline)
    }
}

#Preview {
    RouterDetailView(router: Router(name: "Router Model 1", tutorialYouTubeLink: "https://youtu.be/exampleLink1"))
}
