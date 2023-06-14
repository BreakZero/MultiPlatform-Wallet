package com.easy.d.wallet.android.di

import com.easy.d.wallet.android.decoder.StringDecoder
import com.easy.d.wallet.android.decoder.UriDecoder
import com.easy.d.wallet.android.detail.TaskDetailViewModel
import com.easy.d.wallet.android.sign_in.SignInViewModel
import com.easy.d.wallet.android.todo.ToDoListViewModel
import org.koin.androidx.viewmodel.dsl.viewModelOf
import org.koin.core.module.dsl.singleOf
import org.koin.dsl.bind
import org.koin.dsl.module

val featureModules = module {
    viewModelOf(::ToDoListViewModel)
    viewModelOf(::SignInViewModel)
    viewModelOf(::TaskDetailViewModel)
}

val commonModule = module {
    singleOf(::UriDecoder) bind StringDecoder::class
}