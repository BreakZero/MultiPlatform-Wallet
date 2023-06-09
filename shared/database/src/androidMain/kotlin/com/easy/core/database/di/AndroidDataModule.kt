package com.easy.core.database.di

import com.easy.core.database.DatabaseDriverFactory
import org.koin.dsl.module

actual fun factoryModule() = module {
    single {
        DatabaseDriverFactory(get())
    }
}