#import <Foundation/Foundation.h>

@protocol ETInteropGVCDelegate <NSObject>

- (void)interopUpdateGameWithMissed:(int)missed lost:(int)lost;
- (void)interopEndGameWithMissed:(int)missed lost:(int)lost;

@end

@interface ETInterop : NSObject

@property (strong, nonatomic) id <ETInteropGVCDelegate> gvcDelegate;

+ (ETInterop *)sharedInstance;

- (void)sendMessageToUnityGameObject:(NSString *)gameObject method:(NSString *)method message:(NSString *)message;

@end
