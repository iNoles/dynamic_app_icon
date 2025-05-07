package com.github.inoles.dynamic_app_icon

import android.app.Activity
import android.content.ComponentName
import android.content.Context
import android.content.pm.PackageManager
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class DynamicAppIconPlugin : FlutterPlugin, MethodChannel.MethodCallHandler, ActivityAware {
  private lateinit var channel: MethodChannel
  private lateinit var context: Context
  private var activity: Activity? = null

  override fun onAttachedToEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    context = binding.applicationContext
    channel = MethodChannel(binding.binaryMessenger, "dynamic_app_icon")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
    when (call.method) {
      "setAlternateIcon" -> {
        val name = call.argument<String>("name")
        if (name == null) {
          setComponent("com.example.MainActivity", result) // Replace with your default activity alias
        } else {
          setComponent("com.example.MainActivity_$name", result)
        }
      }
      "supportsAlternateIcons" -> {
        result.success(true) // Android doesn't have a real check
      }
      else -> result.notImplemented()
    }
  }

  private fun setComponent(alias: String, result: MethodChannel.Result) {
    val pm = context.packageManager
    val component = ComponentName(context.packageName, alias)
    try {
      pm.setComponentEnabledSetting(
        component,
        PackageManager.COMPONENT_ENABLED_STATE_ENABLED,
        PackageManager.DONT_KILL_APP
      )
      // Disable the others (you must handle that logic per alias)
      result.success(null)
    } catch (e: Exception) {
      result.error("ICON_CHANGE_FAILED", e.localizedMessage, null)
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    activity = binding.activity
  }

  override fun onDetachedFromActivity() {}
  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {}
  override fun onDetachedFromActivityForConfigChanges() {}
}
