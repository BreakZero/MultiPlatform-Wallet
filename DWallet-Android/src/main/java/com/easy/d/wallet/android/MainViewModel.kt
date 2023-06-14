package com.easy.d.wallet.android

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.easy.core.database.DatabaseWrapper
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.flow.stateIn

class MainViewModel(databaseWrapper: DatabaseWrapper) : ViewModel() {
    val hasLogin = databaseWrapper.findUser()
        .map {
            it != null
        }.stateIn(viewModelScope, SharingStarted.WhileSubscribed(2000), false)
}