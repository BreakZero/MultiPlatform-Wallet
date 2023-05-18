package com.easy.core.database

class DatabaseWrapper(databaseDriverFactory: DatabaseDriverFactory) {
    private val database = EasyDatabase(databaseDriverFactory.createDriver())
    private val query = database.easyDatabaseQueries

    fun selectAllTask() = query.selectAllTask().executeAsList()

    fun insert(taskName: String) {
        query.insertFull(ToDoTaskEntity(-1L, taskName))
    }
}
