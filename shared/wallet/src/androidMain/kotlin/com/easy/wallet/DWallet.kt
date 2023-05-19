package com.easy.wallet

import com.trustwallet.core.HDWallet

actual class DWallet actual constructor() {
    init {
        System.loadLibrary("TrustWalletCore")
    }
    actual fun createWallet(): HDWallet {
        return HDWallet(256, "")
    }

    actual fun currWallet(): HDWallet {
        return HDWallet(
            "emotion refuse click act warm junior like right scatter peanut trim deliver",
            ""
        )
    }
}