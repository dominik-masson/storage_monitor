import 'package:flutter/services.dart';

import 'storage_monitor_platform_interface.dart';

class StorageMonitor {
  static const MethodChannel _channel = MethodChannel('storage_monitor');

  Future<String?> getPlatformVersion() {
    return StorageMonitorPlatform.instance.getPlatformVersion();
  }

  /// Returns the amount of free disk space (in KB) on the device.
  ///
  /// This is a static method and can be called directly on the `StorageMonitorPlugin` class.
  static Future<double?> getAvailableDiscSpace() async {
    final double? freeDiskSpace =
        await _channel.invokeMethod('getAvailableDiscSpace');
    return freeDiskSpace;
  }

  /// Returns the total amount of disk space (in KB) on the device.
  ///
  /// This is a static method and can be called directly on the `StorageMonitor` class.
  static Future<double?> getTotalDiscSpace() async {
    final double? totalDiskSpace =
        await _channel.invokeMethod('getTotalDiskSpace');
    return totalDiskSpace;
  }
}
