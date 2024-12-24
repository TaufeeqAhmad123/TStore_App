# t_store

A new Flutter project.

┌──────────────────────────────────────────────────────────────────────────────────────────────────┐
|                                                                                                  |
|                                   WELCOME TO [T_Store]                                           |  
|                                                                                                  |
|    Greetings,                                                                                    |
|                                                                                                  |
|    We extend our sincere appreciation for your interest in [T_Store]. This repository            |
|    houses a robust e-commerce solution developed using the Flutter framework. Every line         |
|    of code here reflects our commitment to quality, efficiency, and scalability.                 |
|                                                                                                  |
|    We're dedicated to continuous improvement and we welcome feedback to make this                |
|    solution even more industry-leading. Dive in, explore, and let's innovate together.           |
|                                                                                                  |
|    Regards,                                                                                      |
|    Coding with T                                                                                 |
|                                                                                                  |
└──────────────────────────────────────────────────────────────────────────────────────────────────┘






# --------------  INITIALIZATION  ---------------- #

┌─── GETTING STARTED ──────────────────────────────────────────────────────────────────────────────┐
|                                                                                                  |
|    1️⃣ Initialize Packages: Begin by fetching all necessary packages.                             |
|       Execute the following in your terminal: `flutter pub get`.                                 |
|                                                                                                  |
|    2️⃣ SDK Version Check: Ensure you have the correct Dart SDK version.                           |
|       [Note]: `The current Dart SDK version is ***`.                                             |
|       [Error]: Might be `t_store requires SDK version >=3.0.5 <4.0.0`.                           |
|       This indicates version solving has failed due to a mismatch.                               |
|       [Solution]: Upgrade Flutter - To rectify SDK version mismatches and stay updated,          |
|       run: `flutter upgrade`. This command will fetch and install all the required updates.      |
|       run: `flutter upgrade --force`. For MacOS in case `flutter upgrade` not working            |
|                                                                                                  |
|    3️⃣ Lastly, ensure all dependencies are properly set.                                          |
|       Execute `flutter pub get`.                                                                 |
|       On successful completion, you're primed and ready to launch the application.               |
|                                                                                                  |
└──────────────────────────────────────────────────────────────────────────────────────────────────┘


┌─── SETUP FIREBASE ───────────────────────────────────────────────────────────────────────────────┐
|                                                                                                  |
|    1️⃣ Initialize Packages: Begin by fetching all necessary packages.                             |
|        Execute the following in your terminal: `flutter pub get`.                                |
|                                                                                                  |
|    2️⃣ Firebase Setup: Watch this tutorial to setup Firebase using CLI                            |
|        https://www.youtube.com/watch?v=fxDusoMcWj8                                               |
|                                                                                                  |
|    3️⃣ Connect Firebase Project: In the terminal run `flutterfire configure` command              |
|        [ERROR]: flutter-fire command not found                                                   |
|        [SOLUTION]: Check your Environment variables. The path is not properly added.             |
|        Next: Select your project from the list of projects and you are good to go.               |
|                                                                                                  |
|    4️⃣ Enable Firebase Services:                                                                  |  
|        In the Firebase Console, select your project.                                             |
|        Follow the steps below to enable necessary services:                                      |
|                                                                                                  |
|        Authentication:                                                                           |
|           * Click on "Authentication" in the left sidebar.                                       |
|           * Navigate to the "Sign-in method" tab.                                                |
|           * Enable the authentication methods you want (e.g., Google, Facebook, Email/Password). |
|                                                                                                  |
|        Firestore (Database):                                                                     |
|           * Click on "Firestore" in the left sidebar.                                            |
|           * Click on "Create Database" and choose the location.                                  |
|           * Select "Start in test mode" for development purposes.                                |             
|                                                                                                  |
|        Storage:                                                                                  |
|           * Click on "Storage" in the left sidebar.                                              |
|           * Click on "Get Started."                                                              |             
|           * Follow the setup instructions.                                                       |
|                                                                                                  |
|    5️⃣ Generate SHA1 and SHA256 fingerprints:                                                     |    
|        * Go to the project folder in the terminal.                                               |
|                                                                                                  |
|           **Mac:**                                                                               |     
|           keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android
|                                                                                                  |
|           **Windows:**                                                                           |
|           keytool -list -v -keystore "\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android
|                                                                                                  |
|           **Linux:**                                                                             |     
|           keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android
|                                                                                                  |
|           [WINDOWS Example]:                                                                     |
|           keytool -list -v -keystore "C:\Users\Your PC Name\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android
|           `Here You will get SHA1 and SHA256 Keys`
|                                                                                                  |
|    6️⃣ Add SHA1 and SHA256 Fingerprints to Firebase Console:                                     |
|        * Navigate to Project settings(Gear Icon in front of Project Overview)                    |             
|        * Go to General tab > Your apps.                                                          | 
|        * Select your app and navigate to the "Add fingerprints" button.                          |             
|        * Add both `SHA-1` and `SHA-256` fingerprints.                                            | 
|                                                                                                  |
|                                                                                                  |
|    ### IOS Configuration                                                                         |     
|    1️⃣ Get `Reversed_Client_ID`:                                                                  |
|        * Navigate to the root directory of the project > IOS > Runner > GoogleServices_Info.plist|         
|        * Locate the "Reversed_Client_ID" entry                                                   |     
|        * Copy the "Reversed_Client_ID"                                                           |     
|                                                                                                  |
|    2️⃣ Replace `Reversed_Client_ID` in Info.plist                                                 |    
|        * Go back to ios > Runner > Info.plist                                                    | 
|        * Find the "Google Sign-in & Facebook Sign-in Section" in `Info.plist`                    | 
|        * Replace "Reversed_Client_ID" with the value obtained from `GoogleServices_Info.plist`.  | 
|                                                                                                  |
|    **For Facebook Sign-in**                                                                      | 
|       * Find and update the values for `CFBundleURLSchemes`, `FacebookAppID`,                    | 
|          `FacebookClientToken`, and `FacebookDisplayName` in `Info.plist`.                       |         
|       * You can obtain these values from your `Facebook Developer account`.                      |  
|                                                                                                  |
└──────────────────────────────────────────────────────────────────────────────────────────────────┘



# --------------  ERRORS  ---------------- #


## ** -- PACKAGES ERRORS -- **
This contains all the possible errors that can occur while importing or using packages.

┌── Package ────────────── Detail ─────────────────────────────────────────────────────────────────┐
|   cloud_firestore     |  [ERROR]: The plugin cloud_firestore requires a higher Android SDK version
|                       |  Fix this issue by adding the following to the file
|                       |  ..\android\app\build.gradle:
|                       |  android {
|                       |    defaultConfig {
|                       |       minSdkVersion 19
|                       |    }
|                       |  }
|                       |  [SOLUTION]: You may need to update minSdkVersion to [21]
|---------------------------------------------------------------------------------------------------
|                       |  
| flutter_facebook_auth |  [ERROR]: The plugin [***] requires a higher Android SDK version.
|                       |  Fix this issue by adding the following to the file
|                       |  ..\android\app\build.gradle:
|                       |  android {
|                       |    defaultConfig {
|                       |       minSdkVersion 21
|                       |    }
|                       |  }
|                       |  [SOLUTION]: You have to update minSdkVersion to [21]
|---------------------------------------------------------------------------------------------------
|                       |  
|   firebase_storage    |  [ERROR]: [firebase_storage/firebase_storage] User does not have
|                       |  permission to access this object.
|                       |  
|                       |  [SOLUTION]: Check Firebase Storage Rules and set them to...
|                       |  allow read, write: if request.auth != null
|                       |  This rule will make sure only authenticated users can access the content
|                       |
└──────────────────────────────────────────────────────────────────────────────────────────────────┘





## ** -- GENERIC ERRORS -- **
This contains all the possible errors that can occur while designing the app.

┌─── File ──────────────── Function ─────── Detail ────────────────────────────────────────────────┐
| 1. home.dart          |  Stack        |   [ERROR]: size.isFinite': is not true.in Stack
|                       |               |   [SOLUTION]: You added CustomShapes but Stack currently 
|                       |               |   don't have any space so simply add something in Stack 
|                       |               |   or wrap it inside SizedBox with width and height and 
|                       |               |   error will be gone.
|---------------------------------------------------------------------------------------------------
| 2. THelperFunctions   | isDarkMode()  |   [ERROR]: Theme is not switching when changing from 
|                       |               |   Light to Dark or vise vera.
|                       |               |   [SOLUTION]: You have multiple context with same name so,
|                       |               |   pass the actual build context to 
|                       |               |   -> THelperFunctions.isDarkMode(context).
|---------------------------------------------------------------------------------------------------
| 3. sign_in_failed     | Google SignIn |   [ERROR]: com.google.android.gms.common.api.ApiException:
|                       |               |   [SOLUTION]: ADD SHA-1 & SHA-256 in your Firebase
|                       |               |   
└──────────────────────────────────────────────────────────────────────────────────────────────────┘
