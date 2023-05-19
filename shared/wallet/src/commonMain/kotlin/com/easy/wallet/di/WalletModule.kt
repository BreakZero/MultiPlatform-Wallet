package com.easy.wallet.di

import com.easy.wallet.DWallet
import org.koin.core.module.dsl.singleOf
import org.koin.dsl.module

val walletModule = module {
    singleOf(::DWallet)
}