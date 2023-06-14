package com.easy.d.wallet.android.sign_in

import androidx.compose.runtime.getValue
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import androidx.navigation.NavController
import androidx.navigation.NavGraphBuilder
import androidx.navigation.NavOptions
import androidx.navigation.compose.composable
import org.koin.androidx.compose.koinViewModel

const val SignInRoute = "sign_in"

fun NavController.navigateToSignIn(navOptions: NavOptions? = null) {
    this.navigate(SignInRoute, navOptions)
}

fun NavGraphBuilder.bindSignInGraph(
    toNext: () -> Unit
) {
    composable(route = SignInRoute) {
        val signInViewModel: SignInViewModel = koinViewModel()
        val signInUiState by signInViewModel.signInUiState.collectAsStateWithLifecycle()
        SignInScreen(
            uiState = signInUiState,
            emailChanged = signInViewModel::emailChanged,
            passwordChanged = signInViewModel::passwordChanged,
            signIn = {
                signInViewModel.signIn()
                toNext()
            },
            signInWithGoogle = {
                signInViewModel.signInWithGoogle()
                toNext()
            }
        )
    }
}