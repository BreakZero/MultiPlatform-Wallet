package com.easy.core.database.x

import com.easy.core.database.UserInfoEntity
import com.easy.model.UserProfile

fun UserInfoEntity.toExternalModel(): UserProfile {
    return UserProfile(
        uid = this.uid,
        fullName = this.fullName,
        email = this.email,
        password = this.password,
        createAt = this.createAt
    )
}

fun UserProfile.toEntity(): UserInfoEntity {
    return UserInfoEntity(
        uid = this.uid,
        fullName = this.fullName,
        email = this.email,
        password = this.password,
        createAt = this.createAt
    )
}