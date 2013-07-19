#import "AWAppDelegate.h"
#import <QuartzCore/QuartzCore.h>

#import "AWMainViewController.h"

@implementation AWAppDelegate

@synthesize unityController = _unityController; // unity

// Unity

- (void)playUnity
{
    [_unityController unityPause:NO];
}

- (void)pauseUnity
{
    [_unityController unityPause:YES];
}

#pragma mark - UIApplicationDelegate

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
    // unity
    [_unityController applicationDidReceiveMemoryWarning:application];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // unity
    BOOL returnBOOL;
    if (_unityController == nil) {
        _unityController = [[AppController alloc] init];
    }
    returnBOOL = [_unityController application:application didFinishLaunchingWithOptions:launchOptions];
    
    // unity, set window
    self.window = [_unityController window];
    
    // navigation controller
    AWMainViewController *loadingViewController = (AWMainViewController *)[[[NSBundle mainBundle] loadNibNamed:@"AWMainViewController" owner:nil options:nil] objectAtIndex:0];
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:loadingViewController];
    [self.window addSubview:self.navigationController.view];
    
    // unity, return
    return returnBOOL;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    [_unityController applicationWillResignActive:application];
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [_unityController applicationDidEnterBackground:application];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [_unityController applicationWillEnterForeground:application];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [_unityController applicationDidBecomeActive:application];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [_unityController applicationWillTerminate:application];
}

//
// push notifications
//

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    [_unityController application:application didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    [_unityController application:application didFailToRegisterForRemoteNotificationsWithError:error];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    [_unityController application:application didReceiveRemoteNotification:userInfo];
}

- (void)application:(UIApplication*)application didReceiveLocalNotification:(UILocalNotification*)notification
{
    [_unityController application:application didReceiveLocalNotification:notification];
}
/* 
//above @implementation UnityViewController
- (UIWindow *)window
{
    return _window;
}

- (void)unityPause:(BOOL)pause
{
    UnityPause(pause);
} 
//- (UIWindow *)window;
//- (void)unityPause:(BOOL)pause;
//AWAppDelegate
*/
@end
