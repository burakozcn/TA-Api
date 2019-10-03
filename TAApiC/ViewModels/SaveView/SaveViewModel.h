#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Persistence.h"
#import "FlightSchedule+CoreDataClass.h"
#import "DeleteViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SaveViewModel : NSObject

@property (nonatomic, strong) Persistence *persistence;
@property (nonatomic, strong) DeleteViewController *deleteVC;

-(NSArray *) savedFlightFetch;
-(void) deleteFlight:(NSDictionary *) dict;

@end

NS_ASSUME_NONNULL_END
