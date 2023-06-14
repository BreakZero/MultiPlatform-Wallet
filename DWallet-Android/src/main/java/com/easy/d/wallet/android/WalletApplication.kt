package com.easy.d.wallet.android

import android.app.Application
import com.easy.core.common.di.appModules
import com.easy.d.wallet.android.di.commonModule
import com.easy.d.wallet.android.di.featureModules
import org.koin.core.context.startKoin

class WalletApplication: Application() {
    override fun onCreate() {
        super.onCreate()
        startKoin {
            modules(commonModule)
            modules(appModules())
            modules(featureModules)
        }
    }
}