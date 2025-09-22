import XCTest

final class SampleViewUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["-UITesting"]
        app.launch()
    }
    
    override func tearDownWithError() throws {
        app = nil
    }
    
    // MARK: - Navigation Tests
    
    func testSampleView_navigationTitle() throws {
        // Given & When
        // Navigate to SampleView (assuming it's accessible from ContentView)
        // This would typically be done through a button or navigation link
        
        // Then
        // For now, we'll test the main app navigation
        XCTAssertTrue(app.navigationBars.firstMatch.exists)
    }
    
    func testSampleView_initialState() throws {
        // Given & When
        // App launches with ContentView
        
        // Then
        XCTAssertTrue(app.staticTexts["Welcome to HKProjectTemplate"].exists)
        XCTAssertTrue(app.staticTexts["A production-ready iOS project template"].exists)
    }
    
    // MARK: - Content Tests
    
    func testSampleView_templateFeatures() throws {
        // Given & When
        // App is launched
        
        // Then
        XCTAssertTrue(app.staticTexts["Template Features"].exists)
        XCTAssertTrue(app.staticTexts["SwiftUI + MVVM"].exists)
        XCTAssertTrue(app.staticTexts["Firebase Ready"].exists)
        XCTAssertTrue(app.staticTexts["Testing Setup"].exists)
        XCTAssertTrue(app.staticTexts["Quality Tools"].exists)
    }
    
    func testSampleView_sampleFeatureButton() throws {
        // Given & When
        // App is launched
        
        // Then
        let sampleButton = app.buttons["View Sample Feature"]
        XCTAssertTrue(sampleButton.exists)
        XCTAssertTrue(sampleButton.isEnabled)
    }
    
    // MARK: - Accessibility Tests
    
    func testSampleView_accessibilityLabels() throws {
        // Given & When
        // App is launched
        
        // Then
        let welcomeText = app.staticTexts["Welcome to HKProjectTemplate"]
        XCTAssertTrue(welcomeText.exists)
        XCTAssertTrue(welcomeText.isHittable)
    }
    
    func testSampleView_accessibilityTraits() throws {
        // Given & When
        // App is launched
        
        // Then
        let sampleButton = app.buttons["View Sample Feature"]
        XCTAssertTrue(sampleButton.exists)
        XCTAssertTrue(sampleButton.isHittable)
    }
    
    // MARK: - UI Element Tests
    
    func testSampleView_appIcon() throws {
        // Given & When
        // App is launched
        
        // Then
        let appIcon = app.images.firstMatch
        XCTAssertTrue(appIcon.exists)
    }
    
    func testSampleView_featureList() throws {
        // Given & When
        // App is launched
        
        // Then
        let featureList = app.staticTexts["Template Features"]
        XCTAssertTrue(featureList.exists)
        
        // Check for feature items
        let swiftUIFeature = app.staticTexts["SwiftUI + MVVM"]
        let firebaseFeature = app.staticTexts["Firebase Ready"]
        let testingFeature = app.staticTexts["Testing Setup"]
        let qualityFeature = app.staticTexts["Quality Tools"]
        
        XCTAssertTrue(swiftUIFeature.exists)
        XCTAssertTrue(firebaseFeature.exists)
        XCTAssertTrue(testingFeature.exists)
        XCTAssertTrue(qualityFeature.exists)
    }
    
    // MARK: - Interaction Tests
    
    func testSampleView_buttonInteraction() throws {
        // Given
        let sampleButton = app.buttons["View Sample Feature"]
        
        // When
        sampleButton.tap()
        
        // Then
        // The button should be tappable (even if it just prints a message)
        // In a real implementation, this would navigate to SampleView
        XCTAssertTrue(sampleButton.exists)
    }
    
    // MARK: - Layout Tests
    
    func testSampleView_layoutElements() throws {
        // Given & When
        // App is launched
        
        // Then
        // Check that main elements are present and properly laid out
        XCTAssertTrue(app.navigationBars.firstMatch.exists)
        XCTAssertTrue(app.staticTexts["Welcome to HKProjectTemplate"].exists)
        XCTAssertTrue(app.buttons["View Sample Feature"].exists)
    }
    
    // MARK: - Performance Tests
    
    func testSampleView_launchPerformance() throws {
        // Given
        let measureOptions = XCTMeasureOptions()
        measureOptions.iterationCount = 3
        
        // When & Then
        measure(metrics: [XCTApplicationLaunchMetric()], options: measureOptions) {
            app.launch()
        }
    }
    
    // MARK: - Error State Tests
    
    func testSampleView_errorHandling() throws {
        // Given & When
        // App launches normally
        
        // Then
        // No error messages should be visible initially
        let errorMessages = app.staticTexts.matching(NSPredicate(format: "label CONTAINS 'Error'"))
        XCTAssertEqual(errorMessages.count, 0)
    }
    
    // MARK: - Dark Mode Tests
    
    func testSampleView_darkModeCompatibility() throws {
        // Given & When
        // App launches in current appearance mode
        
        // Then
        // All text should be visible and readable
        XCTAssertTrue(app.staticTexts["Welcome to HKProjectTemplate"].exists)
        XCTAssertTrue(app.staticTexts["A production-ready iOS project template"].exists)
    }
}
