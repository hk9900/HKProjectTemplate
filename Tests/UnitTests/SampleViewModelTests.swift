import XCTest
import Combine
@testable import HKProjectTemplate

final class SampleViewModelTests: XCTestCase {
    
    var viewModel: SampleViewModel!
    var mockDataService: MockDataService!
    var cancellables: Set<AnyCancellable>!
    
    override func setUpWithError() throws {
        mockDataService = MockDataService(shouldSucceed: true, delay: 0.1)
        viewModel = SampleViewModel(dataService: mockDataService)
        cancellables = Set<AnyCancellable>()
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
        mockDataService = nil
        cancellables = nil
    }
    
    // MARK: - Initialization Tests
    
    func testInit_initialState() {
        // Given & When
        let viewModel = SampleViewModel(dataService: mockDataService)
        
        // Then
        XCTAssertTrue(viewModel.items.isEmpty)
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertNil(viewModel.errorMessage)
    }
    
    // MARK: - Fetch Items Tests
    
    func testFetchItems_success() async throws {
        // Given
        let expectation = XCTestExpectation(description: "Fetch items completes")
        let expectedItems = TestDataFactory.createSampleItems()
        
        // When
        viewModel.fetchItems()
        
        // Then
        waitFor({ !self.viewModel.isLoading }, timeout: 2.0)
        
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertNil(viewModel.errorMessage)
        assertNotEmpty(viewModel.items)
        XCTAssertEqual(viewModel.items.count, expectedItems.count)
        
        expectation.fulfill()
        await fulfillment(of: [expectation], timeout: 1.0)
    }
    
    func testFetchItems_loadingState() {
        // Given
        let expectation = XCTestExpectation(description: "Loading state changes")
        
        // When
        viewModel.fetchItems()
        
        // Then
        XCTAssertTrue(viewModel.isLoading)
        XCTAssertNil(viewModel.errorMessage)
        
        expectation.fulfill()
    }
    
    func testFetchItems_failure() async throws {
        // Given
        let failingDataService = MockDataService(shouldSucceed: false, delay: 0.1)
        let failingViewModel = SampleViewModel(dataService: failingDataService)
        let expectation = XCTestExpectation(description: "Fetch items fails")
        
        // When
        failingViewModel.fetchItems()
        
        // Then
        waitFor({ !failingViewModel.isLoading }, timeout: 2.0)
        
        XCTAssertFalse(failingViewModel.isLoading)
        XCTAssertNotNil(failingViewModel.errorMessage)
        XCTAssertTrue(failingViewModel.items.isEmpty)
        
        expectation.fulfill()
        await fulfillment(of: [expectation], timeout: 1.0)
    }
    
    // MARK: - Error Handling Tests
    
    func testErrorHandling_networkError() {
        // Given
        let expectation = XCTestExpectation(description: "Error handling")
        
        // When
        viewModel.fetchItems()
        
        // Wait for completion
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            // Then
            XCTAssertFalse(self.viewModel.isLoading)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    // MARK: - State Management Tests
    
    func testStateManagement_loadingToLoaded() {
        // Given
        let expectation = XCTestExpectation(description: "State transitions")
        
        // When
        viewModel.fetchItems()
        
        // Then - Initial loading state
        XCTAssertTrue(viewModel.isLoading)
        
        // Wait for completion
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            // Then - Final loaded state
            XCTAssertFalse(self.viewModel.isLoading)
            XCTAssertNil(self.viewModel.errorMessage)
            assertNotEmpty(self.viewModel.items)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    // MARK: - Data Validation Tests
    
    func testDataValidation_sampleItems() {
        // Given
        let expectation = XCTestExpectation(description: "Data validation")
        
        // When
        viewModel.fetchItems()
        
        // Wait for completion
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            // Then
            for item in self.viewModel.items {
                XCTAssertFalse(item.name.isEmpty)
                XCTAssertFalse(item.description.isEmpty)
                XCTAssertGreaterThan(item.value, 0)
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
}
