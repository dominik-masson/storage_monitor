package com.storagemonitor.storage_monitor

import android.os.Environment
import android.os.StatFs
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result


/** StorageMonitorPlugin */
class StorageMonitorPlugin : FlutterPlugin, MethodCallHandler {
    private lateinit var channel: MethodChannel

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "storage_monitor")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            "getAvailableDiscSpace" -> result.success(getAvailableDiscSpace())
            "getTotalDiskSpace" -> result.success(getTotalDiskSpace())
            "getPlatformVersion" -> result.success("Android ${android.os.Build.VERSION.RELEASE}")
            else -> result.notImplemented()
        }
    }

    private fun getAvailableDiscSpace(): Double {
        val statFs = StatFs(Environment.getExternalStorageDirectory().path)

        val availableBlocks = statFs.blockSizeLong * statFs.availableBlocksLong

        return (availableBlocks / 1024f).toDouble()
    }

    private fun getTotalDiskSpace(): Double {
        val statFs = StatFs(Environment.getExternalStorageDirectory().path)

        val totalBlocks = statFs.blockCountLong * statFs.blockSizeLong

        return (totalBlocks / 1024f).toDouble()
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
