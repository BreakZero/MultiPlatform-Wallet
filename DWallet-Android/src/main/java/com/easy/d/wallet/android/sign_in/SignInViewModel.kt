package com.easy.d.wallet.android.sign_in

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.easy.core.database.DatabaseWrapper
import com.easy.model.UserProfile
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch
import kotlin.random.Random

class SignInViewModel(
    val databaseWrapper: DatabaseWrapper
) : ViewModel() {
    private val _signInUiState = MutableStateFlow(SignInUiState())
    val signInUiState = _signInUiState.asStateFlow()

    fun emailChanged(content: String) {
        _signInUiState.update {
            it.copy(email = content)
        }
    }

    fun passwordChanged(content: String) {
        _signInUiState.update {
            it.copy(password = content)
        }
    }

    fun signIn() {
        viewModelScope.launch(Dispatchers.IO) {
            databaseWrapper.insertUser(
                UserProfile(
                    uid = Random.nextLong(),
                    fullName = "Dougie Lu",
                    email = _signInUiState.value.email,
                    password = _signInUiState.value.password,
                    createAt = 0L
                )
            )
        }
    }

    fun signInWithGoogle() {
        println(_signInUiState.value)
    }
}

data class SignInUiState(
    val email: String = "",
    val password: String = "",
    val errorMessage: String? = null
) {
    fun isActive(): Boolean {
        return email.isNotBlank() && password.isNotBlank()
    }
}