package com.easy.wallet

import com.trustwallet.core.HDWallet

expect class DWallet() {
    fun createWallet(): HDWallet
    fun currWallet(): HDWallet
}