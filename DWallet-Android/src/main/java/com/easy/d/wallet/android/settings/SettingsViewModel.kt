package com.easy.d.wallet.android.settings

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.easy.core.database.DatabaseWrapper
import com.easy.model.UserProfile
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.filterNotNull
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.flow.stateIn

class SettingsViewModel(databaseWrapper: DatabaseWrapper): ViewModel() {
    val profileUiState = databaseWrapper.findUser().filterNotNull().map {
        ProfileUiState(userProfile = it)
    }.stateIn(viewModelScope, SharingStarted.WhileSubscribed(2000), ProfileUiState(userProfile = UserProfile.EMPTY))
}

data class ProfileUiState(
    val userProfile: UserProfile
)