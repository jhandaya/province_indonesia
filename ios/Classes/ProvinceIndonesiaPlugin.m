#import "ProvinceIndonesiaPlugin.h"
#if __has_include(<province_indonesia/province_indonesia-Swift.h>)
#import <province_indonesia/province_indonesia-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "province_indonesia-Swift.h"
#endif

@implementation ProvinceIndonesiaPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftProvinceIndonesiaPlugin registerWithRegistrar:registrar];
}
@end
