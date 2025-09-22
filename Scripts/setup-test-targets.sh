#!/bin/bash
set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

PROJECT_NAME="HKProjectTemplate"
PROJECT_FILE="${PROJECT_NAME}.xcodeproj"

print_status "Setting up test targets for ${PROJECT_NAME}..."

# Verify test files exist
print_status "Verifying test files..."
TEST_FILES=(
    "Tests/Unit/SampleViewModelTests.swift"
    "Tests/Unit/AppEnvironmentTests.swift"
    "Tests/UI/SampleViewUITests.swift"
    "Tests/TestUtilities/TestHelpers.swift"
    "Tests/TestUtilities/MockServices.swift"
)

for file in "${TEST_FILES[@]}"; do
    if [ -f "$file" ]; then
        print_success "✓ $file exists"
    else
        print_error "✗ $file is missing. Please ensure all test files are created."
        exit 1
    fi
done

print_status "Creating test targets..."
print_warning "Test targets need to be created manually in Xcode:"
print_warning "1. Open ${PROJECT_FILE} in Xcode"
print_warning "2. Select the project in the navigator"
print_warning "3. Click the '+' button at the bottom of the targets list"
print_warning "4. Choose 'iOS Unit Testing Bundle'"
print_warning "5. Name it '${PROJECT_NAME}Tests'"
print_warning "6. Repeat for '${PROJECT_NAME}UITests' (iOS UI Testing Bundle)"
print_warning "7. Add the test files to the appropriate targets"

print_status "Test files are ready in the Tests/ directory:"
print_status "- Tests/Unit/ - Unit test files"
print_status "- Tests/UI/ - UI test files"
print_status "- Tests/TestUtilities/ - Test helper files"

print_success "Test setup script completed!"

print_status "Next steps:"
print_status "1. Open the project in Xcode"
print_status "2. Create test targets as described above"
print_status "3. Add test files to the targets"
print_status "4. Run tests with Cmd+U"
