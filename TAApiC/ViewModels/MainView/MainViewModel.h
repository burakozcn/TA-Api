#import <Foundation/Foundation.h>
#import "Persistence.h"
#import "CoreDataHelper.h"
#import "NetworkManagement.h"
#import "Airports+CoreDataClass.h"
#import "DeptTableViewController.h"
#import "NoFlightViewController.h"
#import "DetailViewModel.h"
#import "SaveTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainViewModel : NSObject

@property (nonatomic, strong) NSArray *searchArray;
@property (nonatomic, strong) NSString *txtString;
@property (nonatomic, strong) DeptTableViewController *deptTable;
@property (nonatomic, strong) NoFlightViewController *noFlightVC;
@property (nonatomic, strong) SaveTableViewController *saveTableVC;
@property (nonatomic, strong) NetworkManagement *network;

-(void) searchFlights:(NSString *) deptLoc arriveLoc:(NSString *) arriveLoc deptTime:(NSString *) deptTime arriveTime:(NSString *) arriveTime;
-(instancetype) initVM;
-(NSArray *) searchAirports:(NSString *)string;
-(void) savedSearchTable;

@end

NS_ASSUME_NONNULL_END
