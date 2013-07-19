#import "AWMainViewController.h"

@implementation AWMainViewController

#pragma mark - IBActions

- (IBAction)startButtonPressed:(id)sender
{
    [self start];
}

- (IBAction)fullScreenButtonPressed:(id)sender
{
    [self temporaryFullScreen];
}

- (IBAction)toggleNavBarPressed:(id)sender
{
    [self.navigationController setNavigationBarHidden:!self.navigationController.navigationBarHidden animated:YES];
}

#pragma mark - Full Screen

- (void)temporaryFullScreen
{
    self.view.hidden = YES;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 5.0f * NSEC_PER_SEC), dispatch_get_current_queue(), ^{
        
        self.view.hidden = NO;
    });
}

#pragma mark - Game lifecycle

- (void)start
{
    NSLog(@"started");
    
    NSLog(@"Swipe falling objects. Game ends after a certain number of objects have dropped. Note that touch events are now being propagated to and handled by Unity since userInteractionEnabled was disabled on our view.");
    
    // disable user interaction
    self.navigationController.view.userInteractionEnabled = NO;
    
    // camera
    [[ETInterop sharedInstance] sendMessageToUnityGameObject:@"GameControllerObject" method:@"callFromXcode" message:@"switchToCamera"];
    
    // start game
    [[ETInterop sharedInstance] sendMessageToUnityGameObject:@"GameControllerObject" method:@"callFromXcode" message:@"startGame"];
}

- (void)end
{
    NSLog(@"ended");
    
    // enable user interaction
    self.navigationController.view.userInteractionEnabled = YES;
    
    // camera
    [[ETInterop sharedInstance] sendMessageToUnityGameObject:@"GameControllerObject" method:@"callFromXcode" message:@"switchToCamera"];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // register interop
    [ETInterop sharedInstance].gvcDelegate = self;
}

#pragma mark - ETInteropGVCDelegate

- (void)interopUpdateGameWithMissed:(int)numMissed lost:(int)numLost
{
    NSLog(@"numMissed: %d, numLost: %d", numMissed, numLost);
}

- (void)interopEndGameWithMissed:(int)numMissed lost:(int)numLost
{
    [self end];
}

@end
