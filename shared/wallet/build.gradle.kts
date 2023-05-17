plugins {
    id("easy.multiplatform.library")
}

kotlin {
    cocoapods {
        summary = "Some description for the Shared Module"
        homepage = "Link to the Shared Module homepage"
        version = "1.0"
        ios.deploymentTarget = "14.1"
        dependencies {
            pod("TrustWalletCore", moduleName = "WalletCore")
        }
        podfile = project.file("../../DWallet-iOS/Podfile")
        framework {
            baseName = "wallet"
        }
    }

    sourceSets {
        val commonMain by getting {
            dependencies {
                implementation("com.trustwallet:wallet-core-kotlin:3.1.34")
            }
        }
    }
}

android {
    namespace = "com.easy.wallet"
}