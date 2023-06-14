package com.easy.d.wallet.android.settings

import androidx.lifecycle.ViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.asStateFlow

class SettingsViewModel: ViewModel() {
    private val _profileUiState = MutableStateFlow(ProfileUiState(""))
    val profileUiState = _profileUiState.asStateFlow()
}

data class ProfileUiState(
    val email: String
)