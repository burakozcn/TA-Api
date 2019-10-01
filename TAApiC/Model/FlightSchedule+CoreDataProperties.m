//
//  FlightSchedule+CoreDataProperties.m
//  TAApiC
//
//  Created by Burak Özcan on 1.10.2019.
//  Copyright © 2019 Burak Özcan. All rights reserved.
//
//

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
