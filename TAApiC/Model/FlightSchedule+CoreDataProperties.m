#import "FlightSchedule+CoreDataProperties.h"

@implementation FlightSchedule (CoreDataProperties)

+ (NSFetchRequest<FlightSchedule *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"FlightSchedule"];
}

@dynamic airline;
@dynamic arrivalDest;
@dynamic arrivalTime;
@dynamic departDest;
@dynamic departTime;
@dynamic duration;
@dynamic flightNumber;

@end
