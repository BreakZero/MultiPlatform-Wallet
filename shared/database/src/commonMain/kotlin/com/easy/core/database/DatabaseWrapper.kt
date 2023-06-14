package com.easy.core.database

import app.cash.sqldelight.coroutines.asFlow
import app.cash.sqldelight.coroutines.mapToList
import app.cash.sqldelight.coroutines.mapToOneOrNull
import com.easy.core.database.x.toEntity
import com.easy.core.database.x.toExternalModel
import com.easy.model.TODOTask
import com.easy.model.UserProfile
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.map

class DatabaseWrapper(databaseDriverFactory: DatabaseDriverFactory) {
    private val database = EasyDatabase(databaseDriverFactory.createDriver())
    private val queries = database.easyDatabaseQueries

    fun selectAllTask() = queries.findAllTasks().asFlow().mapToList(Dispatchers.Default)
        .map { it.map(TODOTaskEntity::toExternalModel) }

    suspend fun insertTask(todoTask: TODOTask) {
        queries.insertTask(todoTask.toEntity())
    }

    suspend fun insertUser(userProfile: UserProfile) {
        queries.insertUser(userProfile.toEntity())
    }

    fun findUser() = queries.findUser().asFlow().mapToOneOrNull(Dispatchers.Default).map {
        it?.toExternalModel()
    }
}
