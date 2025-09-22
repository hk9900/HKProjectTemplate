import SwiftUI

/// Sample View demonstrating SwiftUI best practices and template structure
struct SampleView: View {
    
    // MARK: - Properties
    @StateObject private var viewModel = SampleViewModel()
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            content
                .navigationTitle("Sample Feature")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            viewModel.fetchItems()
                        }) {
                            Image(systemName: "arrow.clockwise")
                        }
                    }
                }
        }
    }
    
    // MARK: - Private Computed Properties
    @ViewBuilder
    private var content: some View {
        if viewModel.isLoading {
            ProgressView("Loading Sample Items...")
        } else if let errorMessage = viewModel.errorMessage {
            VStack {
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
                Button("Retry") {
                    viewModel.fetchItems()
                }
            }
        } else if viewModel.items.isEmpty {
            Text("No sample items found.")
                .foregroundColor(.secondary)
        } else {
            List(viewModel.items) { item in
                SampleItemRow(item: item)
            }
        }
    }
    
}

// MARK: - Sample Item Row
struct SampleItemRow: View {
    let item: SampleItem

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(item.name)
                .font(.headline)
            Text(item.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
            Text("Value: \(item.value)")
                .font(.caption)
                .foregroundColor(.tertiary)
        }
        .padding(.vertical, 5)
    }
}

// MARK: - Preview
#Preview {
    SampleView()
}