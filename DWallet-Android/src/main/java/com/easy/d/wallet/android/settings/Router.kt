package com.easy.d.wallet.android.settings

import androidx.compose.runtime.getValue
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import androidx.navigation.NavController
import androidx.navigation.NavGraphBuilder
import androidx.navigation.NavOptions
import androidx.navigation.compose.composable
import org.koin.androidx.compose.koinViewModel

const val SettingsRoute = "settings"

fun NavController.navigateToSettings(navOptions: NavOptions? = null) {
    this.navigate(SettingsRoute, navOptions)
}

fun NavGraphBuilder.bindSettingsGraph(
    onLogout:() -> Unit
) {
    composable(route = SettingsRoute) {
        val settingsViewModel: SettingsViewModel = koinViewModel()
        val profileUiState: ProfileUiState by settingsViewModel.profileUiState.collectAsStateWithLifecycle()
        SettingsScreen(uiState = profileUiState, onLogout = onLogout)
    }
}