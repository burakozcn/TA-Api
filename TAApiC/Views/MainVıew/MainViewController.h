#import <UIKit/UIKit.h>
#import "MainViewModel.h"

@interface MainViewController : UIViewController<UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UILabel *arriveLabel;
@property (nonatomic, strong) UILabel *departLabel;
@property (nonatomic, strong) UILabel *arriveDateLabel;
@property (nonatomic, strong) UILabel *departDateLabel;
@property (nonatomic, strong) UILabel *deptTableLabel;
@property (nonatomic, strong) UILabel *arriveTableLabel;
@property (nonatomic, strong) UITextField *arriveText;
@property (nonatomic, strong) UITextField *departText;
@property (nonatomic, strong) UITextField *arriveDateText;
@property (nonatomic, strong) UITextField *departDateText;
@property (nonatomic, strong) UIButton *searchButton;
@property (nonatomic, strong) UIButton *saveButton;
@property (nonatomic, strong) UITableView *deptTable;
@property (nonatomic, strong) UITableView *arriveTable;
@property (nonatomic, strong) UIDatePicker *deptDatePicker;
@property (nonatomic, strong) UIDatePicker *arriveDatePicker;
@property (nonatomic, strong) NSArray *airports;
@property (nonatomic, strong) UITableViewController *departSearchTable;
@property (nonatomic, strong) UITableViewController *arriveSearchTable;
@property (nonatomic, strong) NSArray *departArray;
@property (nonatomic, strong) NSArray *arriveArray;

@property (nonatomic, strong, readonly) MainViewModel *viewModel;

- (instancetype)initWithViewModel:(MainViewModel *)viewModel;

@end

