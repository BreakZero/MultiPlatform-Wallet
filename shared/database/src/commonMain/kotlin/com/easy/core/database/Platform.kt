package com.easy.core.database

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform