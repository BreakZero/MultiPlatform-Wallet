package com.easy.core.database.di

import com.easy.core.database.DatabaseWrapper
import org.koin.core.module.Module
import org.koin.core.module.dsl.singleOf
import org.koin.dsl.module

expect fun factoryModule(): Module

val databaseModule = module {
    single {
        DatabaseWrapper(get())
    }
}