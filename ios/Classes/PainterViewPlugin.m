#import "PainterViewPlugin.h"
#if __has_include(<painter_view/painter_view-Swift.h>)
#import <painter_view/painter_view-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "painter_view-Swift.h"
#endif

@implementation PainterViewPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPainterViewPlugin registerWithRegistrar:registrar];
}
@end
