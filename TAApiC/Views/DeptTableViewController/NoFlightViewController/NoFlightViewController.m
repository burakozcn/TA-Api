#import "NoFlightViewController.h"

@interface NoFlightViewController ()

@end

@implementation NoFlightViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = UIColor.whiteColor;
  [self showAlert];
}

-(void) showAlert {
  UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"There is no flight for this destinations on these dates!" preferredStyle:UIAlertControllerStyleActionSheet];
  UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    UINavigationController *navVC = (UINavigationController *)UIApplication.sharedApplication.keyWindow.rootViewController;
    [navVC popToRootViewControllerAnimated:YES];
  }];
  [alert addAction:action];
  [UIApplication.sharedApplication.keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
}

@end
