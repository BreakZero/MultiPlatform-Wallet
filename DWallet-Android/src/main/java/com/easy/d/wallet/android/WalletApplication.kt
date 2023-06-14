package com.easy.d.wallet.android

import android.app.Application
import com.easy.core.common.di.appModules
import com.easy.d.wallet.android.di.commonModule
import com.easy.d.wallet.android.di.featureModules
import org.koin.android.ext.koin.androidContext
import org.koin.core.context.startKoin

class WalletApplication: Application() {
    override fun onCreate() {
        super.onCreate()
        startKoin {
            androidContext(applicationContext)
            modules(commonModule)
            modules(appModules())
            modules(featureModules)
        }
    }
}