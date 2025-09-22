# Quick Start Guide

## 🚀 Get Started in 5 Minutes

### 1. Open Project
```bash
open HKProjectTemplate.xcodeproj
```

### 2. Rename Project
- Select project in navigator → Press Enter → Type new name
- Update bundle identifier in "Signing & Capabilities"

### 3. Rename Main File
- Rename `HKProjectTemplateApp.swift` to `{YourApp}App.swift`
- Update struct name inside the file

### 4. Build & Run
```bash
# Build
Cmd + B

# Run
Cmd + R
```

## 📁 Key Files to Update

| File | Action |
|------|--------|
| `HKProjectTemplateApp.swift` | Rename file and struct |
| Bundle Identifier | Update in project settings |
| `Info.plist` | Update display name |
| `README.md` | Update project references |

## 🔧 Essential Configuration

### Bundle Identifier
```
com.yourcompany.yourapp
```

### Development Team
- Go to "Signing & Capabilities"
- Select your team
- Enable "Automatically manage signing"

### Git Setup
```bash
git init
git remote add origin https://github.com/yourusername/yourapp.git
git add .
git commit -m "Initial commit"
```

## 🧪 Testing

```bash
# Run all tests
xcodebuild test -project YourApp.xcodeproj -scheme YourApp

# Run specific tests
xcodebuild test -project YourApp.xcodeproj -scheme YourApp -only-testing:UnitTests
```

## 🔥 Firebase (Optional)

1. Download `GoogleService-Info.plist` from Firebase Console
2. Drag into `SupportingFiles/` folder
3. Add Firebase SDK via Swift Package Manager
4. Configure in app initialization

## 📋 Checklist

- [ ] Project renamed
- [ ] Bundle identifier updated
- [ ] Development team selected
- [ ] Main app file renamed
- [ ] Project builds successfully
- [ ] Tests pass
- [ ] Git repository initialized
- [ ] Firebase configured (if needed)

## 🆘 Common Issues

### Build Fails
- Clean build folder (Cmd+Shift+K)
- Check bundle identifier is unique
- Verify development team is selected

### SwiftLint Errors
- Fix violations one by one
- Use `swiftlint --fix` for auto-fixable issues
- Check line length (80 chars max)

### Tests Don't Run
- Ensure test targets are added to scheme
- Check that test files are in correct targets
- Verify mock services are properly configured

## 📚 Full Documentation

For detailed setup instructions, see [Setup.md](Setup.md).

For project structure details, see [Architecture.md](Architecture.md).
