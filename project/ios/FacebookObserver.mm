#import <Facebook.h>
#import <FacebookObserver.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKCoreKit/FBSDKAppEvents.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@implementation FacebookObserver

- (void)observeTokenChange:(NSNotification *)notification {

	if ([FBSDKAccessToken currentAccessToken]!=nil) {
		extension_facebook::onTokenChange([[FBSDKAccessToken currentAccessToken].tokenString UTF8String]);
	} else {
		extension_facebook::onTokenChange("");
	}

}

// This code will be called immediately after application:didFinishLaunchingWithOptions:
- (void) applicationDidFinishLaunchingNotification:(NSNotification *)notification {

	NSDictionary *launchOptions = [notification userInfo] ;
	[[FBSDKApplicationDelegate sharedInstance] application:[UIApplication sharedApplication]
								didFinishLaunchingWithOptions:launchOptions];

}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Call the 'activateApp' method to log an app event for use
    // in analytics and advertising reporting.
    [FBSDKAppEvents activateApp];
}

@end
