import SwiftUI
import common

@available(iOS 16.0, *)
struct ContentView: View {
    @EnvironmentObject var userManager: UserManager
	var body: some View {
        Group {
            if userManager.loggedUser != nil {
                TODOListScreen()
            }
            else {
                SignInScreen()
            }
        }
	}
}

@available(iOS 16.0, *)
struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
        ContentView().environmentObject(UserManager.shared)
	}
}
