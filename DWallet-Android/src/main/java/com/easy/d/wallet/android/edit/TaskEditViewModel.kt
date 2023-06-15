package com.easy.d.wallet.android.edit

import androidx.lifecycle.SavedStateHandle
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.easy.core.database.DatabaseWrapper
import com.easy.d.wallet.android.decoder.StringDecoder
import com.easy.d.wallet.android.detail.TaskArgs
import com.easy.d.wallet.android.utils.AccentColor
import com.easy.model.TODOTask
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.filterNotNull
import kotlinx.coroutines.flow.launchIn
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch
import okhttp3.internal.toLongOrDefault

class TaskEditViewModel(
    savedStateHandle: SavedStateHandle,
    stringDecoder: StringDecoder,
    private val databaseWrapper: DatabaseWrapper
) : ViewModel() {
    private val transferArgs: TaskArgs = TaskArgs(savedStateHandle, stringDecoder)

    private val _editUiState = MutableStateFlow(
        TaskEditUiState(
            "",
            "",
            System.currentTimeMillis(),
            AccentColor.PRIMARY.color
        )
    )

    init {
        databaseWrapper.findTaskById(transferArgs.taskId.toLongOrDefault(-1L))
            .filterNotNull().map { task ->
                _editUiState.update {
                    it.copy(
                        title = task.title,
                        description = task.description,
                        deadline = task.deadline,
                        accentColor = task.accentColor
                    )
                }
            }.launchIn(viewModelScope)
    }

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