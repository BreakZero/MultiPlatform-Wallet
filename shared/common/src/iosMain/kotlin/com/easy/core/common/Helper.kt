package com.easy.core.common

import com.easy.core.common.di.appModules
import com.easy.core.database.DatabaseDriverFactory
import com.easy.core.database.DatabaseWrapper
import com.easy.wallet.DWallet
import org.koin.core.component.KoinComponent
import org.koin.core.component.inject
import org.koin.core.context.startKoin

class KoinHelper: KoinComponent {
    private val databaseWrapper: DatabaseWrapper by inject()
    private val wallet: DWallet by inject()

    fun databaseWrapper() = databaseWrapper
    fun wallet() = wallet
}

fun initKoin() {
    startKoin {
        modules(appModules())
    }
}
