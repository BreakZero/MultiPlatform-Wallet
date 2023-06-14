package com.easy.d.wallet.android.settings

import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Button
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.easy.d.wallet.android.R
import com.easy.d.wallet.android.components.TodoTopBar


@Composable
fun SettingsScreen(
    uiState: ProfileUiState,
    logout: () -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxSize()
    ) {
        TodoTopBar(
            modifier = Modifier
                .height(58.dp)
                .fillMaxWidth()
                .padding(start = 16.dp, end = 8.dp),
            tint = MaterialTheme.colorScheme.primary
        )
        Box(
            modifier = Modifier
                .weight(1f)
                .fillMaxWidth(),
            contentAlignment = Alignment.Center
        ) {
            Image(painter = painterResource(id = R.drawable.img_rafiki), contentDescription = null)
        }
        ProfileInformation(
            modifier = Modifier.height(48.dp),
            label = "Full Name",
            value = "Dougie Lu"
        )
        ProfileInformation(
            modifier = Modifier.height(48.dp),
            label = "Email",
            value = "dejin.po@gmail.com"
        )
        ProfileInformation(
            modifier = Modifier.height(48.dp),
            label = "Password",
            value = "******"
        )
        Spacer(modifier = Modifier.height(24.dp))
        Button(
            modifier = Modifier.fillMaxWidth().padding(horizontal = 16.dp),
            onClick = { /*TODO*/ }
        ) {
            Text("LOG OUT")
        }
        Spacer(modifier = Modifier.height(32.dp))
    }
}

@Composable
private fun ProfileInformation(
    modifier: Modifier = Modifier,
    label: String,
    value: String
) {
    Row(
        modifier = modifier.fillMaxWidth().padding(horizontal = 16.dp),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.SpaceBetween
    ) {
        Text(
            fontSize = MaterialTheme.typography.bodyMedium.fontSize,
            fontWeight = MaterialTheme.typography.bodyMedium.fontWeight,
            fontFamily = MaterialTheme.typography.bodyMedium.fontFamily,
            color = MaterialTheme.colorScheme.tertiary,
            text = label
        )
        Text(
            text = value,
            fontSize = MaterialTheme.typography.bodyMedium.fontSize,
            fontWeight = MaterialTheme.typography.bodyMedium.fontWeight,
            fontFamily = MaterialTheme.typography.bodyMedium.fontFamily,
            color = MaterialTheme.colorScheme.primary
        )
    }
}

@Preview(showBackground = true, backgroundColor = 0xFFFFFFFF, heightDp = 56)
@Composable
fun ProfileInformationPreview() {
    Box(modifier = Modifier.fillMaxSize(), contentAlignment = Alignment.Center) {
        ProfileInformation(label = "Email", value = "dekajdkl@qq.com")
    }
}

@Preview(showBackground = true, backgroundColor = 0xFFFFFFFF)
@Composable
fun SettingsPreview() {
    SettingsScreen(uiState = ProfileUiState("")) {

    }
}