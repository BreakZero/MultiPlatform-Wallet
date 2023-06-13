package com.easy.d.wallet.android.sign_in

import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material3.Button
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.easy.d.wallet.android.R

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun SignInScreen(
    uiState: SignInUiState,
    emailChanged: (String) -> Unit,
    passwordChanged: (String) -> Unit,
    signIn: () -> Unit,
    signInWithGoogle: () -> Unit
) {
    Column(modifier = Modifier.fillMaxSize()) {
        Box(
            modifier = Modifier
                .fillMaxWidth()
                .weight(1f),
            contentAlignment = Alignment.Center
        ) {
            Image(painter = painterResource(id = R.drawable.ic_logo), contentDescription = null)
        }

        OutlinedTextField(
            modifier = Modifier
                .padding(horizontal = 16.dp)
                .fillMaxWidth(),
            value = uiState.email,
            onValueChange = emailChanged
        )
        Spacer(modifier = Modifier.height(12.dp))
        OutlinedTextField(
            modifier = Modifier
                .padding(horizontal = 16.dp)
                .fillMaxWidth(),
            value = uiState.password,
            onValueChange = passwordChanged,
            keyboardOptions = KeyboardOptions.Default.copy(keyboardType = KeyboardType.Password)
        )
        Spacer(modifier = Modifier.height(24.dp))
        Button(
            modifier = Modifier
                .padding(horizontal = 16.dp)
                .fillMaxWidth(),
            enabled = uiState.isActive(),
            onClick = signIn
        ) {
            Text(text = "SIGN IN")
        }
        Spacer(modifier = Modifier.height(12.dp))
        Button(
            modifier = Modifier
                .padding(horizontal = 16.dp)
                .fillMaxWidth(),
            onClick = signInWithGoogle
        ) {
            Text(text = "SIGN IN WITH GOOGLE")
        }
        Spacer(modifier = Modifier.height(32.dp))
    }
}

@Preview(showBackground = true, backgroundColor = 0xFFFFFFFF)
@Composable
fun SignInPreview() {
    SignInScreen(uiState = SignInUiState(), {}, {}, {}, {})
}