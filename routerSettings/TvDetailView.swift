import SwiftUI

struct TvDetailView: View {
    var tv: Tv

    let backgroundGradient = LinearGradient(gradient: Gradient(colors: [Color.orange, Color.purple]), startPoint: .topLeading, endPoint: .bottomLeading)

    var body: some View {
        // Start with the ScrollView to manage content
        ScrollView {
            VStack {
                Image(tv.image) // Display the router image
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity) // Make image fit the width of the screen with padding
                    .padding(.horizontal)

                // Check for valid URL and UIApplication capability to open it
                if let url = URL(string: tv.tutorialYouTubeLink), UIApplication.shared.canOpenURL(url) {
                    Link(destination: url) {
                        HStack {
                            Image(systemName: "play.circle.fill")
                                .foregroundColor(Color.yellow)
                                .imageScale(.large)
                            Text("Watch Tutorial")
                                .fontWeight(.semibold)
                                .foregroundColor(Color.blue)
                        }
                        .padding()
                        .background(Color.green.opacity(0.85))
                        .cornerRadius(10)
                    }
                } else {
                    Text("Tutorial link is not available")
                        .foregroundColor(.red)
                }
            }
            .padding() // Add padding around the VStack content
        }
        .background(backgroundGradient.ignoresSafeArea()) // Apply the background gradient to extend under the nav bar
        .navigationBarTitle(Text(tv.name), displayMode: .inline)
    }
}

// Preview
struct TvDetailView_Preview: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TvDetailView(tv: Tv(name: "tv Model 1", tutorialYouTubeLink: "https://youtu.be/exampleLink1", image: "tp-linkwr840n"))
        }
    }
}
