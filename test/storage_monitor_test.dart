import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:storage_monitor/storage_monitor.dart';
import 'package:storage_monitor/storage_monitor_method_channel.dart';
import 'package:storage_monitor/storage_monitor_platform_interface.dart';

class MockStorageMonitorPlatform
    with MockPlatformInterfaceMixin
    implements StorageMonitorPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final StorageMonitorPlatform initialPlatform =
      StorageMonitorPlatform.instance;

  test('$MethodChannelStorageMonitor is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelStorageMonitor>());
  });

  test('getPlatformVersion', () async {
    StorageMonitor storageMonitorPlugin = StorageMonitor();
    MockStorageMonitorPlatform fakePlatform = MockStorageMonitorPlatform();
    StorageMonitorPlatform.instance = fakePlatform;

    expect(await storageMonitorPlugin.getPlatformVersion(), '42');
  });
}
