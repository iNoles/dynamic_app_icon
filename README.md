# Dynamic App Icon Flutter Plugin

This Flutter plugin enables dynamic app icon switching on both **iOS** and **Android** without bundling any default icons. Developers are responsible for defining alternate icons in the native layers of their applications.

## Features
- 🔄 Switch launcher icons dynamically
- ✅ Supports iOS (via `Info.plist` alternate icons)
- ✅ Supports Android (via `activity-alias` components)
- ❌ Does not include any icons by default

---

## Getting Started

### 1. Install
```yaml
dependencies:
  dynamic_app_icon:
    git:
      url: https://github.com/iNoles/dynamic_app_icon.git
```

---

## Platform Setup

### 📱 iOS Setup
1. Open `ios/Runner/Info.plist`
2. Add alternate icons:
```xml
<key>CFBundleIcons</key>
<dict>
  <key>CFBundleAlternateIcons</key>
  <dict>
    <key>Halloween</key>
    <dict>
      <key>CFBundleIconFiles</key>
      <array>
        <string>AppIcon-Halloween</string>
      </array>
      <key>UIPrerenderedIcon</key>
      <false/>
    </dict>
  </dict>
</dict>
```
3. Add icons under `Assets.xcassets/AppIcon-Halloween.appiconset`

---

### 🤖 Android Setup
1. In `AndroidManifest.xml`, define `activity-alias` entries:
```xml
<activity-alias
  android:name=".LauncherHalloween"
  android:enabled="false"
  android:exported="true"
  android:targetActivity=".MainActivity"
  android:icon="@drawable/ic_halloween"
  android:label="@string/app_name">
  <intent-filter>
    <action android:name="android.intent.action.MAIN" />
    <category android:name="android.intent.category.LAUNCHER" />
  </intent-filter>
</activity-alias>
```
2. Place icons in the appropriate `res/drawable` folders.

---

## Usage

```dart
final icon = DynamicAppIcon();

// Check if supported
final isSupported = await DynamicAppIcon.supportsAlternateIcons();
  if (isSupported) {
    await icon.setAlternateIconName("Halloween"); // iOS
    await icon.setAlternateIconName("com.yourpackage.LauncherHalloween"); // Android
}

// Reset to default icon
await icon.resetToDefaultIcon();
```

---

## Notes
- This plugin does not include or define any icons.
- You are responsible for managing aliases and icon assets.
- On Android, you may need to **disable the previously enabled alias** manually.

---