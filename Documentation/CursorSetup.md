# CursorSetup

## 🚀 HKProjectTemplate Setup Process

### 1. **Get Project Details**
- Ask for: Project name, Bundle identifier

### 2. **Rename Files & Directories**
- Rename main app file: `HKProjectTemplateApp.swift` → `{ProjectName}App.swift`
- Rename app struct: `HKProjectTemplateApp` → `{ProjectName}`
- Rename Xcode project: `HKProjectTemplate.xcodeproj` → `{ProjectName}.xcodeproj`
- Rename source directory: `HKProjectTemplate/` → `{ProjectName}/`
- Rename main directory: `HKProjectTemplate copy` → `{ProjectName}`

### 3. **Update Configuration**
- Update bundle identifier in `project.pbxproj`
- Update all references in `project.pbxproj`
- Update SwiftLint config paths
- Update README.md project references

### 3.1 **Fix SwiftLint Issues**
- Update `.swiftlint.yml` included paths from `HKProjectTemplate` to `{ProjectName}`
- Test SwiftLint configuration: `swiftlint --config .swiftlint.yml`
- Fix any lint violations before proceeding

### 4. **Git Setup**
- Initialize Git repository
- Make initial commit
- Remove template remote

### 5. **Verify**
- Test build with xcodebuild
- Confirm project builds successfully

### 6. **Clean Documentation**
- Update all documentation files
- Remove template references
- Make project-specific

### 7. **Clean Up Template References**
- Remove Documentation folder (template-specific)
- Remove HKProjectTemplate references from .cursor/rules/project-rules.md
- Remove .swiftlint.yml.backup
- Remove Xcode user data files (xcuserdata/)
- Update Tests/README.md with project references
- Remove empty directories
- Clean up .DS_Store files

### 8. **Final Verification**
- Run tests to ensure they pass
- Check SwiftLint runs without errors
- Verify all file paths are correct
- Confirm no remaining template references

**Total Steps: 8 main categories, ~20 specific actions**

## Usage

When duplicating HKProjectTemplate:
1. Copy the template folder
2. Follow these steps in order
3. Each step should be completed before moving to the next
4. Verify each step before proceeding

## Notes

- Always test build after major changes
- Keep Git commits atomic per step
- Document any deviations from this process
