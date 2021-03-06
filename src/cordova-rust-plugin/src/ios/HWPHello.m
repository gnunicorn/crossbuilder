#import "HWPHello.h"
#import "hello_rust.h"

@implementation HWPHello

- (void)greet:(CDVInvokedUrlCommand*)command
{

    NSString* callbackId = [command callbackId];

    const char* rust_msg = hello();
    char rust_msg_copy[128] = { 0 };
    strncpy(rust_msg_copy, rust_msg, sizeof(rust_msg_copy));
    
    NSString* msg = [[NSString alloc] initWithUTF8String:rust_msg_copy];

    CDVPluginResult* result = [CDVPluginResult
                               resultWithStatus:CDVCommandStatus_OK
                               messageAsString:msg];

    
	[self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

@end