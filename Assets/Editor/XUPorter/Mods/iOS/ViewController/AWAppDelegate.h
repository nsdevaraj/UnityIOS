#import <UIKit/UIKit.h>
#import "AppController.h" // unity

@interface AWAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navigationController;

@property (strong, nonatomic) AppController *unityController; // unity

// unity
- (void)playUnity;
- (void)pauseUnity;

@end
