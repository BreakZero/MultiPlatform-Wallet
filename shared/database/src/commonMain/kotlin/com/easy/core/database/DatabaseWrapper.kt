package com.easy.core.database

import app.cash.sqldelight.coroutines.asFlow
import app.cash.sqldelight.coroutines.mapToList
import com.easy.model.ToDoTask
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.map

class DatabaseWrapper(databaseDriverFactory: DatabaseDriverFactory) {
    private val database = EasyDatabase(databaseDriverFactory.createDriver())
    private val todoQuery = database.easyDatabaseQueries

    fun selectAllTask() = todoQuery.selectAllTask().asFlow().mapToList(Dispatchers.Default).map { it.map { ToDoTask(it.id, it.taskName) } }

    suspend fun insert(taskName: String) {
        todoQuery.insertFull(ToDoTaskEntity(-2L, taskName))
    }
}
