# Testing Guidelines for HKProjectTemplate

This directory contains all the tests for the `HKProjectTemplate`. A robust testing strategy is crucial for maintaining code quality, preventing regressions, and ensuring the application behaves as expected.

## Directory Structure

```
Tests/
├── UnitTests/
│   ├── SampleViewModelTests.swift
│   ├── AppEnvironmentTests.swift
│   └── UnitTests.swift (default Xcode template)
├── UITests/
│   ├── SampleViewUITests.swift
│   ├── UITests.swift (default Xcode template)
│   └── UITestsLaunchTests.swift (default Xcode template)
├── TestUtilities/
│   ├── TestHelpers.swift
│   └── MockServices.swift
└── README.md
```

## Types of Tests

### 1. Unit Tests (`Tests/UnitTests/`)
- **Purpose**: To test individual units of code (functions, methods, classes, structs) in isolation. This includes business logic, view models, services, and utility functions.
- **Framework**: `XCTest`
- **Best Practices**:
  - **Single Responsibility**: Each test case should focus on testing one specific piece of functionality.
  - **Arrange-Act-Assert (AAA)**: Organize your tests into these three phases.
  - **Mocking/Stubbing**: Use mock objects or stubs for dependencies to isolate the unit under test.
  - **Fast Execution**: Unit tests should run quickly. Avoid network requests, database access, or UI interactions.
  - **Naming**: Test methods should be descriptive, e.g., `test_viewModel_fetchItems_success()` or `test_authenticationService_login_invalidCredentials_returnsError()`.

### 2. UI Tests (`Tests/UITests/`)
- **Purpose**: To test the user interface and user flows, ensuring that the UI behaves correctly and that users can interact with the app as intended.
- **Framework**: `XCTest` with `XCUIApplication` and `XCUIElement`.
- **Best Practices**:
  - **User Flows**: Focus on critical user journeys (e.g., login, registration, completing a task).
  - **Accessibility Identifiers**: Use `accessibilityIdentifier` for UI elements to make tests robust and less prone to breaking with UI changes.
  - **Assertions**: Assert on the existence, state, and values of UI elements.
  - **Launch Arguments**: Use launch arguments to configure the app for testing (e.g., `app.launchArguments = ["-UITesting"]`).
  - **Screenshots**: Capture screenshots on failure for easier debugging.

### 3. Test Utilities (`Tests/TestUtilities/`)
- **Purpose**: To house reusable code that aids in writing tests, such as custom XCTestCase extensions, mock objects, test data factories, and helper functions.
- **Contents**:
  - `TestHelpers.swift`: Extensions for `XCTestCase` (e.g., `waitForExpectation`), custom matchers, or common assertion helpers.
  - `MockServices.swift`: Mock implementations of services (e.g., `AuthService`, `DataService`) that conform to the same protocols as your real services, allowing you to control their behavior during tests.

## How to Run Tests

1. **In Xcode**:
   - Open `HKProjectTemplate.xcodeproj`.
   - Select the **Product** menu -> **Test** (or press `Cmd + U`).
   - To run specific tests, open the Test Navigator (Cmd + 6), select the desired tests, and click the "Play" button.

2. **From Command Line**:
   ```bash
   # Run all tests
   xcodebuild test -project HKProjectTemplate.xcodeproj -scheme HKProjectTemplate -destination 'platform=iOS Simulator,name=iPhone 16'
   
   # Run only unit tests
   xcodebuild test -project HKProjectTemplate.xcodeproj -scheme HKProjectTemplate -only-testing:UnitTests
   
   # Run only UI tests
   xcodebuild test -project HKProjectTemplate.xcodeproj -scheme HKProjectTemplate -only-testing:UITests
   ```
   (Replace `iPhone 16` with an available simulator if needed).

## Current Test Implementation

The template includes a working test setup with:

- **SampleViewModelTests** - Tests for the sample feature ViewModel
- **AppEnvironmentTests** - Tests for dependency injection and environment setup
- **SampleViewUITests** - UI tests for the sample feature
- **TestHelpers** - XCTestCase extensions and utility functions
- **MockServices** - Mock implementations of services for testing

All tests are properly configured and can be run immediately after opening the project in Xcode.

## Integrating with CI/CD

- Ensure your CI/CD pipeline includes a step to run `xcodebuild test` to automatically validate changes.
- Consider generating test reports in a format compatible with your CI system (e.g., JUnit XML).

## Best Practices for Testable Code

- **Dependency Injection**: Design your code to use dependency injection (e.g., initializer injection) to easily swap real services with mock services during testing.
- **Protocols**: Define protocols for your services and dependencies. This makes it easy to create mock implementations.
- **Pure Functions**: Favor pure functions (functions that produce the same output for the same input and have no side effects) as they are easier to test.
- **Avoid Singletons**: Limit the use of singletons, or ensure they have a testable interface.

## Test Naming Conventions

- **Test Methods**: Use descriptive names that explain what is being tested and the expected outcome.
  - Format: `test_[methodName]_[scenario]_[expectedResult]`
  - Examples:
    - `test_fetchItems_success_returnsItems()`
    - `test_login_invalidCredentials_returnsError()`
    - `test_viewModel_initialState_isCorrect()`

## Mock Services

The project includes mock implementations of key services:

- **MockAuthService**: Simulates authentication operations
- **MockDataService**: Simulates data fetching operations
- **TestDataFactory**: Creates consistent test data

## Test Data Management

- Use `TestDataFactory` to create consistent test data
- Avoid hardcoded test data in individual tests
- Use meaningful test data that reflects real-world scenarios

## Async Testing

- Use `XCTestExpectation` for testing async operations
- Use the `waitFor` helper method for more robust async testing
- Test both success and failure scenarios for async operations

## UI Testing Best Practices

- Use accessibility identifiers for reliable element selection
- Test both happy path and error scenarios
- Include accessibility testing to ensure the app is usable by all users
- Test on different device sizes and orientations when applicable

## Performance Testing

- Use `XCTMeasure` for performance testing
- Test app launch time, memory usage, and critical path performance
- Set appropriate iteration counts for reliable results

## Test Coverage

- Aim for high test coverage on business logic and critical paths
- Focus on testing behavior, not implementation details
- Use code coverage tools to identify untested areas

## Debugging Tests

- Use breakpoints in test methods for debugging
- Add logging statements to understand test execution flow
- Use Xcode's test result navigator to analyze test failures
- Take screenshots during UI test failures for visual debugging

By following these guidelines, we can ensure a high-quality, maintainable, and robust `HKProjectTemplate`.
