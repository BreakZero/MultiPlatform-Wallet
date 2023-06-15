import SwiftUI
import common

@main
struct iOSApp: App {
	var body: some Scene {
		WindowGroup {
            ContentView().environmentObject(UserManager.shared)
		}
	}
}

class KoinManager {
    static let shared = KoinHelper()
    static let todoHelper = ToDoHelper()
}
