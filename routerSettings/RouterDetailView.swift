import SwiftUI

struct RouterDetailView: View {
    var router: Router

    let backgroundGradient = LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)

    var body: some View {
        GeometryReader { geometry in
            ScrollView { // Use ScrollView to accommodate content exceeding the screen size
                VStack {
                    Image(router.image) // Display the local image
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width * 0.9) // Adjust width to 90% of screen width
                    
                    // Place your Link/Button right under the Image
                    if let url = URL(string: router.tutorialYouTubeLink), UIApplication.shared.canOpenURL(url) {
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
                    
                    // Additional content can go here
                }
                .padding() // Add padding around the VStack content
                .background(backgroundGradient) // Apply the gradient to the background
                .frame(width: geometry.size.width) // Ensure VStack takes the full width
                // .frame(maxHeight: .infinity) // Uncomment if you want VStack to take full height
            }
        }
        .edgesIgnoringSafeArea(.all) // Ensures the background extends to the edges of the screen
        .navigationBarTitle(Text(router.name), displayMode: .inline)
    }
}

// Preview
struct RouterDetailView_Preview: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RouterDetailView(router: Router(name: "Router Model 1", tutorialYouTubeLink: "https://youtu.be/exampleLink1", image: "tp-linkwr840n"))
        }
    }
}
