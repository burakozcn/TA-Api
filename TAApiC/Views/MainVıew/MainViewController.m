#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

-(instancetype) initWithViewModel:(MainViewModel *)viewModel {
  self = [super initWithNibName:nil bundle:nil];
  _viewModel = viewModel;
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = UIColor.whiteColor;
  self.navigationItem.title = @"Turkish Airlines Flight Schedule";
  [self setupView];
  [self showDeptDatePicker];
  [self showArriveDatePicker];
}

- (void) setupView {
  UILayoutGuide *guide = self.view.safeAreaLayoutGuide;
  UILayoutGuide *readGuide = self.view.readableContentGuide;
  
  NSLayoutDimension *heightAnchor = guide.heightAnchor;
  NSLayoutDimension *widthAnchor = readGuide.widthAnchor;
  
  [self departLabelSetup];
  [self departTextSetup];
  [self departDateLabelSetup];
  [self departDateTextSetup];
  [self arriveLabelSetup];
  [self arriveTextSetup];
  [self arriveDateLabelSetup];
  [self arriveDateTextSetup];
  [self deptTableLabelSetup];
  [self arriveTableLabelSetup];
  [self searchButtonSetup];
  [self saveButtonSetup];
  [self deptTableSetup];
  [self arriveTableSetup];
  
  [self.view addSubview:_departLabel];
  [self.view addSubview:_departText];
  [self.view addSubview:_departDateLabel];
  [self.view addSubview:_departDateText];
  [self.view addSubview:_arriveLabel];
  [self.view addSubview:_arriveText];
  [self.view addSubview:_arriveDateLabel];
  [self.view addSubview:_arriveDateText];
  [self.view addSubview:_deptTableLabel];
  [self.view addSubview:_arriveTableLabel];
  [self.view addSubview:_searchButton];
  [self.view addSubview:_saveButton];
  [self.view addSubview:_deptTable];
  [self.view addSubview:_arriveTable];
  
  [_departLabel.topAnchor constraintEqualToAnchor:guide.topAnchor constant:13].active = true;
  [_departLabel.heightAnchor constraintEqualToAnchor:heightAnchor multiplier:0.03].active = true;
  [_departLabel.widthAnchor constraintEqualToAnchor:widthAnchor multiplier:0.5].active = true;
  [_departLabel.leadingAnchor constraintEqualToAnchor:readGuide.leadingAnchor].active = true;
  
  [_departDateLabel.topAnchor constraintEqualToAnchor:guide.topAnchor constant:13].active = true;
  [_departDateLabel.heightAnchor constraintEqualToAnchor:heightAnchor multiplier:0.03].active = true;
  [_departDateLabel.widthAnchor constraintEqualToAnchor:widthAnchor multiplier:0.5].active = true;
  [_departDateLabel.leadingAnchor constraintEqualToAnchor:_departLabel.trailingAnchor].active = true;
  [_departDateLabel.trailingAnchor constraintEqualToAnchor:readGuide.trailingAnchor].active = true;
  
  [_departText.topAnchor constraintEqualToAnchor:_departLabel.bottomAnchor constant:9].active = true;
  [_departText.heightAnchor constraintEqualToAnchor:heightAnchor multiplier:0.04].active = true;
  [_departText.widthAnchor constraintEqualToAnchor:widthAnchor multiplier:0.5].active = true;
  [_departText.leadingAnchor constraintEqualToAnchor:readGuide.leadingAnchor].active = true;
  
  [_departDateText.topAnchor constraintEqualToAnchor:_departDateLabel.bottomAnchor constant:9].active = true;
  [_departDateText.heightAnchor constraintEqualToAnchor:heightAnchor multiplier:0.04].active = true;
  [_departDateText.widthAnchor constraintEqualToAnchor:widthAnchor multiplier:0.5].active = true;
  [_departDateText.leadingAnchor constraintEqualToAnchor:_departText.trailingAnchor].active = true;
  [_departDateText.trailingAnchor constraintEqualToAnchor:readGuide.trailingAnchor].active = true;
  
  [_arriveLabel.topAnchor constraintEqualToAnchor:_departText.bottomAnchor constant:9].active = true;
  [_arriveLabel.heightAnchor constraintEqualToAnchor:heightAnchor multiplier:0.03].active = true;
  [_arriveLabel.widthAnchor constraintEqualToAnchor:widthAnchor multiplier:0.5].active = true;
  [_arriveLabel.leadingAnchor constraintEqualToAnchor:readGuide.leadingAnchor].active = true;
  
  [_arriveDateLabel.topAnchor constraintEqualToAnchor:_departDateText.bottomAnchor constant:9].active = true;
  [_arriveDateLabel.heightAnchor constraintEqualToAnchor:heightAnchor multiplier:0.03].active = true;
  [_arriveDateLabel.widthAnchor constraintEqualToAnchor:widthAnchor multiplier:0.5].active = true;
  [_arriveDateLabel.leadingAnchor constraintEqualToAnchor:_arriveLabel.trailingAnchor].active = true;
  [_arriveDateLabel.trailingAnchor constraintEqualToAnchor:readGuide.trailingAnchor].active = true;
  
  [_arriveText.topAnchor constraintEqualToAnchor:_arriveLabel.bottomAnchor constant:9].active = true;
  [_arriveText.heightAnchor constraintEqualToAnchor:heightAnchor multiplier:0.04].active = true;
  [_arriveText.widthAnchor constraintEqualToAnchor:widthAnchor multiplier:0.5].active = true;
  [_arriveText.leadingAnchor constraintEqualToAnchor:readGuide.leadingAnchor].active = true;
  
  [_arriveDateText.topAnchor constraintEqualToAnchor:_arriveDateLabel.bottomAnchor constant:9].active = true;
  [_arriveDateText.heightAnchor constraintEqualToAnchor:heightAnchor multiplier:0.04].active = true;
  [_arriveDateText.widthAnchor constraintEqualToAnchor:widthAnchor multiplier:0.5].active = true;
  [_arriveDateText.leadingAnchor constraintEqualToAnchor:_arriveText.trailingAnchor].active = true;
  [_arriveDateText.trailingAnchor constraintEqualToAnchor:readGuide.trailingAnchor].active = true;
  
  [_searchButton.topAnchor constraintEqualToAnchor:_arriveText.bottomAnchor constant:9].active = true;
  [_searchButton.heightAnchor constraintEqualToAnchor:heightAnchor multiplier:0.04].active = true;
  [_searchButton.widthAnchor constraintEqualToAnchor:widthAnchor multiplier:0.5].active = true;
  [_searchButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = true;
  
  [_deptTableLabel.topAnchor constraintEqualToAnchor:_searchButton.bottomAnchor constant:13].active = true;
  [_deptTableLabel.heightAnchor constraintEqualToAnchor:heightAnchor multiplier:0.03].active = true;
  [_deptTableLabel.widthAnchor constraintEqualToAnchor:widthAnchor multiplier:0.5].active = true;
  [_deptTableLabel.leadingAnchor constraintEqualToAnchor:readGuide.leadingAnchor].active = true;
  
  [_deptTable.topAnchor constraintEqualToAnchor:_deptTableLabel.bottomAnchor constant:9].active = true;
  [_deptTable.heightAnchor constraintEqualToAnchor:heightAnchor multiplier:0.3].active = true;
  [_deptTable.widthAnchor constraintEqualToAnchor:widthAnchor multiplier:0.95].active = true;
  [_deptTable.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = true;
  
  [_arriveTableLabel.topAnchor constraintEqualToAnchor:_deptTable.bottomAnchor constant:13].active = true;
  [_arriveTableLabel.heightAnchor constraintEqualToAnchor:heightAnchor multiplier:0.03].active = true;
  [_arriveTableLabel.widthAnchor constraintEqualToAnchor:widthAnchor multiplier:0.5].active = true;
  [_arriveTableLabel.leadingAnchor constraintEqualToAnchor:readGuide.leadingAnchor].active = true;
  
  [_arriveTable.topAnchor constraintEqualToAnchor:_arriveTableLabel.bottomAnchor constant:9].active = true;
  [_arriveTable.heightAnchor constraintEqualToAnchor:heightAnchor multiplier:0.3].active = true;
  [_arriveTable.widthAnchor constraintEqualToAnchor:widthAnchor multiplier:0.95].active = true;
  [_arriveTable.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = true;
  
  [_saveButton.topAnchor constraintEqualToAnchor:_arriveTable.bottomAnchor constant:9].active = true;
  [_saveButton.heightAnchor constraintEqualToAnchor:heightAnchor multiplier:0.04].active = true;
  [_saveButton.widthAnchor constraintEqualToAnchor:widthAnchor multiplier:0.5].active = true;
  [_saveButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = true;
}

- (UILabel *) departLabelSetup {
  _departLabel = [UILabel new];
  _departLabel.translatesAutoresizingMaskIntoConstraints = false;
  _departLabel.textAlignment = NSTextAlignmentCenter;
  _departLabel.font = [UIFont boldSystemFontOfSize:20];
  _departLabel.text = @"From";
  return _departLabel;
}

- (UITextField *) departTextSetup {
  _departText = [UITextField new];
  _departText.translatesAutoresizingMaskIntoConstraints = false;
  _departText.keyboardType = UIKeyboardTypeDefault;
  _departText.backgroundColor = UIColor.whiteColor;
  _departText.borderStyle = UITextBorderStyleRoundedRect;
  return _departText;
}

- (UILabel *) departDateLabelSetup {
  _departDateLabel = [UILabel new];
  _departDateLabel.translatesAutoresizingMaskIntoConstraints = false;
  _departDateLabel.textAlignment = NSTextAlignmentCenter;
  _departDateLabel.font = [UIFont boldSystemFontOfSize:20];
  _departDateLabel.text = @"Departure Date";
  return _departDateLabel;
}

- (UITextField *) departDateTextSetup {
  _departDateText = [UITextField new];
  _departDateText.translatesAutoresizingMaskIntoConstraints = false;
  _departDateText.backgroundColor = UIColor.whiteColor;
  _departDateText.borderStyle = UITextBorderStyleRoundedRect;
  return _departDateText;
}

- (UILabel *) arriveLabelSetup {
  _arriveLabel = [UILabel new];
  _arriveLabel.translatesAutoresizingMaskIntoConstraints = false;
  _arriveLabel.textAlignment = NSTextAlignmentCenter;
  _arriveLabel.font = [UIFont boldSystemFontOfSize:20];
  _arriveLabel.text = @"To";
  return _arriveLabel;
}

- (UITextField *) arriveTextSetup {
  _arriveText = [UITextField new];
  _arriveText.translatesAutoresizingMaskIntoConstraints = false;
  _arriveText.keyboardType = UIKeyboardTypeDefault;
  _arriveText.backgroundColor = UIColor.whiteColor;
  _arriveText.borderStyle = UITextBorderStyleRoundedRect;
  return _arriveText;
}

- (UILabel *) arriveDateLabelSetup {
  _arriveDateLabel = [UILabel new];
  _arriveDateLabel.translatesAutoresizingMaskIntoConstraints = false;
  _arriveDateLabel.textAlignment = NSTextAlignmentCenter;
  _arriveDateLabel.font = [UIFont boldSystemFontOfSize:20];
  _arriveDateLabel.text = @"Return Date";
  return _arriveDateLabel;
}

- (UITextField *) arriveDateTextSetup {
  _arriveDateText = [UITextField new];
  _arriveDateText.translatesAutoresizingMaskIntoConstraints = false;
  _arriveDateText.backgroundColor = UIColor.whiteColor;
  _arriveDateText.borderStyle = UITextBorderStyleRoundedRect;
  return _arriveDateText;
}

- (UILabel *) deptTableLabelSetup {
  _deptTableLabel = [UILabel new];
  _deptTableLabel.translatesAutoresizingMaskIntoConstraints = false;
  _deptTableLabel.textAlignment = NSTextAlignmentCenter;
  _deptTableLabel.font = [UIFont boldSystemFontOfSize:20];
  _deptTableLabel.text = @"Departure Flights";
  return _deptTableLabel;
}

- (UILabel *) arriveTableLabelSetup {
  _arriveTableLabel = [UILabel new];
  _arriveTableLabel.translatesAutoresizingMaskIntoConstraints = false;
  _arriveTableLabel.textAlignment = NSTextAlignmentCenter;
  _arriveTableLabel.font = [UIFont boldSystemFontOfSize:20];
  _arriveTableLabel.text = @"Arrival Flights";
  return _arriveTableLabel;
}

- (UIButton *) searchButtonSetup {
  _searchButton = [UIButton new];
  _searchButton.translatesAutoresizingMaskIntoConstraints = false;
  [_searchButton addTarget:self
                  action:@selector(null)
        forControlEvents:UIControlEventTouchUpInside];
  [_searchButton setTitle:@"Search Results" forState:UIControlStateNormal];
  _searchButton.backgroundColor = UIColor.blueColor;
  return _searchButton;
}

- (UIButton *) saveButtonSetup {
  _saveButton = [UIButton new];
  _saveButton.translatesAutoresizingMaskIntoConstraints = false;
  [_saveButton addTarget:self
              action:@selector(null)
    forControlEvents:UIControlEventTouchUpInside];
  [_saveButton setTitle:@"Save Results" forState:UIControlStateNormal];
  _saveButton.backgroundColor = UIColor.blueColor;
  return _saveButton;
}

- (UITableView *) deptTableSetup {
  _deptTable = [[DeptTableViewController alloc] init].tableView;
  _deptTable.translatesAutoresizingMaskIntoConstraints = false;
  _deptTable.backgroundColor = UIColor.greenColor;
  return _deptTable;
}

- (UITableView *) arriveTableSetup {
  _arriveTable = [[ArrivalTableViewController alloc] init].tableView;
  _arriveTable.translatesAutoresizingMaskIntoConstraints = false;
  _arriveTable.backgroundColor = UIColor.redColor;
  return _arriveTable;
}

- (void) showDeptDatePicker {
  _deptDatePicker = [[UIDatePicker alloc] init];
  _deptDatePicker.datePickerMode = UIDatePickerModeDate;
  _deptDatePicker.minimumDate = [[NSDate alloc] init];
  NSCalendar *cal = [NSCalendar currentCalendar];
  NSDate *someDate = [cal dateByAddingUnit:NSCalendarUnitMonth value:9 toDate:[NSDate date] options:0];
  _deptDatePicker.maximumDate = someDate;
  
  UIToolbar *toolbar = [[UIToolbar alloc] init];
  [toolbar sizeToFit];
  UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(deptDoneDatePicker)];
  UIBarButtonItem *spaceButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
  UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancelDatePicker)];
  
  NSArray *buttons = [NSArray arrayWithObjects: doneButton, spaceButton, cancelButton, nil];
  
  [toolbar setItems:(buttons) animated:false];
  
  _departDateText.inputAccessoryView = toolbar;
  _departDateText.inputView = _deptDatePicker;
}

- (void) showArriveDatePicker {
  _arriveDatePicker = [[UIDatePicker alloc] init];
  _arriveDatePicker.datePickerMode = UIDatePickerModeDate;
  _arriveDatePicker.minimumDate = [[NSDate alloc] init];
  NSCalendar *cal = [NSCalendar currentCalendar];
  NSDate *someDate = [cal dateByAddingUnit:NSCalendarUnitMonth value:9 toDate:[NSDate date] options:0];
  _arriveDatePicker.maximumDate = someDate;
  
  UIToolbar *toolbar = [[UIToolbar alloc] init];
  [toolbar sizeToFit];
  UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(arriveDoneDatePicker)];
  UIBarButtonItem *spaceButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
  UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancelDatePicker)];
  
  NSArray *buttons = [NSArray arrayWithObjects: doneButton, spaceButton, cancelButton, nil];
  
  [toolbar setItems:(buttons) animated:false];
  
  _arriveDateText.inputAccessoryView = toolbar;
  _arriveDateText.inputView = _arriveDatePicker;
}

- (void) deptDoneDatePicker {
  NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
  formatter.dateFormat = @"dd/MM/yyyy";
  _departDateText.text = [formatter stringFromDate: _deptDatePicker.date];
  [self.view endEditing:true];
}

- (void) arriveDoneDatePicker {
  NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
  formatter.dateFormat = @"dd/MM/yyyy";
  _arriveDateText.text = [formatter stringFromDate: _arriveDatePicker.date];
  [self.view endEditing:true];
}

- (void) cancelDatePicker {
  [self.view endEditing:true];
}

@end
