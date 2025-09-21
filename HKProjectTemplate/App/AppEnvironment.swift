import SwiftUI

// MARK: - Environment Keys
struct AppDIKey: EnvironmentKey {
    static let defaultValue = AppDI.live
}

extension EnvironmentValues {
    var appDI: AppDI {
        get { self[AppDIKey.self] }
        set { self[AppDIKey.self] = newValue }
    }
}

// MARK: - Dependency Injection Container
enum AppDI {
    case live
    case test
    case preview
    
    // TODO: Add service implementations here
    // var authService: AuthService {
    //     switch self {
    //     case .live: return LiveAuthService()
    //     case .test: return MockAuthService()
    //     case .preview: return MockAuthService()
    //     }
    // }
}
