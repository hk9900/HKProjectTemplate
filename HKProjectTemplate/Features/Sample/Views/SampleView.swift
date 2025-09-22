import SwiftUI

/// Sample View demonstrating SwiftUI best practices and template structure
struct SampleView: View {
    
    // MARK: - Properties
    @StateObject private var viewModel = SampleViewModel()
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                headerView
                
                if viewModel.isLoading {
                    loadingView
                } else {
                    contentView
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle(viewModel.title)
            .navigationBarTitleDisplayMode(.large)
            .onAppear {
                viewModel.loadData()
            }
        }
    }
    
    // MARK: - Subviews
    
    private var headerView: some View {
        VStack(spacing: 8) {
            Text(viewModel.message)
                .font(.headline)
                .foregroundColor(.primary)
            
            Text("This demonstrates the template structure")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .multilineTextAlignment(.center)
    }
    
    private var loadingView: some View {
        VStack(spacing: 16) {
            ProgressView()
                .scaleEffect(1.2)
            
            Text("Loading sample data...")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private var contentView: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Sample Items")
                .font(.title2)
                .fontWeight(.semibold)
            
            if viewModel.items.isEmpty {
                emptyStateView
            } else {
                itemsListView
            }
        }
    }
    
    private var emptyStateView: some View {
        VStack(spacing: 12) {
            Image(systemName: "tray")
                .font(.system(size: 48))
                .foregroundColor(.secondary)
            
            Text("No items available")
                .font(.headline)
                .foregroundColor(.secondary)
            
            Text("Tap the refresh button to load sample data")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 40)
    }
    
    private var itemsListView: some View {
        LazyVStack(spacing: 12) {
            ForEach(viewModel.items) { item in
                SampleItemRow(item: item) {
                    if let index = viewModel.items.firstIndex(where: { $0.id == item.id }) {
                        viewModel.removeItem(at: index)
                    }
                }
            }
        }
    }
}

// MARK: - Sample Item Row
struct SampleItemRow: View {
    let item: SampleItem
    let onDelete: () -> Void
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(item.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(item.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text(item.timestamp, style: .relative)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Button(action: onDelete) {
                Image(systemName: "trash")
                    .foregroundColor(.red)
            }
            .buttonStyle(PlainButtonStyle())
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

// MARK: - Preview
#Preview {
    SampleView()
}