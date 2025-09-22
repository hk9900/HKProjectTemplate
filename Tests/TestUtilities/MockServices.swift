import Foundation
import Combine
@testable import HKProjectTemplate

// MARK: - Mock Auth Service

class MockAuthService: ObservableObject {
    @Published var isAuthenticated: Bool = false
    @Published var currentUser: User?
    
    private var shouldSucceed: Bool = true
    private var delay: TimeInterval = 0.1
    
    init(shouldSucceed: Bool = true, delay: TimeInterval = 0.1) {
        self.shouldSucceed = shouldSucceed
        self.delay = delay
    }
    
    func login(email: String, password: String) -> AnyPublisher<Bool, Error> {
        Future { [weak self] promise in
            DispatchQueue.main.asyncAfter(deadline: .now() + (self?.delay ?? 0.1)) {
                guard let self = self else { return }
                
                if self.shouldSucceed && email == "test@example.com" && password == "password" {
                    self.isAuthenticated = true
                    self.currentUser = TestDataFactory.createSampleUser()
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
        case networkError
        
        var errorDescription: String? {
            switch self {
            case .invalidCredentials:
                return "Invalid email or password"
            case .networkError:
                return "Network connection failed"
            }
        }
    }
}

// MARK: - Mock Data Service

class MockDataService {
    private var shouldSucceed: Bool = true
    private var delay: TimeInterval = 0.1
    private var mockData: [SampleItem] = []
    
    init(shouldSucceed: Bool = true, delay: TimeInterval = 0.1, mockData: [SampleItem]? = nil) {
        self.shouldSucceed = shouldSucceed
        self.delay = delay
        self.mockData = mockData ?? TestDataFactory.createSampleItems()
    }
    
    func fetchSampleItems() -> AnyPublisher<[SampleItem], Error> {
        Future { [weak self] promise in
            DispatchQueue.main.asyncAfter(deadline: .now() + (self?.delay ?? 0.1)) {
                guard let self = self else { return }
                
                if self.shouldSucceed {
                    promise(.success(self.mockData))
                } else {
                    promise(.failure(DataError.networkError))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    func addSampleItem(_ item: SampleItem) -> AnyPublisher<SampleItem, Error> {
        Future { [weak self] promise in
            DispatchQueue.main.asyncAfter(deadline: .now() + (self?.delay ?? 0.1)) {
                guard let self = self else { return }
                
                if self.shouldSucceed {
                    self.mockData.append(item)
                    promise(.success(item))
                } else {
                    promise(.failure(DataError.networkError))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    enum DataError: Error, LocalizedError {
        case networkError
        case invalidData
        
        var errorDescription: String? {
            switch self {
            case .networkError:
                return "Network connection failed"
            case .invalidData:
                return "Invalid data received"
            }
        }
    }
}

// MARK: - Mock DIContainer

extension DIContainer {
    static var mock: DIContainer {
        return DIContainer(services: .mock)
    }
}

extension Services {
    static var mock: Services {
        return Services(
            authService: MockAuthService(),
            dataService: MockDataService()
        )
    }
}

// MARK: - Mock User Model

struct User: Identifiable, Codable, Equatable {
    let id: String
    let email: String
    let displayName: String
    let createdAt: Date
    let lastLoginAt: Date?
}

// MARK: - Test Environment

struct TestEnvironment {
    static func createMockContainer() -> DIContainer {
        return DIContainer.mock
    }
    
    static func createMockServices() -> Services {
        return Services.mock
    }
}
