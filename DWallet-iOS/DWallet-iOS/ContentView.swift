import SwiftUI
import common

struct ContentView: View {
    var wallet = KoinManager.shared.wallet().currWallet()
	var body: some View {
        VStack {
            Text("Hello")
            Spacer()
            Text(wallet.mnemonic)
        }
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
