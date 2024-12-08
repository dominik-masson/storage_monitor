# storage_monitor

A Flutter package that provides an easy way to get disk space information on Android devices.

## Description
This package allows you to get the following information about the device's disk space:

- Available disk space
- Total disk space

## Usage
```dart
import 'package:storage_monitor/storage_monitor.dart';

void main() async {
  double? totalDiskSpace = await StorageMonitor.getTotalDiscSpace();
  print('Total disk space: $_totalDiskSpace KB');
  
  double? availableDiskSpace = await StorageMonitor.getAvailableDiscSpace();
  print('Total disk space: $availableDiskSpace KB');
}
```

## License
This project is licensed under the [MIT](LICENSE)