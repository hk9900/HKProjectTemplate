import SwiftUI
import Foundation
import Combine

// MARK: - Data Models

struct User: Identifiable, Codable, Equatable {
    let id: String
    let email: String
    let displayName: String
    let createdAt: Date
    let lastLoginAt: Date?
}

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

// MARK: - Service Protocols

protocol AuthServiceProtocol: ObservableObject {
    var isAuthenticated: Bool { get }
    var currentUser: User? { get }
    func login(email: String, password: String) -> AnyPublisher<Bool, Error>
    func logout()
}

protocol DataServiceProtocol {
    func fetchSampleItems() -> AnyPublisher<[SampleItem], Error>
    func addSampleItem(_ item: SampleItem) -> AnyPublisher<SampleItem, Error>
}

// MARK: - AppEnvironment

struct AppEnvironment {
    let container: DIContainer
}

// MARK: - DIContainer

struct DIContainer {
    let services: Services
    // Add other dependencies like repositories, use cases here
}

// MARK: - Services

struct Services {
    let authService: any AuthServiceProtocol
    let dataService: any DataServiceProtocol
    // Add other services here
}

// MARK: - EnvironmentKey for DIContainer

private struct DIContainerKey: EnvironmentKey {
    static let defaultValue: DIContainer = .preview
}

extension EnvironmentValues {
    var diContainer: DIContainer {
        get { self[DIContainerKey.self] }
        set { self[DIContainerKey.self] = newValue }
    }
}

// MARK: - Preview / Test Mocks

extension DIContainer {
    static var preview: DIContainer {
        .init(services: .preview)
    }

    static var test: DIContainer {
        .init(services: .test)
    }
}

extension Services {
    static var preview: Services {
        .init(
            authService: MockAuthService(),
            dataService: MockDataService()
        )
    }

    static var test: Services {
        .init(
            authService: MockAuthService(),
            dataService: MockDataService()
        )
    }
}

// MARK: - Mock Implementations

class MockAuthService: AuthServiceProtocol {
    @Published var isAuthenticated: Bool = false
    @Published var currentUser: User?
    
    func login(email: String, password: String) -> AnyPublisher<Bool, Error> {
        Future { [weak self] promise in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                if email == "test@example.com" && password == "password" {
                    self?.isAuthenticated = true
                    self?.currentUser = User(
                        id: "test-user-id",
                        email: email,
                        displayName: "Test User",
                        createdAt: Date(),
                        lastLoginAt: Date()
                    )
                    promise(.success(true))
                } else {
                    promise(.failure(AuthError.invalidCredentials))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    func logout() {
        isAuthenticated = false
        currentUser = nil
    }
    
    enum AuthError: Error, LocalizedError {
        case invalidCredentials
        
        var errorDescription: String? {
            return "Invalid email or password"
        }
    }
}

class MockDataService: DataServiceProtocol {
    func fetchSampleItems() -> AnyPublisher<[SampleItem], Error> {
        Future { promise in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                promise(.success(SampleItem.sampleData))
            }
        }
        .eraseToAnyPublisher()
    }
    
    func addSampleItem(_ item: SampleItem) -> AnyPublisher<SampleItem, Error> {
        Future { promise in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                promise(.success(item))
            }
        }
        .eraseToAnyPublisher()
    }
}
