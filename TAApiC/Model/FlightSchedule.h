#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FlightSchedule : NSObject

@property (nonatomic, strong) NSString *arrivalDest;
@property (nonatomic, strong) NSString *departDest;
@property (nonatomic, strong) NSDate *arrivalTime;
@property (nonatomic, strong) NSDate *departTime;
@property (nonatomic, strong) NSString *duration;
@property (nonatomic, strong) NSString *flightNumber;
@property (nonatomic, strong) NSString *airline;

@end

NS_ASSUME_NONNULL_END
