package com.easy.model

data class UserProfile(
    val uid: Long,
    val fullName: String,
    val email: String,
    val password: String,
    val createAt: Long
) {
    companion object {
        val EMPTY = UserProfile(
            uid = -1L,
            fullName = "",
            email = "",
            password = "",
            createAt = -1L
        )
    }
}