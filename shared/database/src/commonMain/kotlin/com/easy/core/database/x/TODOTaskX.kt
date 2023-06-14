package com.easy.core.database.x

import com.easy.core.database.TODOTaskEntity
import com.easy.model.TODOTask

fun TODOTaskEntity.toExternalModel(): TODOTask {
    return TODOTask(
        id = this.id,
        title = this.title,
        description = this.description,
        accentColor = this.accentColor,
        deadline = this.deadline,
        createAt = this.createAt
    )
}

fun TODOTask.toEntity(): TODOTaskEntity {
    return TODOTaskEntity(
        id = this.id,
        title = this.title,
        description = this.description,
        accentColor = this.accentColor,
        deadline = this.deadline,
        createAt = this.createAt
    )
}