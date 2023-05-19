import SwiftUI
import common

struct ContentView: View {
    var wallet = KoinHelper().wallet()
	var body: some View {
        VStack {
            Text("Hello")
            Spacer()
            Text(wallet.currWallet().mnemonic)
        }
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
