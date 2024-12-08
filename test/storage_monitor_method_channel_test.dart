import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:storage_monitor/storage_monitor_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelStorageMonitor platform = MethodChannelStorageMonitor();
  const MethodChannel channel = MethodChannel('storage_monitor');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
