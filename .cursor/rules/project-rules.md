---
description: HKProjectTemplate iOS Project Rules
globs:
  - "**/*.swift"
  - "**/*.plist"
  - "**/*.xcconfig"
  - "**/*.entitlements"
  - "**/firestore.rules"
  - "**/*.sh"
  - "**/*.strings"
  - "**/*.xcdatamodeld"
  - "**/*.xcassets"
alwaysApply: true
---

# HKProjectTemplate iOS Project Rules

## Scope and Precedence

Applies to this repository; overrides global User Rules where different.
If any rule conflicts with existing code, follow the existing convention and raise a note.
Keep output compilable and changes minimal; list all changed files.

## Tech Stack

- iOS app (iOS 16+)
- Swift 5.x with modern concurrency (async/await, actors)
- SwiftUI UI; MVVM + use cases + services
- Firebase backend via SPM (Auth, Firestore, FirestoreSwift, Storage; optional Analytics/Crashlytics)
- No CocoaPods; SPM only
- **SwiftLint**: Ultra-strict configuration with comprehensive code quality enforcement

## SwiftLint Code Quality Standards

### Ultra-Strict Configuration
This project uses an ultra-strict SwiftLint configuration that enforces the highest code quality standards. All violations are treated as errors and must be fixed before code can be committed.

### Complete SwiftLint Rules Reference

#### **Core Length & Complexity Rules**
- **line_length**: Maximum 60 characters (warning), 80 characters (error)
- **function_body_length**: Maximum 5 lines (warning), 10 lines (error)
- **type_body_length**: Maximum 50 lines (warning), 100 lines (error)
- **file_length**: Maximum 150 lines (warning), 300 lines (error)
- **cyclomatic_complexity**: Maximum 3 (warning), 5 (error)
- **closure_body_length**: Maximum 5 lines (warning), 10 lines (error)
- **function_parameter_count**: Maximum 1 parameter (warning), 2 parameters (error)

#### **Naming Conventions**
- **type_name**: 5-25 characters, descriptive and clear
- **identifier_name**: 4-25 characters, descriptive and meaningful (excludes: id, url, api, ui)
- **protocol_naming**: Must end with 'Protocol' or 'Type'
- **enum_case_naming**: Must be camelCase

#### **Access Control & Class Design**
- **explicit_access_control**: ALL declarations must have explicit access control
- **final_classes**: All classes must be marked `final` unless designed for inheritance
- **extension_access_modifier**: Extensions must have explicit access control
- **lower_acl_than_parent**: Access control must not be lower than parent

#### **SwiftUI Specific Rules**
- **swiftui_stateobject_over_observed**: Use `@StateObject` for owned objects, `@ObservedObject` for external ones
- **swiftui_mainactor_viewmodels**: All ViewModels must be marked with `@MainActor`
- **swiftui_view_structure**: Proper SwiftUI View structure with body property
- **swiftui_viewbuilder**: Complex computed properties returning `some View` must use `@ViewBuilder`
- **swiftui_modifier_order**: SwiftUI modifiers must be in logical order (layout → appearance → behavior)
- **swiftui_accessibility**: All interactive elements must have accessibility identifiers
- **swiftui_navigation**: NavigationLink must be properly configured with navigation modifiers
- **swiftui_preview**: Use `#Preview` instead of `#PreviewProvider`
- **swiftui_state_management**: `@State` variables must be private
- **swiftui_environment**: `@Environment` variables must be private
- **swiftui_animation**: Use explicit animation curves instead of default
- **swiftui_performance**: ForEach must have explicit `id` parameter for performance
- **swiftui_error_handling**: Use proper error handling with alert modifiers
- **swiftui_view_naming**: SwiftUI Views must end with 'View'
- **swiftui_viewmodel_naming**: SwiftUI ViewModels must end with 'ViewModel'

#### **Code Organization & Documentation**
- **mark_comments_required**: Use `// MARK: -` to organize code sections
- **public_api_documentation**: All public APIs must be documented with `///` comments
- **file_header**: Files must have proper header structure
- **single_responsibility**: Classes should have single responsibility

#### **Error Handling & Safety**
- **force_unwrapping**: Avoid `!` operator (severity: error)
- **force_try**: Avoid `try!` operator (severity: error)
- **force_cast**: Avoid `as!` operator (severity: error)
- **implicit_return**: Prefer implicit returns in closures, functions and getters (severity: error)
- **fatal_error_message**: Fatal errors must have descriptive messages

#### **Whitespace & Formatting**
- **trailing_whitespace**: Lines should not have trailing whitespace (severity: error)
- **vertical_whitespace**: Limit vertical whitespace to maximum 0 empty lines (severity: error)
- **vertical_whitespace_closing_braces**: No vertical whitespace before closing braces
- **vertical_whitespace_opening_braces**: No vertical whitespace after opening braces
- **closure_spacing**: Proper spacing in closures (severity: error)
- **closure_end_indentation**: Proper indentation for closure endings (severity: error)

#### **String & Collection Handling**
- **empty_count**: Avoid empty count checks (severity: error)
- **empty_string**: Avoid empty string checks (severity: error)
- **empty_collection_literal**: Use `[]` instead of `Array()` (severity: error)
- **contains_over_filter_count**: Use `contains` instead of `filter.count > 0`
- **contains_over_filter_is_empty**: Use `contains` instead of `filter.isEmpty`
- **contains_over_first_not_nil**: Use `contains` instead of `first != nil`
- **contains_over_range_nil_comparison**: Use `contains` instead of range nil comparison

#### **Function & Method Design**
- **explicit_return_types**: Use explicit return types instead of `Void`
- **guard_over_if_let**: Use `guard let` instead of `if let` for early returns
- **function_default_parameter_at_end**: Locate parameters with defaults toward the end
- **joined_default_parameter**: Use `joined(separator:)` instead of `joined()`
- **redundant_type_annotation**: Remove redundant type annotations
- **explicit_init**: Use explicit `init()` calls

#### **Control Flow & Logic**
- **fallthrough**: Avoid fallthrough in switch statements
- **switch_case_on_newline**: Switch cases must be on new lines
- **switch_case_alignment**: Switch cases must be properly aligned (severity: error)
- **toggle_bool**: Use `toggle()` instead of `bool = !bool` (severity: error)
- **yoda_condition**: Avoid Yoda conditions (constant == variable)

#### **Memory Management & Performance**
- **weak_delegate**: Use weak references for delegates (severity: error)
- **strong_iboutlet**: Use strong references for IBOutlets
- **explicit_self**: Use explicit `self` for method calls
- **explicit_self_in_closure**: Use explicit `self` in closures for clarity
- **static_operator**: Use static methods for operators
- **prefer_self_type_over_type_of_self**: Use `Self` instead of `type(of: self)`

#### **Import & Dependencies**
- **sorted_imports**: Imports must be sorted alphabetically (severity: error)
- **unused_import**: Remove unused imports (severity: error)
- **unused_declaration**: Remove unused declarations (severity: error)

#### **Testing & Quality Assurance**
- **xct_specific_matcher**: Use XCTest specific matchers (severity: error)
- **quick_discouraged_call**: Avoid discouraged Quick testing calls
- **quick_discouraged_focused_test**: Avoid focused tests in Quick
- **quick_discouraged_pending_test**: Avoid pending tests in Quick
- **single_test_class**: Use single test class per file
- **nimble_operator**: Use Nimble operators for testing

#### **Advanced Swift Features**
- **array_init**: Use `Array()` instead of `[]`
- **attributes**: Attributes should be on their own lines
- **collection_alignment**: Collections should be properly aligned
- **discouraged_object_literal**: Avoid object literals
- **object_literal**: Use object literals consistently
- **enum_case_associated_values_count**: Limit associated values in enum cases
- **first_where**: Use `first(where:)` instead of `filter.first`
- **last_where**: Use `last(where:)` instead of `filter.last`
- **identical_operands**: Avoid identical operands in comparisons
- **legacy_random**: Use modern random APIs
- **literal_expression_end_indentation**: Proper indentation for literal expressions
- **modifier_order**: Modifiers must be in correct order
- **nslocalizedstring_key**: Use proper NSLocalizedString keys
- **number_separator**: Use number separators for readability
- **operator_usage_whitespace**: Proper whitespace around operators (severity: error)
- **overridden_super_call**: Call super in overridden methods
- **override_in_extension**: Avoid override in extensions
- **pattern_matching_keywords**: Use pattern matching keywords
- **prefer_zero_over_explicit_init**: Use `0` instead of `Int()`
- **prefixed_toplevel_constant**: Use prefixed constants at top level
- **prohibited_interface_builder**: Avoid Interface Builder usage
- **prohibited_super_call**: Avoid prohibited super calls
- **reduce_into**: Use `reduce(into:)` for better performance
- **redundant_nil_coalescing**: Remove redundant nil coalescing
- **required_enum_case**: All enum cases must be handled
- **sorted_first_last**: Use sorted first/last methods
- **statement_position**: Statements must be in correct position (severity: error)
- **unavailable_function**: Mark unavailable functions properly
- **unneeded_parentheses_in_closure_argument**: Remove unneeded parentheses
- **untyped_error_in_catch**: Use typed errors in catch blocks
- **vertical_parameter_alignment_on_call**: Align parameters vertically (severity: error)
- **unused_closure_parameter**: Remove unused closure parameters (severity: error)
- **valid_ibinspectable**: Use valid IBInspectable properties (severity: error)

#### **Tuple and Nesting Rules**
- **large_tuple**: Maximum tuple size limits (warning: 1, error: 2)
- **nesting**: Maximum nesting levels (type_level: warning: 1, error: 2)

#### **Return Arrow and Whitespace Rules**
- **return_arrow_whitespace**: Proper whitespace around return arrows (severity: error)

#### **SwiftUI Advanced Rules**
- **multiple_closures_with_trailing_closure**: Avoid multiple trailing closures (severity: error)

#### **Custom Project Rules**
- **explicit_self_required**: Use explicit `self` for method calls
- **single_responsibility**: Classes should have single responsibility
- **protocol_naming**: Protocols should end with 'Protocol' or 'Type'
- **enum_case_naming**: Enum cases should be camelCase
- **final_classes**: All classes should be marked as final unless designed for inheritance
- **explicit_self_in_closure**: Use explicit self in closures for clarity
- **mark_comments_required**: Use MARK comments to organize code sections
- **public_api_documentation**: Public APIs must be documented with /// comments
- **explicit_return_types**: Use explicit return types instead of Void
- **guard_over_if_let**: Use guard let instead of if let for early returns
- **explicit_access_control**: All declarations must have explicit access control (except SwiftUI views and body properties)

#### **SwiftUI Custom Rules**
- **swiftui_stateobject_over_observed**: Use @StateObject for owned ObservableObjects, @ObservedObject for external ones
- **swiftui_mainactor_viewmodels**: ViewModels must be marked with @MainActor
- **swiftui_view_structure**: SwiftUI Views must have proper structure with body property
- **swiftui_viewbuilder**: Complex computed properties returning some View must use @ViewBuilder
- **swiftui_modifier_order**: SwiftUI modifiers must be in logical order (layout → appearance → behavior)
- **swiftui_accessibility**: All interactive SwiftUI elements must have accessibility identifiers
- **swiftui_navigation**: NavigationLink must be properly configured with navigation modifiers
- **swiftui_preview**: Use #Preview instead of #PreviewProvider for SwiftUI previews
- **swiftui_state_management**: @State variables must be private
- **swiftui_environment**: @Environment variables must be private
- **swiftui_animation**: Use explicit animation curves instead of default
- **swiftui_performance**: ForEach must have explicit id parameter for performance
- **swiftui_error_handling**: Use proper error handling with alert modifiers
- **swiftui_view_naming**: SwiftUI Views must end with 'View'
- **swiftui_viewmodel_naming**: SwiftUI ViewModels must end with 'ViewModel'

### Prohibited Patterns
- ❌ Hardcoded values without constants
- ❌ Force unwrapping (`!`) or force casting (`as!`)
- ❌ Implicit access control (missing `private`, `public`, etc.)
- ❌ Long functions or closures (>10 lines)
- ❌ Long lines (>80 characters)
- ❌ Missing MARK comments for code organization
- ❌ Undocumented public APIs
- ❌ Non-descriptive variable names (<4 characters)
- ❌ Missing accessibility identifiers
- ❌ Improper SwiftUI modifier order
- ❌ Missing `@MainActor` on ViewModels
- ❌ Using `@ObservedObject` for owned objects
- ❌ Trailing whitespace
- ❌ Vertical whitespace (empty lines)
- ❌ Empty count/string checks
- ❌ Unused imports or declarations
- ❌ Unsorted imports
- ❌ Missing explicit return types
- ❌ Using `if let` instead of `guard let`
- ❌ Missing explicit `self` in closures
- ❌ Non-final classes without inheritance intent
- ❌ Improper switch case formatting
- ❌ Yoda conditions
- ❌ Multiple trailing closures
- ❌ Missing accessibility identifiers on interactive elements

### Required Patterns
- ✅ Explicit access control on all declarations
- ✅ `final` classes unless designed for inheritance
- ✅ `private` state variables in SwiftUI
- ✅ `@StateObject` for owned ObservableObjects
- ✅ `@MainActor` for all ViewModels
- ✅ MARK comments for code organization
- ✅ Documentation for public APIs
- ✅ Guard statements for early returns
- ✅ Descriptive naming (4+ characters)
- ✅ Accessibility identifiers on interactive elements
- ✅ Proper SwiftUI modifier order
- ✅ Explicit animation curves
- ✅ ForEach with explicit `id` parameter
- ✅ Sorted imports
- ✅ Explicit return types
- ✅ Proper whitespace formatting
- ✅ Explicit `self` in closures
- ✅ Proper switch case formatting
- ✅ Modern Swift APIs
- ✅ Proper error handling
- ✅ Memory-safe patterns

### Code Quality Enforcement
- **Build Integration**: SwiftLint runs as part of the Xcode build process
- **Zero Tolerance**: All violations must be fixed before code can be committed
- **Continuous Monitoring**: SwiftLint violations prevent successful builds
- **Team Standards**: All team members must follow the same quality standards
- **Code Review**: All code must pass SwiftLint before review

## SOLID and Best Practices

### Single Responsibility
Each type has one reason to change. Split large ViewModels into smaller use cases and adapters.

### Open/Closed
Prefer adding new types over modifying stable ones; use protocols/strategies for extensibility (e.g., AuthProvider).

### Liskov Substitution
ViewModels depend on protocols; mocks must be interchangeable without special cases.

### Interface Segregation
Keep service protocols small and specific (AuthService, UserRepository, StorageService). Avoid "God" interfaces.

### Dependency Inversion
Depend on abstractions (protocols) and inject via initializers/Environment. No global singletons (except Firebase under the hood, wrapped by services).

### General Best Practices
- Immutability by default; small pure functions
- Do not force-unwrap. Use guard/if-let; use throws for recoverable errors
- Keep Views free of business logic; side effects live in ViewModels/use cases
- Use @MainActor for UI-mutable code and @StateObject for owned models
- Remove dead code and unused imports encountered during edits

## Repository Structure

```
HKProjectTemplate/
  App/
    HKProjectTemplateApp.swift (SwiftUI entry)
    AppDelegate.swift (Firebase config)
    AppEnvironment.swift (Environment keys and DI wiring)
  Core/
    Models/ (domain models)
    Services/
    Firebase/
    Extensions/
  Features/
    Authentication/
    Profile/
    Settings/
  Components/ (custom views, buttons, UI components)
  DesignSystem/ (styles, tokens, modifiers)
  Constants/
    Colors.swift
    Fonts.swift
    Layout.swift
    Strings.swift
  Resources/
    Localization/
    Config/
  SupportingFiles/
    Info.plist
    Assets.xcassets
Scripts/
Tests/
  UnitTests/
  UITests/
  TestUtilities/
.cursor/
```

## Dependencies (SPM)

Add only needed Firebase products: FirebaseAuth, FirebaseFirestore, FirebaseFirestoreSwift, FirebaseStorage. Optional: FirebaseAnalytics, FirebaseCrashlytics.
Pin to latest compatible releases; update deliberately.

## Firebase Setup

- Configure in AppDelegate using UIApplicationDelegateAdaptor
- Emulator support (Debug): USE_FIREBASE_EMULATORS=1 to route Auth/Firestore/Storage to localhost

## Data Model and Firestore Conventions

- Domain models live in Core/Models (no Firebase types)
- DTOs in Core/DTOs map Firebase to domain
- Firestore:
  - Collections plural, docs by ID: users/{uid}, posts/{postId}
  - createdAt/updatedAt via server timestamps
  - Bounded queries (limit, order); avoid unbounded reads
  - Prefer document/collection listeners for live data where UX requires; otherwise use on-demand fetch

## Error Taxonomy and User Messaging

Define AppError with cases: network, permissions, notFound, validation, conflict, decoding, firebase(code:), unknown.
Map Firebase errors to AppError in services; ViewModels expose user-friendly messages.
Do not surface Firebase error types directly to UI.

## SwiftUI Views and View Models

### Views
- Small, composable; move repeated styling to ViewModifiers
- Avoid doing work in body; use .task, .onAppear sparingly with async/await
- Previews use PreviewDI mocks; no network calls

### ViewModels
- @MainActor ObservableObject with @Published state
- Async methods for effects; propagate cancellation
- No Firebase imports—use services via protocols

## Testing

- **Unit Tests**: Test ViewModels, UseCases, Services, and business logic in `Tests/UnitTests/`
- **UI Tests**: Test critical user flows and UI interactions in `Tests/UITests/`
- **Test Utilities**: Reusable test helpers, mocks, and test data in `Tests/TestUtilities/`
- Use protocol-based mocks/fakes; no real network/disk by default
- Integration tests may use Firebase Emulator Suite; guard with USE_FIREBASE_EMULATORS=1
- UI tests for critical flows; use accessibility identifiers
- Given–When–Then naming; one behavior per test; deterministic
- All test files must be added to appropriate Xcode test targets
- Use dependency injection for testable code with mock services

## Security, Privacy, Permissions

- Keychain for secrets. No secrets in source
- ATS defaults; justify exceptions
- Info.plist usage keys only when code uses the capability
- Redact PII in logs; do not log raw tokens or payloads

## Accessibility and Localization

- All user-facing strings localized; avoid concatenation—use format strings
- Provide accessibility labels/traits; support Dynamic Type; semantic colors; Dark Mode

## Performance

- No heavy work on main thread; use Instruments for hotspots
- Avoid redundant Firestore listeners; tear down listeners when views disappear
- Consider backpressure (throttling/debouncing) for rapid updates

## Constants Management

### Centralized Constants Structure
All hardcoded values MUST be centralized in the `Constants` folder:

```
Constants/
├── Colors.swift          # All Color values
├── Typography.swift      # All Font sizes and styles
├── Layout.swift          # Spacing, dimensions, corner radius, sizes
├── Animations.swift      # Animation durations and curves
├── Analytics.swift       # Analytics event names and properties
├── UIStrings.swift       # All UI text, SF Symbols, accessibility strings
├── Notifications.swift   # Notification names
└── Database.swift        # Database-related constants
```

### Constant Types to Centralize
- **CGFloat**: Spacing, dimensions, sizes, corner radius, border widths
- **Color**: All UI colors, themes, and semantic colors
- **Font**: Text styles, sizes, and weights
- **String**: All UI text, labels, placeholders, SF Symbol names
- **Double**: Animation durations, timeouts
- **Int**: Retry counts, limits, array indices
- **TimeInterval**: Network timeouts, delays
- **Notification.Name**: Notification identifiers

### Prohibited Patterns
- ❌ Hardcoded numbers: `spacing: 16`, `height: 50`
- ❌ Hardcoded colors: `Color.blue`, `Color.red`
- ❌ Hardcoded strings: `"Sign Out"`, `"Continue"`
- ❌ Magic numbers: `cornerRadius: 8`, `fontSize: 16`

### Required Patterns
- ✅ Use constants: `spacing: AppSpacing.md`
- ✅ Semantic colors: `AppColors.primary`
- ✅ Centralized strings: `CTAStrings.signOut`
- ✅ Named dimensions: `AppDimensions.buttonHeight`

## Fallback Patterns

### String and Numeric Fallback Conventions
Always use consistent fallback patterns for optional values:

### Required Patterns
- ✅ **Empty String**: Use `String()` instead of `""`
- ✅ **String Fallback**: Use `.orEmpty` extension instead of `?? ""`
- ✅ **Integer Fallback**: Use `.orZero` extension instead of `?? 0`
- ✅ **Double/Float Fallback**: Use `.orZero` extension instead of `?? 0.0`

### Prohibited Patterns
- ❌ Hardcoded empty string: `""`
- ❌ Nil coalescing with literals: `?? ""`, `?? 0`, `?? 0.0`

### Implementation
Add these extensions to `Extensions/String+Extensions.swift` and create `Extensions/Numeric+Extensions.swift`:

```swift
// String+Extensions.swift
extension String? {
    var orEmpty: String {
        return self ?? String()
    }
}

// Numeric+Extensions.swift
extension Int? {
    var orZero: Int {
        return self ?? 0
    }
}

extension Double? {
    var orZero: Double {
        return self ?? 0.0
    }
}

extension Float? {
    var orZero: Float {
        return self ?? 0.0
    }
}

extension CGFloat? {
    var orZero: CGFloat {
        return self ?? 0.0
    }
}
```

## Directory Structure Rules

### Core Architecture
- **Models**: Place all data models, DTOs, and domain entities in `Core/Models/`
- **Services**: Place business logic services, API clients, and data services in `Core/Services/`
- **Firebase**: Place Firebase-specific code (Firestore, Auth, Storage) in `Core/Firebase/`
- **Extensions**: Place Swift extensions and utilities in `Core/Extensions/`

### Feature Modules
- **Authentication**: Place login, registration, and auth-related code in `Features/Authentication/`
- **Profile**: Place user profile management code in `Features/Profile/`
- **Settings**: Place app settings and configuration code in `Features/Settings/`

### Design System
- **Views**: Place custom SwiftUI views and UI components in `Components/`
- **ViewModifiers**: Place custom view modifiers in `DesignSystem/ViewModifiers/`
- **Styles**: Place button styles, text styles, and other UI styles in `DesignSystem/Styles/`

### Constants & Resources
- **Colors**: Place color definitions and themes in `Constants/Colors.swift`
- **Fonts**: Place typography and font definitions in `Constants/Fonts.swift`
- **Layout**: Place spacing, sizing, and layout constants in `Constants/Layout.swift`
- **Strings**: Place UI strings and localization keys in `Constants/Strings.swift`
- **Localization**: Place localization files (.strings) in `Resources/Localization/`
- **Config**: Place configuration files (plists, JSON) in `Resources/Config/`

### Testing
- **Unit Tests**: Place unit tests in `Tests/UnitTests/`
- **UI Tests**: Place UI tests in `Tests/UITests/`
- **Test Utilities**: Place test helpers and mocks in `Tests/TestUtilities/`

## File Naming Conventions
- Use PascalCase for Swift files (e.g., `UserProfileView.swift`)
- Use camelCase for variables and functions
- Use descriptive names that indicate purpose
- Group related files in subdirectories when appropriate

## Import Organization
- System imports first
- Third-party imports second
- Local imports last
- Use `// MARK: -` to organize code sections

## Firebase Integration
- All Firebase-related code should go in `Core/Firebase/`
- Use dependency injection for Firebase services
- Keep Firebase configuration in `Resources/Config/`

## Development Guidelines
- Follow Swift API Design Guidelines
- Use SwiftUI + MVVM architecture
- Prefer composition over inheritance
- Use dependency injection for services
- Keep views small and focused
- Extract business logic to view models
- Use async/await for asynchronous operations
- Handle errors gracefully with proper error types

## Swift Packages

- Create packages for reusable components (DesignSystem, Core utilities)
- Keep packages focused and cohesive with single responsibility
- Use semantic versioning (major.minor.patch)
- Include proper documentation and usage examples
- Prefer local packages for internal components; publish only when beneficial
- Keep package dependencies minimal and well-justified

## Configuration and Environments

- Schemes: Debug, Staging, Release
- Keep GoogleService-Info-Debug.plist, -Staging.plist, -Release.plist and copy the right one at build time with a Run Script
- Never commit private keys or service accounts

## Offline and Caching

- Use Firestore's offline persistence but still handle stale/missing data gracefully
- For heavy read data, consider a simple in-memory cache in services or an actor-protected store
- Define cache invalidation triggers (e.g., sign-out clears caches)

## Error Handling Patterns

- Define domain-specific error enums with associated values
- Use Result<Success, Error> for operations that can fail
- Implement proper error recovery strategies
- Log errors with context but don't expose internal details to UI
- Use @Published error state in ViewModels for user feedback
- Implement retry mechanisms for transient failures
- Provide fallback UI states for error conditions

## Navigation

- Use NavigationStack (iOS 16+)
- Keep path state in a Coordinator or a simple NavigationModel actor if flows are complex
- Avoid creating navigation state inside deep subviews; pass bindings or environment objects

## Dependency Injection

AppDI with live/test/preview variants; inject via EnvironmentKey.
ViewModels receive dependencies in initializers; prefer protocol-typed properties.

## Code Organization

- Group related functionality in extensions
- Use MARK: comments to organize large files
- Keep files under 300 lines when possible
- Extract reusable components into separate files
- Use protocols to define contracts between modules
- Implement proper separation of concerns
- Create focused, single-purpose types

## Documentation Standards

- Document public APIs with /// comments
- Include usage examples for complex APIs
- Document parameter requirements and return values
- Use DocC for comprehensive documentation
- Keep README files updated with setup instructions
- Document architectural decisions in ADRs
- Include inline comments for complex business logic

## Testing Strategies

- Write tests for business logic, not implementation details
- Use dependency injection to make code testable
- Create test doubles (mocks, stubs, fakes) for external dependencies
- Test error conditions and edge cases
- Use snapshot testing for UI components
- Implement integration tests for critical user flows
- Use XCTestExpectation for async operations
- Mock network calls and database operations
- **Test Structure**: 
  - `Tests/UnitTests/` - Unit tests for ViewModels, Services, and business logic
  - `Tests/UITests/` - UI tests for user flows and interactions
  - `Tests/TestUtilities/` - Shared test helpers, mocks, and test data
- **Test Targets**: All test files must be added to appropriate Xcode test targets
- **Mock Services**: Use protocol-based mocks for dependency injection
- **Test Data**: Use `TestDataFactory` for consistent test data creation

## Code Review Guidelines

- Review for SOLID principles adherence and architectural consistency
- Check for proper error handling and user-friendly error messages
- Verify accessibility compliance (labels, traits, Dynamic Type support)
- Ensure tests cover new functionality with appropriate coverage
- Validate performance implications (main thread usage, memory leaks)
- Confirm proper dependency injection and protocol usage
- Check for security best practices (no hardcoded secrets, proper validation)
- Verify localization support for user-facing strings
- Ensure proper cancellation handling in async operations

## Accessibility & Internationalization

- Test with VoiceOver and other assistive technologies
- Use semantic colors and fonts that support Dynamic Type
- Provide accessibility labels and hints
- Support right-to-left languages
- Use proper contrast ratios for text and UI elements
- Test with different accessibility settings
- Implement proper focus management

## Logging and Analytics

- os.Logger with subsystem com.yourorg.yourapp and category per module
- Analytics optional; if enabled, use an AnalyticsService protocol with a Firebase-backed implementation. No PII

## Memory Management

- Use weak references for delegates and closures to prevent retain cycles
- Implement proper cleanup in deinit for resources and listeners
- Use @StateObject for owned data, @ObservedObject for external data
- Avoid creating objects in view body; use @State/@StateObject instead
- Profile with Instruments for memory leaks and retain cycles
- Use lazy properties for expensive computations
- Consider using @ViewBuilder for conditional view creation

## Concurrency Guidelines

- Use @MainActor for all UI-related code and state mutations
- Prefer async/await over completion handlers for new code
- Use Task.detached for background work that doesn't need main actor
- Implement proper cancellation with Task.checkCancellation()
- Use actors for shared mutable state instead of locks
- Avoid blocking the main thread with synchronous operations
- Use AsyncSequence for data streams and real-time updates

## SwiftUI Performance

- Use @State for local view state, @StateObject for complex objects
- Implement Equatable for custom views to prevent unnecessary redraws
- Use .id() modifier carefully to control view identity
- Avoid expensive computations in view body; use computed properties
- Use LazyVStack/LazyHStack for large lists
- Implement proper onAppear/onDisappear cleanup
- Use @ViewBuilder for conditional view creation

## Xcode Project and Special Files

- Do not hand-edit .xcodeproj/.pbxproj. Prefer SPM for modules/resources
- Assets.xcassets, .strings, .plist: additive, non-destructive edits
- If target membership or build phase changes are required, list exact steps

## Commits and PRs (project-level, optional but recommended)

- Conventional commits: feat, fix, refactor, test, docs, perf, chore
- PRs include: Problem, Solution, Screenshots (if UI), Testing steps, Trade-offs/Notes

## Git & Version Control

- Use conventional commit messages (feat:, fix:, docs:, etc.)
- Keep commits atomic and focused
- Write descriptive commit messages
- Use feature branches for new development
- Squash commits before merging to main
- Tag releases with semantic versioning
- Keep .gitignore updated for Xcode projects

## Build & Deployment

- Use build configurations for different environments
- Implement proper code signing for different schemes
- Use fastlane for automated builds and deployments
- Keep sensitive data in environment variables
- Implement proper CI/CD pipelines
- Use TestFlight for beta testing
- Monitor app performance and crashes

## Firestore Security Rules (guidance)

Keep rules least-privilege and document assumptions.

Example firestore.rules (adjust to your model):
```
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /users/{userId} {
      allow read, update, delete: if request.auth != null && request.auth.uid == userId;
      allow create: if request.auth != null && request.resource.data.uid == request.auth.uid;
    }
    match /posts/{postId} {
      allow read: if true;
      allow create: if request.auth != null && request.resource.data.authorId == request.auth.uid;
      allow update, delete: if request.auth != null && resource.data.authorId == request.auth.uid;
    }
    // Deny everything else by default
    match /{document=**} {
      allow read, write: if false;
    }
  }
}
```

Version your rules, test them with the emulator, and review before deploy.

## SwiftUI Previews Policy

Every new View should include at least one PreviewProvider.
Use PreviewDI with mock services and seeded data.
Avoid network/Firestore in previews; provide deterministic states (loading, loaded, error).

## Feature Flags (optional)

If needed, define a simple FeatureFlag service (local or Firebase Remote Config).
Flags must default to safe behavior; avoid app-breaking dependencies on remote values.

## Minimal CI Note

Do not edit CI unless asked. If requested, explain changes and their impact.

## File-Specific Rules

### Swift Files
- Swift 5.x with async/await and actors
- Swift API Design Guidelines; prefer immutability; no force unwrap
- Classes final unless intentional subclassing
- Keep Views free of business logic; ViewModels handle effects

### Feature Views
- Use small composable SwiftUI views; extract modifiers/components
- Use .task for async work; avoid heavy work in body
- Previews must use PreviewDI mocks; no network

### Feature ViewModels
- @MainActor ObservableObject with @Published state
- Depend on protocol abstractions from AppDI; no Firebase imports
- Expose async methods; handle cancellation and error mapping

### Firebase Services
- Import minimal Firebase modules
- Use Codable and FirebaseFirestoreSwift; map to domain models
- Map Firebase errors to AppError; do not leak FirebaseError

### DTOs
- DTOs may use @DocumentID and @ServerTimestamp
- Provide mapping to/from domain models

### Info.plist
- Add only required usage keys when capability is used; preserve XML

### GoogleService-Info plists
- Environment-specific; do not modify content unless instructed

### Firestore Rules
- Keep least-privilege principles; provide emulator-tested examples; deny by default outside covered paths

### Test Files
- Given–When–Then; deterministic; use mocks/fakes; emulator for integration only

### Scripts
- Use bash with set -euo pipefail; idempotent and CI-safe

### Localization Files (.strings)
- All user-facing strings must be localized
- Use descriptive keys that explain the context
- Avoid string concatenation; use format strings with placeholders
- Group related strings logically in the file
- Include comments for translators when context is unclear

### Core Data Models (.xcdatamodeld)
- Use descriptive entity and attribute names
- Define proper relationships with appropriate delete rules
- Use lightweight migrations when possible
- Keep models focused and avoid overly complex relationships
- Document entity purposes and relationships

### Asset Catalogs (.xcassets)
- Organize assets logically (Images, Colors, Icons, etc.)
- Use descriptive names for assets
- Provide appropriate resolutions for different screen densities
- Use semantic colors and system images when possible
- Include dark mode variants where applicable

## Bootstrap Checklist (for scaffolding)

1. Create repo structure as above
2. Add SPM deps: FirebaseAuth, FirebaseFirestore, FirebaseFirestoreSwift, FirebaseStorage
3. AppDelegate with FirebaseApp.configure and emulator hooks (Debug)
4. AppDI (live/test/preview) and EnvironmentKey wiring
5. Sample feature (Profile) with View + ViewModel and previews
6. Resources/Config with env-specific plists and copy script
7. Tests target with ViewModel unit test and service mocks
8. .cursor/rules from this document
9. firestore.rules with starter policy and emulator testing config
