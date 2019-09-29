//
//  FlightSchedule+CoreDataProperties.m
//  TAApiC
//
//  Created by Burak Özcan on 16.09.2019.
//  Copyright © 2019 Burak Özcan. All rights reserved.
//
//

#import "FlightSchedule+CoreDataProperties.h"

@implementation FlightSchedule (CoreDataProperties)

+ (NSFetchRequest<FlightSchedule *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"FlightSchedule"];
}

@dynamic arrivalDest;
@dynamic departDest;
@dynamic duration;
@dynamic flightNumber;
@dynamic airline;
@dynamic arrivalTime;
@dynamic departTime;

@end
