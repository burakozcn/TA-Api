//
//  FlightSchedule+CoreDataProperties.h
//  TAApiC
//
//  Created by Burak Özcan on 16.09.2019.
//  Copyright © 2019 Burak Özcan. All rights reserved.
//
//

#import "FlightSchedule+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface FlightSchedule (CoreDataProperties)

+ (NSFetchRequest<FlightSchedule *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *arrivalDest;
@property (nullable, nonatomic, copy) NSString *departDest;
@property (nullable, nonatomic, copy) NSString *duration;
@property (nullable, nonatomic, copy) NSString *flightNumber;
@property (nullable, nonatomic, copy) NSString *airline;
@property (nullable, nonatomic, copy) NSDate *arrivalTime;
@property (nullable, nonatomic, copy) NSDate *departTime;

@end

NS_ASSUME_NONNULL_END
