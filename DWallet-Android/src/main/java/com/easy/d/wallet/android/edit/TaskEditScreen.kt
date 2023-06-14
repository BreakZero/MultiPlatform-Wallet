package com.easy.d.wallet.android.edit

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.AccessTime
import androidx.compose.material.icons.filled.ArrowBackIosNew
import androidx.compose.material3.Button
import androidx.compose.material3.DatePicker
import androidx.compose.material3.DatePickerDialog
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.material3.rememberDatePickerState
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.easy.d.wallet.android.utils.AccentColor
import com.easy.d.wallet.android.utils.toDate

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun TaskEditScreen(
    uiState: TaskEditUiState,
    onTitleChanged: (String) -> Unit,
    onDescriptionChanged: (String) -> Unit,
    onDeadlineChanged: (Long) -> Unit,
    onAccentColorChanged: (Long) -> Unit,
    onSave: () -> Unit,
    popBack: () -> Unit
) {
    var showDatePicker by rememberSaveable { mutableStateOf(false) }
    val datePickerState = rememberDatePickerState()
    Box(modifier = Modifier.fillMaxWidth()) {
        if (showDatePicker) {
            DatePickerDialog(
                onDismissRequest = { showDatePicker = false },
                confirmButton = {
                    TextButton(onClick = {
                        showDatePicker = false
                        datePickerState.selectedDateMillis?.run(onDeadlineChanged)
                    }) {
                        Text("Ok")
                    }
                },
                dismissButton = {
                    TextButton(onClick = { showDatePicker = false }) {
                        Text("Cancel")
                    }
                }
            ) {
                DatePicker(state = datePickerState)
            }
        }

        Column(
            modifier = Modifier
                .fillMaxSize()
        ) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                IconButton(onClick = popBack) {
                    Icon(imageVector = Icons.Default.ArrowBackIosNew, contentDescription = null)
                }
            }
            Column(
                modifier = Modifier.weight(1f).padding(horizontal = 16.dp)
            ) {
                OutlinedTextField(
                    modifier = Modifier.fillMaxWidth(),
                    value = uiState.title,
                    onValueChange = onTitleChanged
                )
                Spacer(modifier = Modifier.height(12.dp))
                OutlinedTextField(
                    modifier = Modifier
                        .fillMaxWidth()
                        .weight(1f),
                    value = uiState.description,
                    onValueChange = onDescriptionChanged
                )
                Spacer(modifier = Modifier.height(12.dp))
                OutlinedTextField(
                    modifier = Modifier.fillMaxWidth(),
                    value = uiState.deadline.toDate(),
                    onValueChange = {},
                    enabled = false,
                    trailingIcon = {
                        IconButton(onClick = {
                            showDatePicker = true
                        }) {
                            Icon(imageVector = Icons.Default.AccessTime, contentDescription = null)
                        }
                    }
                )
                Spacer(modifier = Modifier.height(12.dp))
                ColorGroup(
                    modifier = Modifier.fillMaxWidth(),
                    colors = AccentColor.values().map { it.color },
                    selected = uiState.accentColor,
                    onSelected = onAccentColorChanged
                )
                Spacer(modifier = Modifier.height(12.dp))
                Button(
                    modifier = Modifier.fillMaxWidth(),
                    onClick = {
                        if (uiState.isValid()) {
                            onSave()
                        }
                    }
                ) {
                    Text(text = "ADD TODO")
                }
                Spacer(modifier = Modifier.height(24.dp))
            }
        }
    }
}

@Composable
private fun ColorGroup(
    modifier: Modifier = Modifier,
    colors: List<Long>,
    selected: Long,
    onSelected: (Long) -> Unit
) {
    Row(modifier = modifier, horizontalArrangement = Arrangement.Center) {
        colors.forEach {
            Box(
                modifier = Modifier
                    .padding(4.dp)
                    .border(
                        1.dp,
                        if (selected == it) Color.Blue else Color.Gray,
                        RoundedCornerShape(2.dp)
                    )
                    .clickable {
                        onSelected(it)
                    }
            ) {
                Box(
                    modifier = Modifier
                        .padding(4.dp)
                        .size(24.dp)
                        .background(Color(it), RoundedCornerShape(0f))
                )
            }
        }
    }
}

@Preview(showBackground = false, backgroundColor = 0xFF6200EE)
@Composable
fun ColorGroupPreview() {
    val (selected, onSelected) = remember {
        mutableStateOf(0xFF654321)
    }
    ColorGroup(
        modifier = Modifier.fillMaxWidth(),
        colors = listOf(0xFF123456, 0xFF654321, 0xFF327876),
        selected = selected,
        onSelected = onSelected
    )
}

@Preview(showBackground = false, backgroundColor = 0xFF6200EE)
@Composable
fun EditTaskPreview() {
    TaskEditScreen(uiState = TaskEditUiState(
        "",
        "",
        -1L, -1L
    ), {}, {},
        { _ -> },
        {}, {}, {})
}
