package com.easy.d.wallet.android

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Scaffold
import androidx.compose.ui.Modifier
import androidx.core.view.WindowCompat
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.rememberNavController
import com.easy.d.wallet.android.detail.bindTaskDetailGraph
import com.easy.d.wallet.android.detail.navigateToTaskDetail
import com.easy.d.wallet.android.settings.bindSettingsGraph
import com.easy.d.wallet.android.settings.navigateToSettings
import com.easy.d.wallet.android.sign_in.SignInRoute
import com.easy.d.wallet.android.sign_in.bindSignInGraph
import com.easy.d.wallet.android.todo.bindToDoTaskListGraph
import com.easy.d.wallet.android.todo.navigateToTaskList

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        WindowCompat.setDecorFitsSystemWindows(window, false)
        setContent {
            MyApplicationTheme {
                Scaffold(
                    modifier = Modifier.fillMaxSize()
                ) {
                    val navController = rememberNavController()
                    NavHost(
                        modifier = Modifier
                            .fillMaxSize()
                            .padding(it),
                        navController = navController, startDestination = SignInRoute
                    ) {
                        bindSignInGraph(
                            signIn = {
                                navController.navigateToTaskList()
                            },
                            signInWithGoogle = {}
                        )
                        bindToDoTaskListGraph(
                            onSettingsClick = {
                                navController.navigateToSettings()
                            },
                            onItemClick = {
                                navController.navigateToTaskDetail(it.id)
                            },
                            onAddTask = {}
                        )
                        bindSettingsGraph()
                        bindTaskDetailGraph()
                    }
                }
            }
        }
    }
}
