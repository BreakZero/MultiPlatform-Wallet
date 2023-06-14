package com.easy.d.wallet.android.detail

import androidx.lifecycle.SavedStateHandle
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.easy.core.database.DatabaseWrapper
import com.easy.d.wallet.android.decoder.StringDecoder
import com.easy.model.TODOTask
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.flow.stateIn

class TaskDetailViewModel constructor(
    savedStateHandle: SavedStateHandle,
    stringDecoder: StringDecoder,
    databaseWrapper: DatabaseWrapper
) : ViewModel() {
    private val transferArgs: TaskArgs = TaskArgs(savedStateHandle, stringDecoder)

    val detailUiState = databaseWrapper.findTaskById(transferArgs.taskId.toLong()).map {
        it?.let {
            TaskDetailUiState(task = it)
        } ?: TaskDetailUiState(task = TODOTask.EMPTY, errorMessage = "Can not find the task which id is ${transferArgs.taskId}")
    }.stateIn(
        viewModelScope, SharingStarted.WhileSubscribed(2000),
        TaskDetailUiState(task = TODOTask.EMPTY)
    )
}

data class TaskDetailUiState(
    val task: TODOTask,
    val errorMessage: String? = null
)