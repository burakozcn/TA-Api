//
//  Airports+CoreDataProperties.h
//  TAApiC
//
//  Created by Burak Özcan on 16.09.2019.
//  Copyright © 2019 Burak Özcan. All rights reserved.
//
//

#import "Airports+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Airports (CoreDataProperties)

+ (NSFetchRequest<Airports *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *dest;
@property (nullable, nonatomic, copy) NSString *name;

@end

NS_ASSUME_NONNULL_END
