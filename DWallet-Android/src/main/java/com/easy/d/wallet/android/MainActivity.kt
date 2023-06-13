package com.easy.d.wallet.android

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.ui.Modifier
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.rememberNavController
import com.easy.d.wallet.android.sign_in.SignIn
import com.easy.d.wallet.android.sign_in.SignInRoute
import com.easy.d.wallet.android.todo.ToDoTaskList
import com.easy.d.wallet.android.todo.navigateToTaskList

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            MyApplicationTheme {
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colorScheme.background
                ) {
                    val navController = rememberNavController()
                    NavHost(navController = navController, startDestination = SignInRoute) {
                        SignIn(
                            signIn = {
                                navController.navigateToTaskList()
                            },
                            signInWithGoogle = {}
                        )
                        ToDoTaskList(
                            onItemClick = {},
                            onAddTask = {}
                        )
                    }
                }
            }
        }
    }
}
