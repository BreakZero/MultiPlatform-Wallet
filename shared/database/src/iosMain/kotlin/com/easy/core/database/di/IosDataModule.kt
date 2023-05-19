package com.easy.core.database.di

import com.easy.core.database.DatabaseDriverFactory
import org.koin.core.module.dsl.singleOf
import org.koin.dsl.module

actual fun factoryModule() = module {
    single {
        DatabaseDriverFactory()
    }
}