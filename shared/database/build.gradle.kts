plugins {
    id("easy.multiplatform.library")
    id("app.cash.sqldelight") version libs.versions.sqldelight
}

kotlin {
    cocoapods {
        summary = "Some description for the Shared Module"
        homepage = "Link to the Shared Module homepage"
        version = "1.0"
        ios.deploymentTarget = "14.1"
        framework {
            baseName = "database"
        }
    }

    sourceSets {
        getByName("commonMain") {
            dependencies {
                implementation(libs.sqldelight.coroutines)
                implementation(project(":shared:model"))
            }
        }
        getByName("androidMain") {
            dependencies {
                implementation(libs.sqldelight.android)
            }
        }
        getByName("iosMain") {
            dependencies {
                implementation(libs.sqldelight.native)
            }
        }
    }
}

android {
    namespace = "com.easy.core.database"
}

sqldelight {
    databases {
        create("EasyDatabase") {
            packageName.set("com.easy.core.database")
        }
    }
    linkSqlite.set(true)
}
