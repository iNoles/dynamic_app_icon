import Flutter
import UIKit

public class DynamicAppIconPlugin: NSObject, FlutterPlugin {
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "dynamic_app_icon", binaryMessenger: registrar.messenger())
        let instance = DynamicAppIconPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "supportsAlternateIcons":
            result(UIApplication.shared.supportsAlternateIcons)
            
        case "setAlternateIcon":
            if let args = call.arguments as? [String: Any],
               let iconName = args["name"] as? String {
                // Here, we directly cast iconName to a String
                UIApplication.shared.setAlternateIconName(iconName) { error in
                    if let error = error {
                        result(FlutterError(code: "ICON_CHANGE_FAILED", message: error.localizedDescription, details: nil))
                    } else {
                        result(nil)
                    }
                }
            } else {
                result(FlutterError(code: "INVALID_ARGUMENT", message: "Missing or invalid icon name", details: nil))
            }
            
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}
