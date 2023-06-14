package com.easy.d.wallet.android.edit

import androidx.compose.runtime.getValue
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import androidx.navigation.NavController
import androidx.navigation.NavGraphBuilder
import androidx.navigation.NavOptions
import androidx.navigation.compose.composable
import org.koin.androidx.compose.koinViewModel

const val TaskEditRoute = "edit_task"

fun NavController.navigateToEdit(navOptions: NavOptions? = null) {
    this.navigate(TaskEditRoute, navOptions)
}

fun NavGraphBuilder.bindTaskEditGraph(
    onSaved: () -> Unit
) {
    composable(route = TaskEditRoute) {
        val editViewModel: TaskEditViewModel = koinViewModel()
        val editUiState: TaskEditUiState by editViewModel.editUiState.collectAsStateWithLifecycle()
        TaskEditScreen(
            uiState = editUiState,
            onTitleChanged = editViewModel::onTitleChanged,
            onDescriptionChanged = editViewModel::onDescriptionChanged,
            onDeadlineChanged = editViewModel::onDeadlineChanged,
            onAccentColorChanged = editViewModel::onAccentColorChanged,
            onSave = {
                editViewModel.doSave()
                onSaved()
            }
        )
    }
}