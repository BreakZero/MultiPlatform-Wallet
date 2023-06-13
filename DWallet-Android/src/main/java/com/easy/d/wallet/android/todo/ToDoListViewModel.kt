package com.easy.d.wallet.android.todo

import androidx.lifecycle.ViewModel
import com.easy.model.ToDoTask
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.update

class ToDoListViewModel : ViewModel() {
    private val _uiState = MutableStateFlow(ToDoListUiState(emptyList()))
    val uiState = _uiState.asStateFlow()

    init {
        _uiState.update {
            ToDoListUiState(
                (1..12).map {
                    ToDoTask(
                        id = it.toLong(),
                        name = "Design Logo $it",
                        color = 0xFF123321L,
                        duration = 0L,
                        start = it.toLong(),
                        state = true
                    )
                }
            )
        }
    }
}

data class ToDoListUiState(
    val todoList: List<ToDoTask>
)