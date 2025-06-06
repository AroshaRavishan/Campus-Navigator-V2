import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var rememberMe = false
    @State private var isSecure = true
    @State private var isActive = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Top Blue Wave Background
                ZStack(alignment: .bottomLeading) {
                    Image("splashPattern") // Add your Figma wave to Assets
                        .resizable()
                        .scaledToFill()
                        .frame(height: 280)
                        .ignoresSafeArea()

                    Text("Sign in")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.leading, 30)
                        .padding(.bottom, 30)
                }

                VStack(alignment: .leading, spacing: 20) {
                    // Email Field
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Email")
                            .font(.caption)
                            .foregroundColor(.gray)
                        HStack {
                            Image(systemName: "envelope")
                                .foregroundColor(.gray)
                            TextField("demo@email.com", text: $email)
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                        }
                        .padding(.vertical, 8)
                        .overlay(Rectangle().frame(height: 1).foregroundColor(.gray), alignment: .bottom)
                    }

                    // Password Field
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Password")
                            .font(.caption)
                            .foregroundColor(.gray)
                        HStack {
                            Image(systemName: "lock")
                                .foregroundColor(.gray)
                            if isSecure {
                                SecureField("Enter your password", text: $password)
                            } else {
                                TextField("Enter your password", text: $password)
                            }
                            Button(action: {
                                isSecure.toggle()
                            }) {
                                Image(systemName: isSecure ? "eye.slash" : "eye")
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.vertical, 8)
                        .overlay(Rectangle().frame(height: 1).foregroundColor(.gray), alignment: .bottom)
                    }

                    // Remember Me and Forgot Password
                    HStack {
                        Toggle(isOn: $rememberMe) {
                            Text("Remember Me")
                                .font(.footnote)
                        }
                        .toggleStyle(CheckboxToggleStyle())

                        Spacer()

                        Button("Forgot Password?") {
                            // Action
                        }
                        .font(.footnote)
                        .foregroundColor(.blue)
                    }

                    // Login Button
                    Button(action: {
                        isActive = true
                    }) {
                        Text("Login")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(red: 5/255, green: 33/255, blue: 75/255)) // Exact dark blue
                            .cornerRadius(10)
                    }
                    .padding(.top, 10)

                    // Bottom Sign Up
                    HStack {
                        Spacer()
                        Text("Don’t have an Account ?")
                            .font(.footnote)
                            .foregroundColor(.gray)
                        Button("Sign up") {
                            // Navigate
                        }
                        .font(.footnote)
                        .foregroundColor(.blue)
                    }
                    .padding(.top, 4)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(25)
                .padding(.horizontal, 16)
                .shadow(color: .gray.opacity(0.2), radius: 6, x: 0, y: 4)

                Spacer()
            }
            .ignoresSafeArea()
            .navigationDestination(isPresented: $isActive) {
                HomeView().navigationBarBackButtonHidden(true)
            }
        }
    }
}

// Checkbox Toggle Style
struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: { configuration.isOn.toggle() }) {
            HStack(spacing: 8) {
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                    .foregroundColor(configuration.isOn ? .blue : .gray)
                configuration.label
            }
        }
        .buttonStyle(.plain)
    }
}
