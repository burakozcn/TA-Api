#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AlertViewController : UIViewController

@property (strong, nonatomic) NSString *alertTitle;
@property (strong, nonatomic) NSString *alertMessage;

-(id) initWithAlertTitle:(NSString *) title message:(NSString *) message;

@end

NS_ASSUME_NONNULL_END
