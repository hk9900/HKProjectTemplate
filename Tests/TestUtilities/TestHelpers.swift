import XCTest

// MARK: - XCTestCase Extensions

extension XCTestCase {
    /// Waits for a given number of seconds for an expectation to be fulfilled.
    func waitForExpectation(timeout: TimeInterval = 1.0) {
        let expectation = XCTestExpectation(description: "Waiting for expectation")
        DispatchQueue.main.asyncAfter(deadline: .now() + timeout - 0.1) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeout)
    }

    /// A more robust way to wait for a condition to be true.
    func waitFor(
        _ condition: @autoclosure () -> Bool,
        timeout: TimeInterval = 1.0,
        message: String = "Condition not met within timeout",
        file: StaticString = #file,
        line: UInt = #line
    ) {
        let expectation = XCTestExpectation(description: message)
        let pollInterval: TimeInterval = 0.01 // Check every 10ms
        var timeElapsed: TimeInterval = 0

        let timer = Timer.scheduledTimer(withTimeInterval: pollInterval, repeats: true) { timer in
            if condition() {
                expectation.fulfill()
                timer.invalidate()
            } else {
                timeElapsed += pollInterval
                if timeElapsed >= timeout {
                    timer.invalidate()
                }
            }
        }
        RunLoop.current.add(timer, forMode: .common)
        wait(for: [expectation], timeout: timeout)
    }
}

// MARK: - Test Data Factory

struct TestDataFactory {
    /// Creates a sample user for testing
    static func createSampleUser() -> User {
        return User(
            id: "test-user-id",
            email: "test@example.com",
            displayName: "Test User",
            createdAt: Date(),
            lastLoginAt: Date()
        )
    }
    
    /// Creates sample items for testing
    static func createSampleItems(count: Int = 3) -> [SampleItem] {
        return (0..<count).map { index in
            SampleItem(
                id: UUID(),
                name: "Sample Item \(index + 1)",
                description: "This is sample item number \(index + 1)",
                value: (index + 1) * 10
            )
        }
    }
}

// MARK: - Mock Protocols

protocol Mockable {
    associatedtype MockType
    static func mock() -> MockType
}

// MARK: - Test Assertions

extension XCTestCase {
    /// Asserts that a string is not empty
    func assertNotEmpty(_ string: String?, message: String = "String should not be empty", file: StaticString = #file, line: UInt = #line) {
        XCTAssertNotNil(string, message, file: file, line: line)
        XCTAssertFalse(string?.isEmpty ?? true, message, file: file, line: line)
    }
    
    /// Asserts that a collection is not empty
    func assertNotEmpty<T: Collection>(_ collection: T?, message: String = "Collection should not be empty", file: StaticString = #file, line: UInt = #line) {
        XCTAssertNotNil(collection, message, file: file, line: line)
        XCTAssertFalse(collection?.isEmpty ?? true, message, file: file, line: line)
    }
}
