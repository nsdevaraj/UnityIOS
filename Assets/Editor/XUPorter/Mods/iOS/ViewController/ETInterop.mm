#import "ETInterop.h"

extern "C" {
    
    // GVC
    
    void update_game(int missed, int lost)
    {
        ETInterop *sharedInstance = [ETInterop sharedInstance];
        [sharedInstance.gvcDelegate interopUpdateGameWithMissed:missed lost:lost];
    }
    
    void end_game(int missed, int lost)
    {
        ETInterop *sharedInstance = [ETInterop sharedInstance];
        [sharedInstance.gvcDelegate interopEndGameWithMissed:missed lost:lost];
    }
    
}

@implementation ETInterop

@synthesize gvcDelegate;

static ETInterop *sharedInstance = nil;

+ (ETInterop *) sharedInstance
{
    if (sharedInstance == nil) {
        sharedInstance = [[ETInterop alloc] init];
    }
    return sharedInstance;
}

- (void)sendMessageToUnityGameObject:(NSString *)gameObject method:(NSString *)method message:(NSString *)message
{
    UnitySendMessage([gameObject cStringUsingEncoding:NSASCIIStringEncoding], [method cStringUsingEncoding:NSASCIIStringEncoding], [message cStringUsingEncoding:NSASCIIStringEncoding]);
}

@end
