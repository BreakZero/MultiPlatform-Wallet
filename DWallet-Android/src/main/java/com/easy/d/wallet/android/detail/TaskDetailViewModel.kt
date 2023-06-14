package com.easy.d.wallet.android.detail

import androidx.lifecycle.SavedStateHandle
import androidx.lifecycle.ViewModel
import com.easy.d.wallet.android.decoder.StringDecoder
import com.easy.model.ToDoTask
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.asStateFlow

class TaskDetailViewModel constructor(
    savedStateHandle: SavedStateHandle,
    stringDecoder: StringDecoder
): ViewModel() {
    private val transferArgs: TaskArgs = TaskArgs(savedStateHandle, stringDecoder).also {
        println("===== ${it.taskId}")
    }
    private val _detailUiState = MutableStateFlow(
        TaskDetailUiState(
            task = ToDoTask(
                id = 0L,
                name = "Design Logo",
                color = 0xFF123321L,
                duration = 0L,
                start = 12L,
                state = true
            )
        )
    )

    val detailUiState = _detailUiState.asStateFlow()
}

data class TaskDetailUiState(
    val task: ToDoTask,
    val errorMessage: String? = null
)