package com.easy.d.wallet.android.detail

import android.net.Uri
import androidx.compose.runtime.getValue
import androidx.lifecycle.SavedStateHandle
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import androidx.navigation.NavController
import androidx.navigation.NavGraphBuilder
import androidx.navigation.NavOptions
import androidx.navigation.NavType
import androidx.navigation.compose.composable
import androidx.navigation.navArgument
import com.easy.d.wallet.android.decoder.StringDecoder
import org.koin.androidx.compose.koinViewModel

const val TaskDetailRoute = "task_detail"

internal const val taskIdKey = "arg_task_id"

internal class TaskArgs(val taskId: String) {
    constructor(savedStateHandle: SavedStateHandle, stringDecoder: StringDecoder) :
            this(stringDecoder.decodeString(checkNotNull(savedStateHandle[taskIdKey])))
}

fun NavController.navigateToTaskDetail(taskId: Long, navOptions: NavOptions? = null) {
    val encodeTaskId = Uri.encode(taskId.toString())
    this.navigate("$TaskDetailRoute/$encodeTaskId", navOptions)
}

fun NavGraphBuilder.bindTaskDetailGraph(
    onEdit: () -> Unit
) {
    composable(
        route = "$TaskDetailRoute/{$taskIdKey}",
        arguments = listOf(
            navArgument(taskIdKey) { type = NavType.StringType }
        )
    ) {
        val detailViewModel: TaskDetailViewModel = koinViewModel()
        val uiState by detailViewModel.detailUiState.collectAsStateWithLifecycle()
        TaskDetailScreen(uiState = uiState, onEdit = onEdit)
    }
}