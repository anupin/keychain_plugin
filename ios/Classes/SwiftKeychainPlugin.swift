import Flutter
import UIKit
import Security

public class SwiftKeychainPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "keychain_plugin", binaryMessenger: registrar.messenger())
    let instance = SwiftKeychainPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if (call.method == "getPlatformVersion") {
        result("TEST iOS " + UIDevice.current.systemVersion)
    }else if(call.method == "setKeychainValue") {
        guard let args = call.arguments as? [String : Any] else {return}
        let username = args["username"] as! String
        let password = args["password"] as! String
        let keychainItem = [
          kSecValueData: "\(password)".data(using: .utf8)!,
          kSecAttrAccount: "\(username)",
          kSecAttrServer: "tt.com",
          kSecClass: kSecClassInternetPassword,
          kSecReturnAttributes: true
        ] as CFDictionary

        let status = SecItemAdd(keychainItem, nil)
        print("Operation finished with status: \(status)")
        result("Operation finished with status: \(status)")
    }else if(call.method == "getKeychainValue") {
        guard let args = call.arguments as? [String : Any] else {return}
        let username = args["username"] as! String

        let query = [
          kSecClass: kSecClassInternetPassword,
          kSecAttrAccount: "\(username)",
          kSecAttrServer: "tt.com",
          kSecReturnAttributes: true,
          kSecReturnData: true
        ] as CFDictionary

        var r: AnyObject?
        let status = SecItemCopyMatching(query, &r)

        print("Operation finished with status: \(status)")
        let dic = r as! NSDictionary

        let user = dic[kSecAttrAccount] ?? ""
        let passwordData = dic[kSecValueData] as! Data
        let password = String(data: passwordData, encoding: .utf8)!
        print("Username: \(user)")
        //print("Password: \(password)")
        result("\(password)")
    }
  }
}
