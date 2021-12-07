import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keychain_plugin/keychain_plugin.dart';

void main() {
  const MethodChannel channel = MethodChannel('keychain_plugin');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await KeychainPlugin.platformVersion, '42');
  });
}
