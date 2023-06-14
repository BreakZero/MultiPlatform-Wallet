package com.easy.model

data class TODOTask(
    val id: Long,
    val title: String,
    val description: String = "",
    val createAt: Long,
    val deadline: Long,
    val accentColor: Long
) {
    fun inProgress(): Boolean {
        return false
    }
}
