#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface Persistence : NSObject

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;

@end

NS_ASSUME_NONNULL_END
