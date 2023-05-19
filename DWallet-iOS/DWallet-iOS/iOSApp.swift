import SwiftUI
import common

@main
struct iOSApp: App {
    init() {
        HelperKt.doInitKoin()
    }
	var body: some Scene {
		WindowGroup {
			ToDoListScreen(todoListViewModel: ToDoListViewModel())
		}
	}
}

class KoinManager {
    static let shared = KoinHelper()
    static let todoHelper = ToDoHelper()
}
