#import "KeychainPlugin.h"
#if __has_include(<keychain_plugin/keychain_plugin-Swift.h>)
#import <keychain_plugin/keychain_plugin-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "keychain_plugin-Swift.h"
#endif

@implementation KeychainPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftKeychainPlugin registerWithRegistrar:registrar];
}
@end
