import SwiftUI
import Combine

/// Sample ViewModel demonstrating MVVM pattern
@MainActor
final class SampleViewModel: ObservableObject {
    
    // MARK: - Published Properties
    @Published var title: String = "Sample Feature"
    @Published var message: String = "Welcome to the sample feature!"
    @Published var isLoading: Bool = false
    @Published var items: [SampleItem] = []
    
    // MARK: - Private Properties
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Initialization
    init() {
        setupInitialData()
    }
    
    // MARK: - Public Methods
    
    /// Load sample data
    func loadData() {
        isLoading = true
        
        // Simulate network call
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            self?.items = SampleItem.sampleData
            self?.isLoading = false
        }
    }
    
    /// Add new item
    func addItem(_ item: SampleItem) {
        items.append(item)
    }
    
    /// Remove item at index
    func removeItem(at index: Int) {
        guard index < items.count else { return }
        items.remove(at: index)
    }
    
    // MARK: - Private Methods
    
    private func setupInitialData() {
        // Initialize with empty data
        items = []
    }
}

// MARK: - Sample Data Model
struct SampleItem: Identifiable, Codable {
    let id = UUID()
    let title: String
    let description: String
    let timestamp: Date
    
    static let sampleData: [SampleItem] = [
        SampleItem(title: "First Item", description: "This is the first sample item", timestamp: Date()),
        SampleItem(title: "Second Item", description: "This is the second sample item", timestamp: Date()),
        SampleItem(title: "Third Item", description: "This is the third sample item", timestamp: Date())
    ]
}