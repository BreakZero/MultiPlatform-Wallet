package com.easy.d.wallet.android.di

import com.easy.d.wallet.android.todo.ToDoListViewModel
import org.koin.androidx.viewmodel.dsl.viewModelOf
import org.koin.dsl.module

val featureModules = module {
    viewModelOf(::ToDoListViewModel)
}