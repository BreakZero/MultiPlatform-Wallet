package com.easy.d.wallet.android.detail

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowBackIosNew
import androidx.compose.material.icons.filled.Delete
import androidx.compose.material.icons.filled.Edit
import androidx.compose.material3.BottomSheetDefaults
import androidx.compose.material3.Button
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.ModalBottomSheet
import androidx.compose.material3.Text
import androidx.compose.material3.rememberModalBottomSheetState
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.easy.d.wallet.android.utils.toDate
import com.easy.model.TODOTask

@Composable
fun TaskDetailScreen(
    uiState: TaskDetailUiState,
    onEdit: (Long) -> Unit,
    popBack: () -> Unit
) {
    var showAction by remember {
        mutableStateOf(false)
    }

    Box {
        Column(
            modifier = Modifier
                .fillMaxSize()
        ) {
            DetailActionBar(
                modifier = Modifier.fillMaxWidth(),
                onDelete = {
                    showAction = true
                },
                onEdit = { onEdit(uiState.task.id) },
                onBack = popBack
            )
            Text(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = 16.dp),
                fontSize = MaterialTheme.typography.titleLarge.fontSize,
                fontWeight = MaterialTheme.typography.titleLarge.fontWeight,
                fontFamily = MaterialTheme.typography.titleLarge.fontFamily,
                text = uiState.task.title
            )
            Text(
                modifier = Modifier
                    .fillMaxWidth()
                    .weight(1f)
                    .padding(horizontal = 16.dp, vertical = 8.dp),
                fontSize = MaterialTheme.typography.bodyMedium.fontSize,
                fontWeight = MaterialTheme.typography.bodyMedium.fontWeight,
                fontFamily = MaterialTheme.typography.bodyMedium.fontFamily,
                text = uiState.task.description
            )
            Text(
                modifier = Modifier.fillMaxWidth(),
                textAlign = TextAlign.Center,
                fontSize = MaterialTheme.typography.bodySmall.fontSize,
                fontWeight = MaterialTheme.typography.bodySmall.fontWeight,
                fontFamily = MaterialTheme.typography.bodySmall.fontFamily,
                text = "Created at ${uiState.task.createAt.toDate()}"
            )
        }
        if (showAction) {
            ActionSheet {
                showAction = false
            }
        }
    }
}


@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun ActionSheet(
    modifier: Modifier = Modifier,
    onDismiss: () -> Unit
) {
    val modalBottomSheetState = rememberModalBottomSheetState()
    ModalBottomSheet(
        modifier = modifier.fillMaxWidth(),
        sheetState = modalBottomSheetState,
        onDismissRequest = onDismiss,
        dragHandle = { BottomSheetDefaults.DragHandle() }
    ) {
        Button(
            modifier = Modifier
                .fillMaxWidth()
                .padding(horizontal = 16.dp), onClick = {
                onDismiss()
            }) {
            Text(text = "Delete TODO")
        }
        Button(
            modifier = Modifier
                .fillMaxWidth()
                .padding(horizontal = 16.dp), onClick = {
                onDismiss()
            }) {
            Text(text = "Cancel")
        }
        Spacer(modifier = Modifier.height(32.dp))
    }
}

@Composable
private fun DetailActionBar(
    modifier: Modifier = Modifier,
    onBack: () -> Unit,
    onEdit: () -> Unit,
    onDelete: () -> Unit
) {
    Row(
        modifier = modifier,
        horizontalArrangement = Arrangement.SpaceBetween
    ) {
        IconButton(onClick = onBack) {
            Icon(imageVector = Icons.Default.ArrowBackIosNew, contentDescription = null)
        }
        Row {
            IconButton(onClick = onEdit) {
                Icon(imageVector = Icons.Default.Edit, contentDescription = null)
            }
            IconButton(onClick = onDelete) {
                Icon(imageVector = Icons.Default.Delete, contentDescription = null)
            }
        }
    }
}

@Preview(showBackground = true, backgroundColor = 0xFFFFFFFF, heightDp = 64)
@Composable
fun DetailActionBarPreview() {
    Box(
        modifier = Modifier.fillMaxSize(),
        contentAlignment = Alignment.Center
    ) {
        DetailActionBar(modifier = Modifier.fillMaxWidth(), {}, {}, {})
    }
}

@Preview(showBackground = true, backgroundColor = 0xFFFFFFFF)
@Composable
fun DetailPreview() {
    TaskDetailScreen(
        uiState = TaskDetailUiState(
            task = TODOTask(
                id = 0L,
                title = "Design Logo",
                accentColor = 0xFF123321L,
                description = "",
                deadline = 0x111L,
                createAt = 0x111L
            )
        ),
        {}, {}
    )
}