#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  UIViewController *vc = [MainViewController new];
  UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:vc];
  _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  _window.rootViewController = navVC;
  [_window makeKeyAndVisible];
  return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
  
  Persistence *persistence = [Persistence new];
  [persistence saveContext];
}

@end
