package com.easy.d.wallet.android.settings

import androidx.navigation.NavController
import androidx.navigation.NavGraphBuilder
import androidx.navigation.NavOptions
import androidx.navigation.compose.composable

const val SettingsRoute = "settings"

fun NavController.navigateToSettings(navOptions: NavOptions? = null) {
    this.navigate(SettingsRoute, navOptions)
}

fun NavGraphBuilder.bindSettingsGraph() {
    composable(route = SettingsRoute) {
        SettingsScreen(uiState = ProfileUiState("")) {

        }
    }
}