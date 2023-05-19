package com.easy.core.common.di

import com.easy.core.database.di.databaseModule
import com.easy.core.database.di.factoryModule
import com.easy.wallet.di.walletModule

fun appModules() = listOf(
    factoryModule(),  databaseModule, walletModule
)