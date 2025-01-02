import 'package:flutter/services.dart';

class CallerService {
  static const platform = MethodChannel('caller_detector_channel');

  Future<String?> getCallerName(String phoneNumber) async {
    try {
      final String? callerName = await platform.invokeMethod(
        'getCallerName',
        {'phoneNumber': phoneNumber},
      );
      return callerName ?? 'Unknown';
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }
}
