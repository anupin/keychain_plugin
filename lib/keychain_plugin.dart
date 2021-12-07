
import 'dart:async';

import 'package:flutter/services.dart';

class KeychainPlugin {
  static const MethodChannel _channel = MethodChannel('keychain_plugin');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String?> setKeychainValue(String username, String password, String server) async {
    final String? version = await _channel.invokeMethod('setKeychainValue', {"username":username,"password":password, "server": server});
    return version;
  }

  static Future<String?> getKeychainValue(String username, String server) async {
    final String? version = await _channel.invokeMethod('getKeychainValue', {'username':username, "server": server});
    return version;
  }
}
