#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NetworkManagement : NSObject

@property (nonatomic, copy) void (^completion)(NSDictionary* resultDict);

- (void) postResults: (NSDictionary *) dict completion: (void (^) (NSDictionary* value)) completion;

@end

NS_ASSUME_NONNULL_END
