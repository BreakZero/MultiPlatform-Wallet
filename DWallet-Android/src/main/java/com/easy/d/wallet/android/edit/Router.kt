package com.easy.d.wallet.android.edit

import android.net.Uri
import androidx.compose.runtime.getValue
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import androidx.navigation.NavController
import androidx.navigation.NavGraphBuilder
import androidx.navigation.NavOptions
import androidx.navigation.NavType
import androidx.navigation.compose.composable
import androidx.navigation.navArgument
import com.easy.d.wallet.android.detail.taskIdKey
import org.koin.androidx.compose.koinViewModel

const val TaskEditRoute = "edit_task"


fun NavController.navigateToEdit(taskId: Long? = null, navOptions: NavOptions? = null) {
    val encodeTaskId = Uri.encode((taskId ?: -1L).toString())
    this.navigate("$TaskEditRoute?$taskIdKey=$encodeTaskId", navOptions)
}

fun NavGraphBuilder.bindTaskEditGraph(
    onSaved: () -> Unit,
    popBack: () -> Unit
) {
    composable(
        route = "$TaskEditRoute?$taskIdKey={$taskIdKey}",
        arguments = listOf(navArgument(taskIdKey) { type = NavType.StringType })
    ) {
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
            },
            popBack = popBack
        )
    }
}