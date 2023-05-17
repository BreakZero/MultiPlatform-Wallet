pluginManagement {
    includeBuild("build-logic")
    repositories {
        google()
        gradlePluginPortal()
        mavenCentral()
    }
}

dependencyResolutionManagement {
    repositories {
        google()
        mavenCentral()
        maven(uri("https://maven.pkg.github.com/trustwallet/wallet-core")) {
            credentials {
                username = userProperty().getProperty("gpr.name")
                password = userProperty().getProperty("gpr.key")
            }
        }
    }
}

fun userProperty(): java.util.Properties {
    val properties = java.util.Properties()
    val localProperties = File("./locals", "github_token.properties")

    if (localProperties.isFile) {
        java.io.InputStreamReader(
            java.io.FileInputStream(localProperties)
        ).use { reader ->
            properties.load(reader)
        }
    }
    return properties
}

rootProject.name = "D-Wallet"
include(":DWallet-Android")
include(":shared:database")
include(":shared:common")
include(":shared:wallet")
