package com.easy.d.wallet.android.edit

import androidx.lifecycle.ViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.asStateFlow

class TaskEditViewModel: ViewModel() {
    private val _editUiState = MutableStateFlow(TaskEditUiState(""))
    val editUiState = _editUiState.asStateFlow()
}

data class TaskEditUiState(
    val title: String
)