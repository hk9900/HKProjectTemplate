# HKProjectTemplate Setup Guide

This guide will walk you through setting up your iOS project using the HKProjectTemplate.

## Prerequisites

- **Xcode 15.0+**
- **iOS 16.0+** deployment target
- **Swift 5.9+**
- **Apple Developer Account** (for device testing and App Store)
- **Git** (for version control)

## Step-by-Step Setup

### 1. Download the Template

```bash
# Clone the repository
git clone https://github.com/yourusername/HKProjectTemplate.git MyApp
cd MyApp

# Or download and extract the ZIP file
```

### 2. Open in Xcode

1. Open `HKProjectTemplate.xcodeproj` in Xcode
2. Wait for Xcode to index the project
3. Verify the project builds successfully (Cmd+B)

### 3. Rename the Project

#### 3.1 Rename Project File
1. Select the project in the navigator
2. Press Enter or click on the project name
3. Type your new project name (e.g., "MyApp")
4. Press Enter to confirm

#### 3.2 Update Bundle Identifier
1. Select your target in the project settings
2. Go to "Signing & Capabilities" tab
3. Update the bundle identifier (e.g., "com.yourcompany.myapp")
4. Ensure "Automatically manage signing" is checked

#### 3.3 Rename Source Files
1. Rename `HKProjectTemplateApp.swift` to `{YourAppName}App.swift`
2. Update the struct name inside the file:
   ```swift
   @main
   struct MyApp: App {  // Changed from HKProjectTemplate
       var body: some Scene {
           WindowGroup {
               ContentView()
           }
       }
   }
   ```

### 4. Configure Development Team

1. Go to "Signing & Capabilities"
2. Select your development team from the dropdown
3. Xcode will automatically manage provisioning profiles
4. Verify the bundle identifier is unique and matches your Apple Developer account

### 5. Git Setup

```bash
# Remove existing Git history (if cloned)
rm -rf .git

# Initialize new Git repository
git init

# Add remote origin
git remote add origin https://github.com/yourusername/myapp.git

# Add all files
git add .

# Initial commit
git commit -m "Initial commit from HKProjectTemplate"

# Push to remote
git push -u origin main
```

### 6. Firebase Configuration (Optional)

#### 6.1 Create Firebase Project
1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Create a new project
3. Add an iOS app with your bundle identifier

#### 6.2 Download Configuration
1. Download `GoogleService-Info.plist`
2. Drag it into the `SupportingFiles/` folder in Xcode
3. Make sure it's added to the target

#### 6.3 Add Firebase SDK
1. Go to "File" → "Add Package Dependencies"
2. Add Firebase packages:
   - `FirebaseAuth`
   - `FirebaseFirestore`
   - `FirebaseAnalytics`
   - `FirebaseCrashlytics`

#### 6.4 Configure Firebase
Add to your `AppDelegate.swift` or main app file:
```swift
import Firebase

// In your app initialization
FirebaseApp.configure()
```

### 7. Code Quality Setup

The project includes ultra-strict SwiftLint configuration. To ensure it's working:

1. **Install SwiftLint** (if not already installed):
   ```bash
   brew install swiftlint
   ```

2. **Test SwiftLint**:
   ```bash
   swiftlint --config .swiftlint.yml
   ```

3. **Configure Xcode Build Phase**:
   - The SwiftLint build phase is already configured
   - It will run automatically on each build
   - Fix any violations before committing

### 8. Testing Setup

#### 8.1 Run Tests
```bash
# Run all tests
xcodebuild test -project MyApp.xcodeproj -scheme MyApp

# Run specific test target
xcodebuild test -project MyApp.xcodeproj -scheme MyApp -only-testing:UnitTests
```

#### 8.2 Test Structure
- **Unit Tests**: `Tests/UnitTests/` - Test business logic and ViewModels
- **UI Tests**: `Tests/UITests/` - Test user interface and flows
- **Test Utilities**: `Tests/TestUtilities/` - Mock services and helpers

### 9. Project Structure Overview

```
MyApp/
├── MyApp/                    # Main app source code
│   ├── App/                  # App entry point and environment
│   │   ├── MyAppApp.swift    # Main app file
│   │   └── AppDelegate.swift # App delegate (if needed)
│   ├── Core/                 # Core business logic
│   │   ├── Models/           # Data models
│   │   ├── Services/         # Business services
│   │   ├── Extensions/       # Swift extensions
│   │   └── Firebase/         # Firebase configuration
│   ├── Features/             # Feature modules
│   │   ├── Authentication/   # Auth feature
│   │   ├── Profile/          # User profile
│   │   └── Settings/         # App settings
│   ├── Components/           # Reusable UI components
│   ├── DesignSystem/         # Design system
│   │   ├── Styles/           # Color, typography, spacing
│   │   ├── ViewModifiers/    # Custom view modifiers
│   │   └── Views/            # Base UI components
│   ├── Constants/            # App constants
│   ├── Resources/            # Assets and configuration
│   │   ├── Config/           # Configuration files
│   │   └── Localization/     # String localization
│   └── SupportingFiles/      # Info.plist, Assets, etc.
├── Tests/                    # Test suite
│   ├── UnitTests/            # Unit tests
│   ├── UITests/              # UI tests
│   └── TestUtilities/        # Test helpers
└── Documentation/            # Project documentation
```

### 10. Development Workflow

#### 10.1 Code Quality
- Follow the ultra-strict SwiftLint rules
- Use explicit access control for all declarations
- Keep functions under 10 lines
- Keep types under 100 lines
- Use proper SwiftUI patterns

#### 10.2 Testing
- Write unit tests for all business logic
- Write UI tests for critical user flows
- Use mock services for testing
- Maintain high test coverage

#### 10.3 Git Workflow
```bash
# Create feature branch
git checkout -b feature/new-feature

# Make changes and commit
git add .
git commit -m "feat: add new feature"

# Push and create PR
git push origin feature/new-feature
```

### 11. Troubleshooting

#### 11.1 Build Issues
- Clean build folder (Cmd+Shift+K)
- Reset package caches (File → Packages → Reset Package Caches)
- Check bundle identifier uniqueness

#### 11.2 SwiftLint Issues
- Fix violations one by one
- Use `swiftlint --fix` for auto-fixable issues
- Check the `.swiftlint.yml` configuration

#### 11.3 Testing Issues
- Ensure test targets are properly configured
- Check that test files are added to the correct targets
- Verify mock services are properly set up

### 12. Next Steps

1. **Start Development**: Begin implementing your app features
2. **Add Dependencies**: Add any additional Swift packages you need
3. **Configure CI/CD**: Set up GitHub Actions for automated testing
4. **Deploy**: Use Fastlane for automated deployment (when ready)

## Support

If you encounter any issues:
1. Check this documentation first
2. Review the SwiftLint configuration
3. Ensure all prerequisites are met
4. Check the project structure matches the template

## License

This template is provided as-is for educational and development purposes.
