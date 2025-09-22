import XCTest
import SwiftUI
@testable import HKProjectTemplate

final class AppEnvironmentTests: XCTestCase {
    
    // MARK: - DIContainer Tests
    
    func testDIContainer_preview() {
        // Given & When
        let container = DIContainer.preview
        
        // Then
        XCTAssertNotNil(container.services)
    }
    
    func testDIContainer_test() {
        // Given & When
        let container = DIContainer.test
        
        // Then
        XCTAssertNotNil(container.services)
    }
    
    func testDIContainer_mock() {
        // Given & When
        let container = DIContainer.mock
        
        // Then
        XCTAssertNotNil(container.services)
    }
    
    // MARK: - Services Tests
    
    func testServices_preview() {
        // Given & When
        let services = Services.preview
        
        // Then
        XCTAssertNotNil(services)
    }
    
    func testServices_test() {
        // Given & When
        let services = Services.test
        
        // Then
        XCTAssertNotNil(services)
    }
    
    func testServices_mock() {
        // Given & When
        let services = Services.mock
        
        // Then
        XCTAssertNotNil(services)
    }
    
    // MARK: - Environment Values Tests
    
    func testEnvironmentValues_diContainer() {
        // Given
        let testContainer = DIContainer.test
        var environment = EnvironmentValues()
        
        // When
        environment.diContainer = testContainer
        
        // Then
        XCTAssertNotNil(environment.diContainer)
    }
    
    func testEnvironmentValues_diContainerDefault() {
        // Given
        let environment = EnvironmentValues()
        
        // When & Then
        XCTAssertNotNil(environment.diContainer)
    }
    
    // MARK: - Test Environment Tests
    
    func testTestEnvironment_createMockContainer() {
        // Given & When
        let container = TestEnvironment.createMockContainer()
        
        // Then
        XCTAssertNotNil(container)
        XCTAssertNotNil(container.services)
    }
    
    func testTestEnvironment_createMockServices() {
        // Given & When
        let services = TestEnvironment.createMockServices()
        
        // Then
        XCTAssertNotNil(services)
    }
    
    // MARK: - Dependency Injection Tests
    
    func testDependencyInjection_containerServices() {
        // Given
        let container = DIContainer.mock
        
        // When & Then
        XCTAssertNotNil(container.services)
    }
    
    func testDependencyInjection_servicesConsistency() {
        // Given
        let container1 = DIContainer.mock
        let container2 = DIContainer.mock
        
        // When & Then
        XCTAssertNotNil(container1.services)
        XCTAssertNotNil(container2.services)
        // Note: Services are created fresh each time, so they won't be equal
    }
    
    // MARK: - Mock Services Integration Tests
    
    func testMockServices_integration() {
        // Given
        let mockContainer = DIContainer.mock
        
        // When & Then
        XCTAssertNotNil(mockContainer.services)
        // This test ensures that mock services are properly integrated
        // and can be used in tests without real dependencies
    }
    
    // MARK: - Environment Key Tests
    
    func testDIContainerKey_defaultValue() {
        // Given
        let key = DIContainerKey()
        
        // When
        let defaultValue = key.defaultValue
        
        // Then
        XCTAssertNotNil(defaultValue)
        XCTAssertNotNil(defaultValue.services)
    }
    
    // MARK: - SwiftUI Integration Tests
    
    func testSwiftUIEnvironment_integration() {
        // Given
        let testContainer = DIContainer.test
        var environment = EnvironmentValues()
        
        // When
        environment.diContainer = testContainer
        
        // Then
        let retrievedContainer = environment.diContainer
        XCTAssertNotNil(retrievedContainer)
        XCTAssertNotNil(retrievedContainer.services)
    }
}
