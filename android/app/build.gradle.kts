import com.android.builder.utils.isValidZipEntryName
import java.util.Properties
import java.io.FileInputStream

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}
val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}
android {
    namespace = "com.grace.flutter_sample"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.0.12077973"//flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.grace.flutter_sample"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName

        ndk {
            // Filter for architectures supported by Flutter
            abiFilters "armeabi-v7a", "arm64-v8a", "x86_64"
        }
    }

    signingConfigs {
        create("release") {
            keyAlias = keystoreProperties["keyAlias"] as String
            keyPassword = keystoreProperties["keyPassword"] as String
            storeFile = keystoreProperties["storeFile"]?.let { file(it) }
            storePassword = keystoreProperties["storePassword"] as String
        }
    }
    buildTypes {
        release {
//            isMinifyEnabled = true
//            isShrinkResources = true
//            setProguardFiles(
//                listOf(
//                    getDefaultProguardFile("proguard-android.txt"),
//                    "proguard-rules.pro"
//                )
//            )
            signingConfig = signingConfigs.getByName("release")
        }


//        getByName("release") {
//
//        }
        getByName("debug") {
            isDebuggable = true

        }
    }
}

flutter {
    source = "../.."
}
