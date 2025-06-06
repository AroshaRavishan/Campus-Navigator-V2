import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false

    var body: some View {
        VStack(spacing: 0) {
            // Top Pattern Graphic
            Image("splashPattern") // Add your Figma wave graphic here
                .resizable()
                .scaledToFit()
                .frame(height: 280)
                .clipped()

            Spacer()
            
            VStack(alignment: .leading, spacing: 12) {
                // Title with underline
                Text("Campus Navigator")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.blue)
                    .overlay(
                        Rectangle()
                            .frame(height: 2)
                            .offset(y: 6),
                        alignment: .bottom
                    )

                Text("Welcome")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)

                Text("Lorem ipsum dolor sit amet consectetur.\nLorem id sit “Find Exact Location of your choice”")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .lineLimit(2)

                HStack {
                    Spacer()
                    Button(action: {
                        isActive = true
                    }) {
                        HStack(spacing: 5) {
                            Text("Continue")
                            Image(systemName: "arrow.right")
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(25)
                    }
                }
                .padding(.top, 10)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(30)
            .shadow(radius: 5)
        }
        .ignoresSafeArea()
        .fullScreenCover(isPresented: $isActive) {
            LoginView()
        }
    }
}
