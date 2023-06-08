package com.easy.model

data class ToDoTask(
    val id: Long,
    val name: String,
    val color: Long,
    val duration: Long,
    val start: Long,
    val state: Boolean
)
