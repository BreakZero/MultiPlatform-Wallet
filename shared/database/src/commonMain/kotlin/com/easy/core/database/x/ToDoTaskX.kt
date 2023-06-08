package com.easy.core.database.x

import com.easy.core.database.ToDoTaskEntity
import com.easy.model.ToDoTask

fun ToDoTaskEntity.toExternalModel(): ToDoTask {
    return ToDoTask(
        id = this.id,
        name = this.taskName,
        color = this.color,
        duration = this.duration,
        start = this.start,
        state = this.state == 1L
    )
}

fun ToDoTask.toEntity(): ToDoTaskEntity {
    return ToDoTaskEntity(
        id = this.id,
        taskName = this.name,
        color = this.color,
        duration = this.duration,
        start = this.start,
        state = if (this.state) 1 else 0
    )
}