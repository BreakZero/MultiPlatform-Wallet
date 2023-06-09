package com.easy.d.wallet.android.todo

import androidx.compose.runtime.getValue
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import androidx.navigation.NavController
import androidx.navigation.NavGraphBuilder
import androidx.navigation.NavOptions
import androidx.navigation.compose.composable
import com.easy.model.TODOTask
import org.koin.androidx.compose.koinViewModel

const val ToDoListRoute = "todo_task_list"

fun NavController.navigateToTaskList(navOptions: NavOptions? = null) {
    this.navigate(ToDoListRoute, navOptions)
}

fun NavGraphBuilder.bindToDoTaskListGraph(
    onSettingsClick: () -> Unit,
    onItemClick: (TODOTask) -> Unit,
    onAddTask: () -> Unit
) {
    composable(route = ToDoListRoute) {
        val toDoListViewModel: ToDoListViewModel = koinViewModel()
        val listUiState by toDoListViewModel.uiState.collectAsStateWithLifecycle()
        ToDoListScreen(
            listUiState = listUiState,
            onItemClick = onItemClick,
            onAddTask = onAddTask,
            onSettingsClick = onSettingsClick
        )
    }
}
