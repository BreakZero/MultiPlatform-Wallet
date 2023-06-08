package com.easy.core.database

import app.cash.sqldelight.coroutines.asFlow
import app.cash.sqldelight.coroutines.mapToList
import com.easy.core.database.x.toEntity
import com.easy.core.database.x.toExternalModel
import com.easy.model.ToDoTask
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.map

class DatabaseWrapper(databaseDriverFactory: DatabaseDriverFactory) {
    private val database = EasyDatabase(databaseDriverFactory.createDriver())
    private val todoQuery = database.easyDatabaseQueries

    fun selectAllTask() = todoQuery.selectAllTask().asFlow().mapToList(Dispatchers.Default).map { it.map { it.toExternalModel() } }

    suspend fun insert(toDoTask: ToDoTask) {
        todoQuery.insertFull(toDoTask.toEntity())
    }
}
