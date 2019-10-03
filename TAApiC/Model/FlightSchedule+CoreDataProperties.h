#import "FlightSchedule+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface FlightSchedule (CoreDataProperties)

+ (NSFetchRequest<FlightSchedule *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *airline;
@property (nullable, nonatomic, copy) NSString *arrivalDest;
@property (nullable, nonatomic, copy) NSString *arrivalTime;
@property (nullable, nonatomic, copy) NSString *departDest;
@property (nullable, nonatomic, copy) NSString *departTime;
@property (nullable, nonatomic, copy) NSString *duration;
@property (nullable, nonatomic, copy) NSString *flightNumber;

@end

NS_ASSUME_NONNULL_END
