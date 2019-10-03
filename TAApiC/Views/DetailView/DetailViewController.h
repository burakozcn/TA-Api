#import <UIKit/UIKit.h>
#import "DetailViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController

@property (nonatomic, strong) UILabel *departDestLabel;
@property (nonatomic, strong) UITextField *departDestField;
@property (nonatomic, strong) UILabel *departTimeLabel;
@property (nonatomic, strong) UITextField *departTimeField;
@property (nonatomic, strong) UILabel *arrivalDestLabel;
@property (nonatomic, strong) UITextField *arrivalDestField;
@property (nonatomic, strong) UILabel *arrivalTimeLabel;
@property (nonatomic, strong) UITextField *arrivalTimeField;
@property (nonatomic, strong) UILabel *durationLabel;
@property (nonatomic, strong) UITextField *durationField;
@property (nonatomic, strong) UILabel *airlineLabel;
@property (nonatomic, strong) UITextField *airlineField;
@property (nonatomic, strong) UILabel *flightNumberLabel;
@property (nonatomic, strong) UITextField *flightNumberField;
@property (nonatomic, strong) UIButton *saveButton;

@property (nonatomic, strong) NSDictionary *dataDict;
@property (nonatomic, strong) DetailViewModel *viewModel;
@property (nonatomic) BOOL isButton;

-(id) initWithDict:(NSDictionary *) dict button:(BOOL) button;

@end

NS_ASSUME_NONNULL_END
