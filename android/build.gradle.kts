import com.android.build.api.dsl.ApplicationExtension
import com.android.build.api.dsl.LibraryExtension

// Top-level build file for Android
allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(name)
    layout.buildDirectory.value(newSubprojectBuildDir)
    
    // SAFEGUARD: Only force evaluation of ':app' if we aren't currently configuring it
    if (project.name != "app") {
        evaluationDependsOn(":app")
    }

    // 1. Fix Missing Namespaces dynamically
    plugins.withId("com.android.library") {
        extensions.configure<LibraryExtension> {
            if (namespace == null) {
                namespace = "com.example.${project.name}"
            }
        }
    }

    plugins.withId("com.android.application") {
        extensions.configure<ApplicationExtension> {
            if (namespace == null) {
                namespace = "com.example.${project.name}"
            }
        }
    }

    // 2. Loop-safe: Intercept the existing manifest tasks and insert cleanups
    tasks.whenTaskAdded {
        if (name.contains("process") && name.contains("Manifest") && !name.startsWith("stripPackageAttribute")) {
            // Inject the cleanup action directly into the task before it runs
            doFirst {
                val manifestFile = file("src/main/AndroidManifest.xml")
                if (manifestFile.exists()) {
                    var text = manifestFile.readText()
                    if (text.contains("package=")) {
                        // Strip out the package="..." attribute using regex
                        text = text.replace(Regex("""package="[^"]*""""), "")
                        manifestFile.writeText(text)
                        logger.lifecycle("Successfully stripped forbidden package attribute from: ${manifestFile.path}")
                    }
                }
            }
        }
    }

    // 3. Force compileSdk to 34 for all subproject plugins (Fixes CheckAarMetadata errors)
    afterEvaluate {
        val compileSdkVersionValue = 34
        
        plugins.withId("com.android.library") {
            extensions.configure<LibraryExtension> {
                compileSdk = compileSdkVersionValue
            }
        }
        plugins.withId("com.android.application") {
            extensions.configure<ApplicationExtension> {
                compileSdk = compileSdkVersionValue
            }
        }
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}