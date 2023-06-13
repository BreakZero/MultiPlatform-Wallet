package com.easy.d.wallet.android.sign_in

import androidx.lifecycle.ViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.update
import javax.inject.Inject

class SignInViewModel: ViewModel() {
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
        println(_signInUiState.value)
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