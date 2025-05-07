import 'package:flutter/services.dart';

class DynamicAppIcon {
  static const MethodChannel _channel = MethodChannel('dynamic_app_icon');

  /// Checks whether the platform supports alternate icons.
  static Future<bool> supportsAlternateIcons() async {
    final result = await _channel.invokeMethod<bool>('supportsAlternateIcons');
    return result ?? false;
  }

  /// Sets the app's alternate icon by name.
  /// For iOS: the name must match an entry in Info.plist.
  /// For Android: the name corresponds to an activity alias.
  static Future<void> setAlternateIconName(String iconName) async {
    await _channel.invokeMethod('setAlternateIcon', {'name': iconName});
  }

  /// Resets the app icon to the default.
  static Future<void> resetToDefaultIcon() async {
    await _channel.invokeMethod('setAlternateIcon', {'name': null});
  }
}
