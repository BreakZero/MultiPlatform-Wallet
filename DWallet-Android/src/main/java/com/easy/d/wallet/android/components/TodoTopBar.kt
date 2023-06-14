package com.easy.d.wallet.android.components

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.MaterialTheme
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.easy.d.wallet.android.R

@Composable
fun TodoTopBar(
    modifier: Modifier = Modifier,
    tint: Color,
    onSettingsClick: () -> Unit = {}
) {
    Row(
        modifier = modifier,
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.SpaceBetween
    ) {
        Icon(
            contentDescription = null,
            painter = painterResource(id = R.drawable.ic_todo_list),
            tint = tint
        )
        IconButton(onClick = onSettingsClick) {
            Icon(
                contentDescription = null,
                painter = painterResource(id = R.drawable.ic_settings)
            )
        }
    }
}

@Preview(showBackground = true, backgroundColor = 0xFFFFFFFF)
@Composable
fun TopBarPreview() {
    TodoTopBar(
        modifier = Modifier
            .height(48.dp)
            .padding(start = 16.dp, end = 8.dp)
            .fillMaxWidth(),
        tint = MaterialTheme.colorScheme.primary,
        onSettingsClick = {}
    )
}