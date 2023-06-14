package com.easy.d.wallet.android.edit

import android.annotation.SuppressLint
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.easy.core.database.DatabaseWrapper
import com.easy.d.wallet.android.utils.AccentColor
import com.easy.model.TODOTask
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch
import java.text.SimpleDateFormat
import java.util.Date

class TaskEditViewModel(
    private val databaseWrapper: DatabaseWrapper
) : ViewModel() {
    private val _editUiState = MutableStateFlow(TaskEditUiState("", "", -1L, AccentColor.GREEN.color))
    val editUiState = _editUiState.asStateFlow()

    fun onTitleChanged(title: String) {
        _editUiState.update {
            it.copy(title = title)
        }
    }

    fun onDescriptionChanged(description: String) {
        _editUiState.update {
            it.copy(description = description)
        }
    }

    fun onDeadlineChanged(deadline: Long) {
        _editUiState.update {
            it.copy(deadline = deadline)
        }
    }

    fun onAccentColorChanged(accentColor: Long) {
        _editUiState.update {
            it.copy(accentColor = accentColor)
        }
    }

    fun doSave() {
        viewModelScope.launch {
            with(_editUiState.value) {
                databaseWrapper.insertTask(
                    TODOTask(
                        id = -1L,
                        title = title,
                        description = description,
                        deadline = deadline,
                        createAt = System.currentTimeMillis(),
                        accentColor = accentColor
                    )
                )
            }
        }
    }
}

data class TaskEditUiState(
    val title: String,
    val description: String,
    val deadline: Long,
    val accentColor: Long = 0xFFFFFFFF
) {
    fun isValid(): Boolean {
        return title.isNotBlank() && description.isNotBlank() && deadline > 0L
    }
}