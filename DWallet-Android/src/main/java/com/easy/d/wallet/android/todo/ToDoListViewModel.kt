package com.easy.d.wallet.android.todo

import androidx.lifecycle.ViewModel
import com.easy.model.TODOTask
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
                    TODOTask(
                        id = it.toLong(),
                        title = "Design Logo",
                        accentColor = 0xFF123321L,
                        description = "",
                        deadline = 0x111L,
                        createAt = 0x111L
                    )
                }
            )
        }
    }
}

data class ToDoListUiState(
    val todoList: List<TODOTask>
)