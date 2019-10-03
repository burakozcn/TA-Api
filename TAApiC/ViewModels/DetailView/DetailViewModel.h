#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Persistence.h"
#import <CoreData/CoreData.h>
#import "AlertViewController.h"
#import "FlightSchedule+CoreDataClass.h"

NS_ASSUME_NONNULL_BEGIN
@interface DetailViewModel : NSObject

@property (strong, nonatomic) Persistence *persistence;
@property (strong, nonatomic) AlertViewController *alertVC;

- (void) saveFlight:(NSDictionary *) dict;

@end

NS_ASSUME_NONNULL_END
