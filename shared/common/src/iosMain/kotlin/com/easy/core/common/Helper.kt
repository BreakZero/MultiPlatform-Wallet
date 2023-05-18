package com.easy.core.common

import org.koin.core.component.KoinComponent
import org.koin.core.context.startKoin

class KoinHelper: KoinComponent {

}

fun initKoin() {
    startKoin {
        modules()
    }
}
