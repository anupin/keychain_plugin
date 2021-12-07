
import 'dart:async';

import 'package:flutter/services.dart';

class KeychainPlugin {
  static const MethodChannel _channel = MethodChannel('keychain_plugin');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String?> setKeychainValue(String username, String password) async {
    final String? version = await _channel.invokeMethod('setKeychainValue', {"username":username,"password":password});
    return version;
  }

  static Future<String?> getKeychainValue(String username) async {
    final String? version = await _channel.invokeMethod('getKeychainValue', {'username':username});
    return version;
  }
}
