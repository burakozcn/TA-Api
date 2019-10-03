#import "Airports+CoreDataProperties.h"

@implementation Airports (CoreDataProperties)

+ (NSFetchRequest<Airports *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Airports"];
}

@dynamic dest;
@dynamic name;

@end
