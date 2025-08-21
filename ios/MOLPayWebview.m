//  Copyright © 2016 MOLPay. All rights reserved.

#define DLog(...)
//#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#import "MOLPayWebview.h"

@interface MOLPayWebview() <WKUIDelegate>

@end

@implementation MOLPayWebview

- (id)init
{
    self = [super init];
    
    if (self) {
        self.scrollView.bounces = NO;
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.scrollView.bounces = NO;
    }
    
    return self;
}

- (void)startUI
{
    
}

- (void)closemolpay {
    [self evaluateJavaScript:[NSString stringWithFormat:@"closemolpay()"] completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        
    }];
}

- (void)transactionRequest
{
    [self evaluateJavaScript:[NSString stringWithFormat:@"transactionRequest()"] completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        
    }];
}

- (void)updateSdkData :(id)data
{
    // Convert data to json start
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:data
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    if (!jsonData) {
        DLog(@">>>>>>>>> updateSdkData error = %@", error);
    } else {
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        DLog(@">>>>>>>>> jsonString = %@", jsonString);
        [self evaluateJavaScript:[NSString stringWithFormat:@"updateSdkData(%@)", jsonString] completionHandler:^(id _Nullable result, NSError * _Nullable error) {
            
        }];
    }
}

- (void)nativeWebRequestUrlUpdates :(NSDictionary*)data
{
    // Convert data to json start
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:data
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    if (!jsonData) {
        DLog(@">>>>>>>>> nativeWebRequestUrlUpdates jsonData error = %@", error);
    } else {
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        DLog(@">>>>>>>>>nativeWebRequestUrlUpdates jsonString = %@", jsonString);
        [self evaluateJavaScript:[NSString stringWithFormat:@"nativeWebRequestUrlUpdates(%@)", jsonString] completionHandler:^(id _Nullable result, NSError * _Nullable error) {
            
        }];
    }
    
}

- (void)nativeWebRequestUrlUpdatesOnFinishLoad :(NSDictionary*)data
{
    // Convert data to json start
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:data
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    if (!jsonData) {
        DLog(@">>>>>>>>> nativeWebRequestUrlUpdatesOnFinishLoad jsonData error = %@", error);
    } else {
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        DLog(@">>>>>>>>>nativeWebRequestUrlUpdatesOnFinishLoad jsonString = %@", jsonString);
        [self evaluateJavaScript:[NSString stringWithFormat:@"nativeWebRequestUrlUpdatesOnFinishLoad(%@)", jsonString] completionHandler:^(id _Nullable result, NSError * _Nullable error) {
            
        }];
    }
    
}

// Overwrite javascript function
- (void)overidingJavascriptMethod
{
    NSString *overwriteScript = @"window.open = function (open) { return function (url, name, features) { window.location = url; return window; }; } (window.open);";
    
    [self evaluateJavaScript:overwriteScript completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        
    }];
    
    overwriteScript = @"window.close = function () { window.location.assign(window.location); };";
    
    [self evaluateJavaScript:overwriteScript completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        
    }];
}


@end
