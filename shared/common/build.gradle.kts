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
            baseName = "common"
            isStatic = true
        }
    }
    sourceSets {
        getByName("commonMain") {
            dependencies {
                api(project(":shared:database"))
                api(project(":shared:wallet"))
            }
        }
    }
}

android {
    namespace = "com.easy.core.common"
}
