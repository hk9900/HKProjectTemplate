import SwiftUI

/// Main ContentView demonstrating template structure
struct ContentView: View {
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                // App Icon/Logo
                Image(systemName: "app.badge")
                    .font(.system(size: 60))
                    .foregroundStyle(.tint)
                
                // Welcome Message
                VStack(spacing: 8) {
                    Text("Welcome to HKProjectTemplate")
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    
                    Text("A production-ready iOS project template")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                }
                
                // Features Section
                VStack(alignment: .leading, spacing: 16) {
                    Text("Template Features")
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        FeatureRow(icon: "swift", title: "SwiftUI + MVVM", description: "Modern UI with clean architecture")
                        FeatureRow(icon: "flame", title: "Firebase Ready", description: "Authentication, Firestore, Storage")
                        FeatureRow(icon: "testtube.2", title: "Testing Setup", description: "Unit, UI, and integration tests")
                        FeatureRow(icon: "wrench.and.screwdriver", title: "Quality Tools", description: "SwiftLint, SwiftFormat, Periphery")
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                
                // Sample Feature Button (commented out until SampleView is added to Xcode project)
                Button(action: {
                    // TODO: Add SampleView to Xcode project and uncomment NavigationLink
                    print("Sample feature will be available once SampleView is added to Xcode project")
                }) {
                    HStack {
                        Image(systemName: "play.circle.fill")
                        Text("View Sample Feature")
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(12)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Template")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// MARK: - Feature Row
struct FeatureRow: View {
    let icon: String
    let title: String
    let description: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(.blue)
                .frame(width: 24)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.medium)
                
                Text(description)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
    }
}

// MARK: - Preview
#Preview {
    ContentView()
}
