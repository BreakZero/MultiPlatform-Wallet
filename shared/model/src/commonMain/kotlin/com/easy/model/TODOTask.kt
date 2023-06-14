package com.easy.model

data class TODOTask(
    val id: Long,
    val title: String,
    val description: String = "",
    val createAt: Long,
    val deadline: Long,
    val accentColor: Long
) {
    companion object {
        val EMPTY = TODOTask(
            id = -1L,
            title = "",
            description = "",
            createAt = -1L,
            deadline = -1L,
            accentColor = -1L
        )
    }

    fun inProgress(): Boolean {
        return false
    }
}
