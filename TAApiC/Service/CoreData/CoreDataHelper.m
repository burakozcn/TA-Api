#import "CoreDataHelper.h"

@implementation CoreDataHelper

-(void) initStore {
  NSError *error;
  NSFileManager *fm = [NSFileManager defaultManager];
  NSString *seed = [[NSBundle mainBundle] pathForResource:@"airports" ofType:@"sqlite"];
  
  NSURL *storeURL = [fm URLForDirectory:NSApplicationSupportDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:&error];
  NSURL *sqliteURL = [storeURL URLByAppendingPathComponent:@"TAApiC.sqlite"];
  NSLog(@"%@", sqliteURL);
  if (![fm fileExistsAtPath:sqliteURL.path]) {
    NSLog(@"There is no such file load before.");
    [fm copyItemAtPath:seed toPath:sqliteURL.path
                 error:&error];
  } else {
    NSLog(@"File has already been uploaded.");
  }
}

@end
