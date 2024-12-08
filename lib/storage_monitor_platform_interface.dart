import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'storage_monitor_method_channel.dart';

abstract class StorageMonitorPlatform extends PlatformInterface {
  /// Constructs a StorageMonitorPlatform.
  StorageMonitorPlatform() : super(token: _token);

  static final Object _token = Object();

  static StorageMonitorPlatform _instance = MethodChannelStorageMonitor();

  /// The default instance of [StorageMonitorPlatform] to use.
  ///
  /// Defaults to [MethodChannelStorageMonitor].
  static StorageMonitorPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [StorageMonitorPlatform] when
  /// they register themselves.
  static set instance(StorageMonitorPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
