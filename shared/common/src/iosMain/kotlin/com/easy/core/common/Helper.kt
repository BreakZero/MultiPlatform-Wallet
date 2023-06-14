package com.easy.core.common

import com.easy.core.common.di.appModules
import com.easy.core.common.utils.KotlinNativeFlowWrapper
import com.easy.core.database.DatabaseWrapper
import com.easy.model.TODOTask
import com.easy.wallet.DWallet
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import org.koin.core.component.KoinComponent
import org.koin.core.component.inject
import org.koin.core.context.startKoin
import kotlin.coroutines.CoroutineContext

class KoinHelper: KoinComponent {
    private val wallet: DWallet by inject()
    fun wallet() = wallet
}

class ToDoHelper: KoinComponent {
    private val databaseWrapper: DatabaseWrapper by inject()

    fun allToDoTask() = KotlinNativeFlowWrapper(databaseWrapper.findAllTasks())

    suspend fun insertTask(todoTask: TODOTask) = databaseWrapper.insertTask(todoTask)
}

val iosScope: CoroutineScope = object : CoroutineScope {
    override val coroutineContext: CoroutineContext
        get() = SupervisorJob() + Dispatchers.Main
}

fun initKoin() {
    startKoin {
        modules(appModules())
    }
}
