package com.easy.d.wallet.android.todo

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.easy.core.database.DatabaseWrapper
import com.easy.model.TODOTask
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.flow.stateIn

class ToDoListViewModel(
    databaseWrapper: DatabaseWrapper
) : ViewModel() {
    val uiState = databaseWrapper.findAllTasks().map {
        ToDoListUiState(todoList = it)
    }.stateIn(
        viewModelScope, SharingStarted.WhileSubscribed(2000), ToDoListUiState(
            emptyList()
        )
    )
}

data class ToDoListUiState(
    val todoList: List<TODOTask>
)