#import "DeleteViewController.h"

@interface DeleteViewController ()

@end

@implementation DeleteViewController

-(id) initWithAlertTitle:(NSString *) title message:(NSString *) message {
  self = [super init];
  _alertTitle = title;
  _alertMessage = message;
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = UIColor.whiteColor;
  [self showAlert:_alertTitle message:_alertMessage];
}

-(void) showAlert:(NSString *) title message:(NSString *) message {
  UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
  UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    UINavigationController *navVC = (UINavigationController *)UIApplication.sharedApplication.keyWindow.rootViewController;
    [navVC popToRootViewControllerAnimated:YES];
  }];
  [alert addAction:action];
  [UIApplication.sharedApplication.keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
}

@end
