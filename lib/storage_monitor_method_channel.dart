import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'storage_monitor_platform_interface.dart';

/// An implementation of [StorageMonitorPlatform] that uses method channels.
class MethodChannelStorageMonitor extends StorageMonitorPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('storage_monitor');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
