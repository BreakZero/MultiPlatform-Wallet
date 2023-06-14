package com.easy.d.wallet.android.detail

import androidx.lifecycle.SavedStateHandle
import androidx.lifecycle.ViewModel
import com.easy.d.wallet.android.decoder.StringDecoder
import com.easy.model.TODOTask
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
            task = TODOTask(
                id = 0L,
                title = "Design Logo",
                accentColor = 0xFF123321L,
                description = "",
                deadline = 0x111L,
                createAt = 0x111L
            )
        )
    )

    val detailUiState = _detailUiState.asStateFlow()
}

data class TaskDetailUiState(
    val task: TODOTask,
    val errorMessage: String? = null
)