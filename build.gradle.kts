plugins {
    //trick: for the same plugin versions in all sub-modules
    id("com.android.application").version("8.1.0-beta05").apply(false)
    id("com.android.library").version("8.1.0-beta05").apply(false)
    kotlin("android").version(libs.versions.kotlin).apply(false)
    kotlin("multiplatform").version(libs.versions.kotlin).apply(false)
}

tasks.register("clean", Delete::class) {
    delete(rootProject.buildDir)
}
