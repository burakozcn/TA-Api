#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Persistence.h"

NS_ASSUME_NONNULL_BEGIN

@interface CoreDataHelper : NSObject

-(void) initStore;

@property (strong, nonatomic) Persistence *persistence;

@end

NS_ASSUME_NONNULL_END
