#import <UIKit/UIKit.h>
#import "ETInterop.h"

@interface AWMainViewController : UIViewController <ETInteropGVCDelegate>

- (IBAction)startButtonPressed:(id)sender;
- (IBAction)fullScreenButtonPressed:(id)sender;
- (IBAction)toggleNavBarPressed:(id)sender;

@end
