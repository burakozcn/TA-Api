#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

-(instancetype) initWithViewModel:(MainViewModel *)viewModel {
  self = [super initWithNibName:nil bundle:nil];
  _viewModel = [[MainViewModel alloc] init];
  _departArray = [[NSArray alloc] init];
  _arriveArray = [[NSArray alloc] init];
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = UIColor.whiteColor;
  self.navigationItem.title = @"Turkish Airlines Flight Schedule";
  [self setupView];
  [self showDeptDatePicker];
  [self showArriveDatePicker];
  _viewModel = [[MainViewModel alloc] init];
  [_viewModel initVM];
  
  _departText.delegate = self;
  _arriveText.delegate = self;
  
  [_departSearchTable.tableView registerNib:[UINib nibWithNibName:@"SearchTableViewCell" bundle:nil] forCellReuseIdentifier:@"SearchCell"];
  [_arriveSearchTable.tableView registerNib:[UINib nibWithNibName:@"SearchTableViewCell" bundle:nil] forCellReuseIdentifier:@"SearchCell"];
  
  _departSearchTable.tableView.delegate = self;
  _departSearchTable.tableView.dataSource = self;
  _arriveSearchTable.tableView.delegate = self;
  _arriveSearchTable.tableView.dataSource = self;
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
  [self searchButtonSetup];
  [self saveButtonSetup];
  [self departSearchTableSetup];
  [self arriveSearchTableSetup];
  
  [self.view addSubview:_departLabel];
  [self.view addSubview:_departText];
  [self.view addSubview:_departDateLabel];
  [self.view addSubview:_departDateText];
  [self.view addSubview:_arriveLabel];
  [self.view addSubview:_arriveText];
  [self.view addSubview:_arriveDateLabel];
  [self.view addSubview:_arriveDateText];
  [self.view addSubview:_searchButton];
  [self.view addSubview:_saveButton];
  [self.view addSubview:_departSearchTable.tableView];
  [self.view addSubview:_arriveSearchTable.tableView];
  
  [_departLabel.topAnchor constraintEqualToAnchor:guide.topAnchor constant:20].active = true;
  [_departLabel.heightAnchor constraintEqualToAnchor:heightAnchor multiplier:0.05].active = true;
  [_departLabel.leadingAnchor constraintEqualToAnchor:readGuide.leadingAnchor].active = true;
  [_departLabel.trailingAnchor constraintEqualToAnchor:readGuide.trailingAnchor].active = true;
  
  [_departText.topAnchor constraintEqualToAnchor:_departLabel.bottomAnchor constant:12].active = true;
  [_departText.heightAnchor constraintEqualToAnchor:heightAnchor multiplier:0.07].active = true;
  [_departText.leadingAnchor constraintEqualToAnchor:readGuide.leadingAnchor].active = true;
  [_departText.trailingAnchor constraintEqualToAnchor:readGuide.trailingAnchor].active = true;
  
  [_departSearchTable.tableView.topAnchor constraintEqualToAnchor:_departText.bottomAnchor].active = true;
  [_departSearchTable.tableView.heightAnchor constraintEqualToAnchor:heightAnchor multiplier:0.45].active = true;
  [_departSearchTable.tableView.widthAnchor constraintEqualToAnchor:readGuide.widthAnchor multiplier:0.9].active = true;
  [_departSearchTable.tableView.leadingAnchor constraintEqualToAnchor:readGuide.leadingAnchor].active = true;
  
  [_departDateLabel.topAnchor constraintEqualToAnchor:_departText.bottomAnchor constant:18].active = true;
  [_departDateLabel.heightAnchor constraintEqualToAnchor:heightAnchor multiplier:0.05].active = true;
  [_departDateLabel.leadingAnchor constraintEqualToAnchor:readGuide.leadingAnchor].active = true;
  [_departDateLabel.trailingAnchor constraintEqualToAnchor:readGuide.trailingAnchor].active = true;
  
  [_departDateText.topAnchor constraintEqualToAnchor:_departDateLabel.bottomAnchor constant:12].active = true;
  [_departDateText.heightAnchor constraintEqualToAnchor:heightAnchor multiplier:0.07].active = true;
  [_departDateText.leadingAnchor constraintEqualToAnchor:readGuide.leadingAnchor].active = true;
  [_departDateText.trailingAnchor constraintEqualToAnchor:readGuide.trailingAnchor].active = true;
  
  [_arriveLabel.topAnchor constraintEqualToAnchor:_departDateText.bottomAnchor constant:18].active = true;
  [_arriveLabel.heightAnchor constraintEqualToAnchor:heightAnchor multiplier:0.05].active = true;
  [_arriveLabel.leadingAnchor constraintEqualToAnchor:readGuide.leadingAnchor].active = true;
  [_arriveLabel.trailingAnchor constraintEqualToAnchor:readGuide.trailingAnchor].active = true;
  
  [_arriveText.topAnchor constraintEqualToAnchor:_arriveLabel.bottomAnchor constant:12].active = true;
  [_arriveText.heightAnchor constraintEqualToAnchor:heightAnchor multiplier:0.07].active = true;
  [_arriveText.leadingAnchor constraintEqualToAnchor:readGuide.leadingAnchor].active = true;
  [_arriveText.trailingAnchor constraintEqualToAnchor:readGuide.trailingAnchor].active = true;
  
  [_arriveSearchTable.tableView.topAnchor constraintEqualToAnchor:_arriveText.bottomAnchor].active = true;
  [_arriveSearchTable.tableView.heightAnchor constraintEqualToAnchor:heightAnchor multiplier:0.45].active = true;
  [_arriveSearchTable.tableView.widthAnchor constraintEqualToAnchor:readGuide.widthAnchor multiplier:0.9].active = true;
  [_arriveSearchTable.tableView.leadingAnchor constraintEqualToAnchor:readGuide.leadingAnchor].active = true;
  
  [_arriveDateLabel.topAnchor constraintEqualToAnchor:_arriveText.bottomAnchor constant:18].active = true;
  [_arriveDateLabel.heightAnchor constraintEqualToAnchor:heightAnchor multiplier:0.05].active = true;
  [_arriveDateLabel.leadingAnchor constraintEqualToAnchor:readGuide.leadingAnchor].active = true;
  [_arriveDateLabel.trailingAnchor constraintEqualToAnchor:readGuide.trailingAnchor].active = true;
  
  [_arriveDateText.topAnchor constraintEqualToAnchor:_arriveDateLabel.bottomAnchor constant:12].active = true;
  [_arriveDateText.heightAnchor constraintEqualToAnchor:heightAnchor multiplier:0.07].active = true;
  [_arriveDateText.leadingAnchor constraintEqualToAnchor:readGuide.leadingAnchor].active = true;
  [_arriveDateText.trailingAnchor constraintEqualToAnchor:readGuide.trailingAnchor].active = true;
  
  [_searchButton.topAnchor constraintEqualToAnchor:_arriveDateText.bottomAnchor constant:20].active = true;
  [_searchButton.heightAnchor constraintEqualToAnchor:heightAnchor multiplier:0.12].active = true;
  [_searchButton.widthAnchor constraintEqualToAnchor:widthAnchor multiplier:0.9].active = true;
  [_searchButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = true;
  
  [_saveButton.topAnchor constraintEqualToAnchor:_searchButton.bottomAnchor constant:20].active = true;
  [_saveButton.heightAnchor constraintEqualToAnchor:heightAnchor multiplier:0.12].active = true;
  [_saveButton.widthAnchor constraintEqualToAnchor:widthAnchor multiplier:0.9].active = true;
  [_saveButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = true;
}

- (UILabel *) departLabelSetup {
  _departLabel = [[UILabel alloc] init];
  _departLabel.translatesAutoresizingMaskIntoConstraints = false;
  _departLabel.textAlignment = NSTextAlignmentCenter;
  _departLabel.font = [UIFont boldSystemFontOfSize:20];
  _departLabel.text = @"From";
  return _departLabel;
}

- (UITextField *) departTextSetup {
  _departText = [[UITextField alloc] init];
  _departText.translatesAutoresizingMaskIntoConstraints = false;
  _departText.keyboardType = UIKeyboardTypeDefault;
  _departText.backgroundColor = UIColor.whiteColor;
  _departText.borderStyle = UITextBorderStyleRoundedRect;
  return _departText;
}

- (UILabel *) departDateLabelSetup {
  _departDateLabel = [[UILabel alloc] init];
  _departDateLabel.translatesAutoresizingMaskIntoConstraints = false;
  _departDateLabel.textAlignment = NSTextAlignmentCenter;
  _departDateLabel.font = [UIFont boldSystemFontOfSize:20];
  _departDateLabel.text = @"Departure Date";
  return _departDateLabel;
}

- (UITextField *) departDateTextSetup {
  _departDateText = [[UITextField alloc] init];
  _departDateText.translatesAutoresizingMaskIntoConstraints = false;
  _departDateText.backgroundColor = UIColor.whiteColor;
  _departDateText.borderStyle = UITextBorderStyleRoundedRect;
  return _departDateText;
}

- (UILabel *) arriveLabelSetup {
  _arriveLabel = [[UILabel alloc] init];
  _arriveLabel.translatesAutoresizingMaskIntoConstraints = false;
  _arriveLabel.textAlignment = NSTextAlignmentCenter;
  _arriveLabel.font = [UIFont boldSystemFontOfSize:20];
  _arriveLabel.text = @"To";
  return _arriveLabel;
}

- (UITextField *) arriveTextSetup {
  _arriveText = [[UITextField alloc] init];
  _arriveText.translatesAutoresizingMaskIntoConstraints = false;
  _arriveText.keyboardType = UIKeyboardTypeDefault;
  _arriveText.backgroundColor = UIColor.whiteColor;
  _arriveText.borderStyle = UITextBorderStyleRoundedRect;
  return _arriveText;
}

- (UILabel *) arriveDateLabelSetup {
  _arriveDateLabel = [[UILabel alloc] init];
  _arriveDateLabel.translatesAutoresizingMaskIntoConstraints = false;
  _arriveDateLabel.textAlignment = NSTextAlignmentCenter;
  _arriveDateLabel.font = [UIFont boldSystemFontOfSize:20];
  _arriveDateLabel.text = @"Return Date";
  return _arriveDateLabel;
}

- (UITextField *) arriveDateTextSetup {
  _arriveDateText = [[UITextField alloc] init];
  _arriveDateText.translatesAutoresizingMaskIntoConstraints = false;
  _arriveDateText.backgroundColor = UIColor.whiteColor;
  _arriveDateText.borderStyle = UITextBorderStyleRoundedRect;
  return _arriveDateText;
}

- (UIButton *) searchButtonSetup {
  _searchButton = [[UIButton alloc] init];
  _searchButton.translatesAutoresizingMaskIntoConstraints = false;
  [_searchButton addTarget:self
                    action:@selector(search)
        forControlEvents:UIControlEventTouchUpInside];
  [_searchButton setTitle:@"Search Results" forState:UIControlStateNormal];
  _searchButton.backgroundColor = UIColor.blueColor;
  return _searchButton;
}

- (UIButton *) saveButtonSetup {
  _saveButton = [[UIButton alloc] init];
  _saveButton.translatesAutoresizingMaskIntoConstraints = false;
  [_saveButton addTarget:self
              action:@selector(savedFlights)
    forControlEvents:UIControlEventTouchUpInside];
  [_saveButton setTitle:@"Saved Flights" forState:UIControlStateNormal];
  _saveButton.backgroundColor = UIColor.blueColor;
  return _saveButton;
}

- (UITableView *) departSearchTableSetup {
  _departSearchTable = [[UITableViewController alloc] init];
  UITableView *table = _departSearchTable.tableView;
  table.translatesAutoresizingMaskIntoConstraints = false;
  table.backgroundColor = UIColor.whiteColor;
  table.hidden = YES;
  return table;
}

- (UITableView *) arriveSearchTableSetup {
  _arriveSearchTable = [[UITableViewController alloc] init];
  UITableView *table = _arriveSearchTable.tableView;
  table.translatesAutoresizingMaskIntoConstraints = false;
  table.backgroundColor = UIColor.whiteColor;
  table.hidden = YES;
  return table;
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
  formatter.dateFormat = @"yyyy-MM-dd";
  _departDateText.text = [formatter stringFromDate: _deptDatePicker.date];
  _arriveDatePicker.minimumDate = _deptDatePicker.date;
  [self.view endEditing:true];
}

- (void) arriveDoneDatePicker {
  NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
  formatter.dateFormat = @"yyyy-MM-dd";
  _arriveDateText.text = [formatter stringFromDate: _arriveDatePicker.date];
  [self.view endEditing:true];
}

- (void) cancelDatePicker {
  [self.view endEditing:true];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
  NSString * searchStr = [textField.text stringByReplacingCharactersInRange:range withString:string];
  if (textField == _departText) {
    _departArray = [_viewModel searchAirports:searchStr];
    if (_departArray.count != 0) {
      _departSearchTable.tableView.hidden = NO;
    } else {
      _departSearchTable.tableView.hidden = YES;
    }
    [_departSearchTable.tableView reloadData];
  } else {
    _arriveArray = [_viewModel searchAirports:searchStr];
    if (_arriveArray.count != 0) {
      _arriveSearchTable.tableView.hidden = NO;
    } else {
      _arriveSearchTable.tableView.hidden = YES;
    }
    [_arriveSearchTable.tableView reloadData];
  }
  return YES;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  if ( _departArray.count > 0 ) {
    return _departArray.count;
  } else {
    return _arriveArray.count;
  }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SearchCell" forIndexPath:indexPath];
  if (_departArray.count > 0) {
    cell.textLabel.text = [_departArray objectAtIndex:indexPath.row];
  } else {
    cell.textLabel.text = [_arriveArray objectAtIndex:indexPath.row];
  }
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  if (_departArray.count > 0) {
    NSString *string = [_departArray objectAtIndex:indexPath.row];
    _departText.text = string;
    _departSearchTable.tableView.hidden = YES;
    _departArray = @[];
  } else {
    NSString *string = [_arriveArray objectAtIndex:indexPath.row];
    _arriveText.text = string;
    _arriveSearchTable.tableView.hidden = YES;
    _arriveArray = @[];
  }
}

- (void) search {
  if (_departText.text.length > 0 && _arriveText.text.length > 0 && _departDateText.text.length > 0 && _arriveDateText.text.length > 0) {
    [_viewModel searchFlights:_departText.text arriveLoc:_arriveText.text deptTime:_departDateText.text arriveTime:_arriveDateText.text];
  } else {
    NSLog(@"Olaylar Olaylar");
  }
}

- (void) savedFlights {
  [_viewModel savedSearchTable];
}

@end
