import SwiftUI
import Combine

/// Sample ViewModel demonstrating MVVM pattern
@MainActor
final class SampleViewModel: ObservableObject {
    
    // MARK: - Published Properties
    @Published var items: [SampleItem] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    // MARK: - Private Properties
    private var cancellables = Set<AnyCancellable>()
    private let dataService: DataServiceProtocol
    
    // MARK: - Initialization
    init(dataService: DataServiceProtocol = MockDataService()) {
        self.dataService = dataService
        fetchItems()
    }
    
    // MARK: - Public Methods
    
    /// Fetch sample items
    func fetchItems() {
        isLoading = true
        errorMessage = nil
        
        dataService.fetchSampleItems()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    self?.isLoading = false
                    if case .failure(let error) = completion {
                        self?.errorMessage = error.localizedDescription
                    }
                },
                receiveValue: { [weak self] items in
                    self?.items = items
                }
            )
            .store(in: &cancellables)
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
}

// MARK: - Data Service Protocol

protocol DataServiceProtocol {
    func fetchSampleItems() -> AnyPublisher<[SampleItem], Error>
}

// MARK: - Mock Data Service

class MockDataService: DataServiceProtocol {
    func fetchSampleItems() -> AnyPublisher<[SampleItem], Error> {
        Future { promise in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                promise(.success(SampleItem.sampleData))
            }
        }
        .eraseToAnyPublisher()
    }
}

// MARK: - Sample Data Model
struct SampleItem: Identifiable, Codable {
    let id: UUID
    let name: String
    let description: String
    let value: Int
    
    init(id: UUID = UUID(), name: String, description: String, value: Int) {
        self.id = id
        self.name = name
        self.description = description
        self.value = value
    }
    
    static let sampleData: [SampleItem] = [
        SampleItem(name: "Sample Item 1", description: "This is the first sample item.", value: 10),
        SampleItem(name: "Sample Item 2", description: "This is the second sample item.", value: 20),
        SampleItem(name: "Sample Item 3", description: "This is the third sample item.", value: 30)
    ]
}