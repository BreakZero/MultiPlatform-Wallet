import SwiftUI
import wallet

struct ContentView: View {
    var wallet = DWallet().currWallet()

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
