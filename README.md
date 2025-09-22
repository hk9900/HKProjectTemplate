# HKProjectTemplate

A comprehensive iOS project template built with SwiftUI, following modern iOS development best practices.

## Features

- **SwiftUI Interface** - Modern, declarative UI framework
- **iOS 16+ Support** - Latest iOS features and APIs
- **Clean Architecture** - Organized, maintainable code structure
- **Quality Tools** - SwiftLint, SwiftFormat, and Periphery integration
- **Automation Scripts** - Project setup and renaming automation
- **Testing Ready** - Comprehensive unit and UI testing with mock services
- **Deployment Ready** - Fastlane and CI/CD integration

## Quick Start

1. **Clone or Download** this template
2. **Run Setup Script**: `./Scripts/setup.sh`
3. **Open in Xcode**: `HKProjectTemplate.xcodeproj`
4. **Build and Run** your project

## Project Structure

```
HKProjectTemplate/
├── HKProjectTemplate/           # Main app source code
│   ├── App/                    # App entry point and environment
│   ├── Core/                   # Core business logic and services
│   ├── Features/               # Feature modules
│   ├── Components/             # Reusable UI components
│   ├── Constants/              # Centralized constants
│   └── Resources/              # Assets and configuration
├── Tests/                      # Comprehensive testing suite
│   ├── UnitTests/              # Unit tests for business logic
│   ├── UITests/                # UI tests for user flows
│   └── TestUtilities/          # Test helpers and mocks
├── Scripts/                    # Automation scripts
├── fastlane/                   # Deployment automation
├── .github/                    # CI/CD workflows
└── Documentation/              # Project documentation
```

## Requirements

- **Xcode 15.0+**
- **iOS 16.0+** deployment target
- **Swift 5.9+**
- **iPhone only** - No iPad or macOS support

## Testing

The project includes a comprehensive testing suite with:

- **Unit Tests** (`Tests/UnitTests/`) - Test business logic, ViewModels, and services
- **UI Tests** (`Tests/UITests/`) - Test user flows and UI interactions  
- **Test Utilities** (`Tests/TestUtilities/`) - Shared helpers, mocks, and test data

### Running Tests

```bash
# Run all tests
xcodebuild test -project HKProjectTemplate.xcodeproj -scheme HKProjectTemplate

# Run specific test target
xcodebuild test -project HKProjectTemplate.xcodeproj -scheme HKProjectTemplate -only-testing:UnitTests
```

### Test Features

- **Mock Services** - Protocol-based dependency injection for testable code
- **Test Data Factory** - Consistent test data creation
- **Async Testing** - Proper handling of async operations
- **UI Testing** - Accessibility-focused UI test automation

## Getting Started

See [Documentation/Setup.md](Documentation/Setup.md) for detailed setup instructions.

## License

This template is provided as-is for educational and development purposes.
