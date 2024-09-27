# Legal Mentors Network Frontend

The LMN Flutter app connects law professionals with students and graduates, featuring swipe-based matchmaking and instant messaging.

## Getting Started

To get started with the app:

1. **Install Dependencies**
  ```
  flutter pub get
  ```

2. **Run the app**
 ```
   flutter run
  ```

## Depdencies

**Image Picker IOS**

Add the following keys to your Info.plist file, located in <project root>/ios/Runner/Info.plist:

* NSPhotoLibraryUsageDescription - describe why your app needs permission for the photo library. This is called Privacy - Photo Library Usage Description in the visual editor.
    * This permission will not be requested if you always pass false for requestFullMetadata, but App Store policy requires including the plist entry.
* NSCameraUsageDescription - describe why your app needs access to the camera. This is called Privacy - Camera Usage Description in the visual editor.
* NSMicrophoneUsageDescription - describe why your app needs access to the microphone, if you intend to record videos. This is called Privacy - Microphone Usage Description in the visual editor.

**Image Picker Android**

No configuration required - the plugin should work out of the box. 