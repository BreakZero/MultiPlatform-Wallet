package com.easy.d.wallet.android.todo

import androidx.lifecycle.ViewModel
import com.easy.model.ToDoTask

class ToDoListViewModel: ViewModel() {

}

data class ToDoListState(
    val todoList: List<ToDoTask>
)