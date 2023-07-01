package com.easy.d.wallet.android

import android.app.Activity
import android.app.ActivityManager
import android.content.Context
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.asPaddingValues
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Scaffold
import androidx.compose.material3.ScaffoldDefaults
import androidx.compose.material3.Surface
import androidx.compose.runtime.getValue
import androidx.compose.ui.Modifier
import androidx.core.view.WindowCompat
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.rememberNavController
import com.easy.d.wallet.android.detail.bindTaskDetailGraph
import com.easy.d.wallet.android.detail.navigateToTaskDetail
import com.easy.d.wallet.android.edit.bindTaskEditGraph
import com.easy.d.wallet.android.edit.navigateToEdit
import com.easy.d.wallet.android.settings.bindSettingsGraph
import com.easy.d.wallet.android.settings.navigateToSettings
import com.easy.d.wallet.android.sign_in.SignInRoute
import com.easy.d.wallet.android.sign_in.bindSignInGraph
import com.easy.d.wallet.android.todo.ToDoListRoute
import com.easy.d.wallet.android.todo.bindToDoTaskListGraph
import com.easy.d.wallet.android.todo.navigateToTaskList
import kotlinx.coroutines.withContext
import org.koin.androidx.viewmodel.ext.android.viewModel

class MainActivity : ComponentActivity() {

    private val mainViewModel: MainViewModel by viewModel()

    private fun printMemoryLimited(activity: Activity) {
        val actManager = activity.getSystemService(Context.ACTIVITY_SERVICE) as ActivityManager
        println(actManager.memoryClass)
        println(actManager.largeMemoryClass)
        println(Runtime.getRuntime().maxMemory() / (1024 * 1024))
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        WindowCompat.setDecorFitsSystemWindows(window, false)
        printMemoryLimited(this)
        setContent {
            MyApplicationTheme {
                Surface(
                    modifier = Modifier
                        .fillMaxSize()
                        .padding(ScaffoldDefaults.contentWindowInsets.asPaddingValues())
                ) {
                    val hasLogin by mainViewModel.hasLogin.collectAsStateWithLifecycle()
                    val navController = rememberNavController()
                    NavHost(
                        modifier = Modifier
                            .fillMaxSize(),
                        navController = navController,
                        startDestination = if (hasLogin) ToDoListRoute else SignInRoute
                    ) {
                        bindSignInGraph(
                            toNext = navController::navigateToTaskList
                        )
                        bindToDoTaskListGraph(
                            onSettingsClick = navController::navigateToSettings,
                            onItemClick = {
                                navController.navigateToTaskDetail(it.id)
                            },
                            onAddTask = navController::navigateToEdit
                        )
                        bindSettingsGraph(onLogout = navController::popBackStack)
                        bindTaskDetailGraph(
                            onEdit = navController::navigateToEdit,
                            popBack = navController::popBackStack
                        )
                        bindTaskEditGraph(
                            onSaved = navController::popBackStack,
                            popBack = navController::popBackStack
                        )
                    }
                }
            }
        }
    }
}
