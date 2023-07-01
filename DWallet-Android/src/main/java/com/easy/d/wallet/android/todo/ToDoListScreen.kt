package com.easy.d.wallet.android.todo

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Add
import androidx.compose.material3.Card
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.FloatingActionButton
import androidx.compose.material3.Icon
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.easy.d.wallet.android.R
import com.easy.d.wallet.android.components.TodoTopBar
import com.easy.d.wallet.android.utils.toDate
import com.easy.model.TODOTask

@Composable
fun ToDoListScreen(
    listUiState: ToDoListUiState,
    onSettingsClick: () -> Unit,
    onItemClick: (TODOTask) -> Unit,
    onAddTask: () -> Unit
) {
    Scaffold(
        topBar = {
            TodoTopBar(
                modifier = Modifier
                    .height(58.dp)
                    .fillMaxWidth()
                    .padding(start = 16.dp, end = 8.dp),
                tint = MaterialTheme.colorScheme.primary,
                onSettingsClick = onSettingsClick
            )
        },
        floatingActionButton = {
            FloatingActionButton(onClick = onAddTask, shape = MaterialTheme.shapes.extraLarge) {
                Icon(imageVector = Icons.Default.Add, contentDescription = null)
            }
        }
    ) {
        LazyColumn(
            modifier = Modifier
                .fillMaxWidth()
                .padding(horizontal = 16.dp)
                .padding(it),
            verticalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            item {
                ToDoListFilter(
                    tint = MaterialTheme.colorScheme.primary,
                    onResult = {}
                )
            }
            items(items = listUiState.todoList, key = {
                it.id
            }) {
                ToDoItemView(toDoTask = it, onItemClick = onItemClick)
            }
            item { Spacer(modifier = Modifier.height(24.dp)) }
        }
    }
}

@Composable
private fun ToDoListFilter(
    modifier: Modifier = Modifier,
    tint: Color,
    onResult: (String) -> Unit
) {
    Row(
        modifier = modifier,
        verticalAlignment = Alignment.CenterVertically
    ) {
        Icon(
            painter = painterResource(id = R.drawable.ic_menu),
            contentDescription = null,
            tint = tint
        )
        Text(
            modifier = Modifier.padding(start = 8.dp),
            text = "LIST OF TODO",
            fontSize = MaterialTheme.typography.titleLarge.fontSize,
            fontWeight = MaterialTheme.typography.titleLarge.fontWeight,
            fontFamily = MaterialTheme.typography.titleLarge.fontFamily,
            color = MaterialTheme.colorScheme.primary
        )
        Spacer(modifier = Modifier.weight(1f))
        Icon(
            painter = painterResource(id = R.drawable.ic_filter),
            tint = tint,
            contentDescription = null
        )
    }
}

@Composable
private fun ToDoItemView(
    modifier: Modifier = Modifier,
    onItemClick: (TODOTask) -> Unit,
    toDoTask: TODOTask
) {
    Card(
        modifier = modifier.clickable { onItemClick(toDoTask) },
        shape = RoundedCornerShape(12.dp),
        colors = CardDefaults.cardColors(containerColor = Color(toDoTask.accentColor))
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(8.dp)
        ) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                Text(
                    text = toDoTask.title,
                    fontSize = MaterialTheme.typography.titleMedium.fontSize,
                    fontWeight = MaterialTheme.typography.titleMedium.fontWeight,
                    fontFamily = MaterialTheme.typography.titleMedium.fontFamily,
                    color = MaterialTheme.colorScheme.onPrimary
                )
                if (toDoTask.inProgress()) {
                    Icon(
                        painter = painterResource(id = R.drawable.ic_clock),
                        tint = MaterialTheme.colorScheme.onPrimaryContainer,
                        contentDescription = null
                    )
                }
            }
            Text(
                text = toDoTask.description,
                maxLines = 3,
                fontSize = MaterialTheme.typography.bodyMedium.fontSize,
                fontWeight = MaterialTheme.typography.bodyMedium.fontWeight,
                fontFamily = MaterialTheme.typography.bodyMedium.fontFamily,
                color = MaterialTheme.colorScheme.onPrimary
            )
            Text(
                text = toDoTask.createAt.toDate(),
                fontSize = MaterialTheme.typography.bodySmall.fontSize,
                fontWeight = MaterialTheme.typography.bodySmall.fontWeight,
                fontFamily = MaterialTheme.typography.bodySmall.fontFamily,
                color = MaterialTheme.colorScheme.onPrimary
            )
        }
    }
}


@Preview(showBackground = true, backgroundColor = 0xFFFFFFFF)
@Composable
fun TaskItemViewPreview() {
    ToDoItemView(
        modifier = Modifier.fillMaxWidth(),
        onItemClick = {},
        toDoTask = TODOTask(
            id = 0L,
            title = "Design Logo",
            accentColor = 0xFF123321L,
            description = "",
            deadline = 0x111L,
            createAt = 0x111L
        )
    )
}

@Preview(showBackground = true, backgroundColor = 0xFFFFFFFF, heightDp = 64)
@Composable
fun ToDoFilterPreview() {
    ToDoListFilter(
        modifier = Modifier.fillMaxWidth(),
        tint = MaterialTheme.colorScheme.primary,
        onResult = {}
    )
}

@Preview(showBackground = true, backgroundColor = 0xFFFFFFFF)
@Composable
fun ToDoListPreview() {
    ToDoListScreen(
        listUiState = ToDoListUiState(
            (1..12).map {
                TODOTask(
                    id = it.toLong(),
                    title = "Design Logo",
                    accentColor = 0xFFF79E89,
                    description = "",
                    deadline = 0x111L,
                    createAt = 0x111L
                )
            }
        ),
        {},
        {},
        {}
    )
}