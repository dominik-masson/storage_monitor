import 'package:flutter/material.dart';
import 'package:storage_monitor/storage_monitor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double? _totalDiskSpace;
  double? _availableDiskSpace;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    double? totalDiskSpace = await StorageMonitor.getTotalDiscSpace();
    double? availableDiskSpace = await StorageMonitor.getAvailableDiscSpace();

    if (mounted) {
      setState(() {
        _totalDiskSpace = totalDiskSpace;
        _availableDiskSpace = availableDiskSpace;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              Text('Total disk space: $_totalDiskSpace KB'),
              Text('Available disk space: $_availableDiskSpace KB'),
              ElevatedButton(
                onPressed: () async {
                  double? totalDiskSpace =
                      await StorageMonitor.getTotalDiscSpace();
                  double? availableDiskSpace =
                      await StorageMonitor.getAvailableDiscSpace();

                  setState(() {
                    _totalDiskSpace = totalDiskSpace;
                    _availableDiskSpace = availableDiskSpace;
                  });
                },
                child: const Text('refresh!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
