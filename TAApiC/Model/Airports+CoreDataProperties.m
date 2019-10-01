//
//  Airports+CoreDataProperties.m
//  TAApiC
//
//  Created by Burak Özcan on 1.10.2019.
//  Copyright © 2019 Burak Özcan. All rights reserved.
//
//

#import "Airports+CoreDataProperties.h"

@implementation Airports (CoreDataProperties)

+ (NSFetchRequest<Airports *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Airports"];
}

@dynamic dest;
@dynamic name;

@end
