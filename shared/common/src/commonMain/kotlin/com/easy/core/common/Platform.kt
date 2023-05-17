package com.easy.core.common

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform