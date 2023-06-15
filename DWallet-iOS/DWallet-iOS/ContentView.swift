import SwiftUI
import common

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

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
        ContentView().environmentObject(UserManager.shared)
	}
}
