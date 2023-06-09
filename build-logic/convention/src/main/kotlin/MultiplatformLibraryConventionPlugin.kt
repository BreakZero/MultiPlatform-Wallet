import com.android.build.api.variant.LibraryAndroidComponentsExtension
import com.android.build.gradle.LibraryExtension
import com.easy.defi.configureFlavors
import com.easy.defi.configurePrintApksTask
import org.gradle.api.JavaVersion
import org.gradle.api.Plugin
import org.gradle.api.Project
import org.gradle.api.artifacts.VersionCatalogsExtension
import org.gradle.kotlin.dsl.configure
import org.gradle.kotlin.dsl.dependencies
import org.gradle.kotlin.dsl.getByType
import org.jetbrains.kotlin.gradle.dsl.KotlinMultiplatformExtension

class MultiplatformLibraryConventionPlugin : Plugin<Project> {
  override fun apply(target: Project) {
    with(target) {
      with(pluginManager) {
        apply("com.android.library")
        apply("org.jetbrains.kotlin.multiplatform")
        apply("org.jetbrains.kotlin.native.cocoapods")
      }

      extensions.configure<LibraryExtension> {
        compileSdk = AndroidBuildConfig.compileSdkVersion
        defaultConfig.targetSdk = AndroidBuildConfig.targetSdkVersion
        defaultConfig.minSdk = AndroidBuildConfig.minSdkVersion
        configureFlavors(this)
      }
      extensions.configure<LibraryAndroidComponentsExtension> {
        configurePrintApksTask(this)
      }
      val libs = extensions.getByType<VersionCatalogsExtension>().named("libs")
      extensions.configure<KotlinMultiplatformExtension> {
        jvmToolchain(17)
        android {
          compilations.all {
            kotlinOptions {
              jvmTarget = JavaVersion.VERSION_17.toString()
            }
          }
        }
        iosX64()
        iosArm64()
        iosSimulatorArm64()

        val commonMain = sourceSets.getByName("commonMain") {
          dependencies {
            implementation(libs.findLibrary("koin.core").get())
          }
        }
        val commonTest  = sourceSets.getByName("commonTest")
        val androidMain  = sourceSets.getByName("androidMain")
        val androidUnitTest  = sourceSets.getByName("androidUnitTest")
        val iosX64Main  = sourceSets.getByName("iosX64Main")
        val iosArm64Main  = sourceSets.getByName("iosArm64Main")
        val iosSimulatorArm64Main  = sourceSets.getByName("iosSimulatorArm64Main")
        sourceSets.create("iosMain") {
          dependsOn(commonMain)
          iosX64Main.dependsOn(this)
          iosArm64Main.dependsOn(this)
          iosSimulatorArm64Main.dependsOn(this)
        }
        val iosX64Test = sourceSets.getByName("iosX64Test")
        val iosArm64Test = sourceSets.getByName("iosArm64Test")
        val iosSimulatorArm64Test = sourceSets.getByName("iosSimulatorArm64Test")
        val iosTest = sourceSets.create("iosTest") {
          dependsOn(commonTest)
          iosX64Test.dependsOn(this)
          iosArm64Test.dependsOn(this)
          iosSimulatorArm64Test.dependsOn(this)
        }

//        configure<CocoapodsExtension> {
//          summary = "Some description for the Sub Module"
//          homepage = "Link to the Shared Module homepage"
//          version = "1.0.0"
//          ios.deploymentTarget = "14.1"
//        }
      }

      configurations.configureEach {
        resolutionStrategy {
          force(libs.findLibrary("junit4").get())
          // Temporary workaround for https://issuetracker.google.com/174733673
          force("org.objenesis:objenesis:2.6")
        }
      }
    }
  }
}
