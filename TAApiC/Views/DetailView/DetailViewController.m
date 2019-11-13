#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

-(id) initWithDict:(NSDictionary *) dict button:(BOOL) button{
  self = [super init];
  _dataDict = dict;
  _viewModel = [[DetailViewModel alloc] init];
  _isButton = button;
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = UIColor.whiteColor;
  
  [self setupView];
  
  _departDestField.text = _dataDict[@"DepartDest"];
  _departTimeField.text = [_dataDict[@"DepartTime"] stringByReplacingOccurrencesOfString:@"T" withString:@" "];
  _arrivalDestField.text = _dataDict[@"ArrivalDest"];
  _arrivalTimeField.text = [_dataDict[@"ArrivalTime"] stringByReplacingOccurrencesOfString:@"T" withString:@" "];
  _airlineField.text = _dataDict[@"Airline"];
  _flightNumberField.text = _dataDict[@"FlightNumber"];
  
  NSString *str = _dataDict[@"Duration"];
  NSString *str1 = [[str componentsSeparatedByString:@"M"] objectAtIndex:0];
  NSString *str2 = [str1 stringByReplacingOccurrencesOfString:@"P0DT" withString:@""];
  NSString *str3 = [str2 stringByReplacingOccurrencesOfString:@"H" withString:@" Hour(s) "];
  NSString *str4 = [str3 stringByAppendingString:@" Minute(s)"];
  _durationField.text = str4;
}

- (void)setupView {
  UILayoutGuide *guide = self.view.safeAreaLayoutGuide;
  UILayoutGuide *readGuide = self.view.readableContentGuide;
  
  CGFloat width = [[UIScreen mainScreen] bounds].size.width;
  CGFloat height = [[UIScreen mainScreen] bounds].size.height;
  
  [self departDestLabelSetup];
  [self departDestFieldSetup];
  [self departTimeLabelSetup];
  [self departTimeFieldSetup];
  [self arrivalDestLabelSetup];
  [self arrivalDestFieldSetup];
  [self arrivalTimeLabelSetup];
  [self arrivalTimeFieldSetup];
  [self durationLabelSetup];
  [self durationFieldSetup];
  [self airlineLabelSetup];
  [self airlineFieldSetup];
  [self flightNumberLabelSetup];
  [self flightNumberFieldSetup];
  
  [self.view addSubview:_departDestLabel];
  [self.view addSubview:_departDestField];
  [self.view addSubview:_departTimeLabel];
  [self.view addSubview:_departTimeField];
  [self.view addSubview:_arrivalDestLabel];
  [self.view addSubview:_arrivalDestField];
  [self.view addSubview:_arrivalTimeLabel];
  [self.view addSubview:_arrivalTimeField];
  [self.view addSubview:_durationLabel];
  [self.view addSubview:_durationField];
  [self.view addSubview:_airlineLabel];
  [self.view addSubview:_airlineField];
  [self.view addSubview:_flightNumberLabel];
  [self.view addSubview:_flightNumberField];
  
  [_departDestLabel.topAnchor constraintEqualToAnchor:guide.topAnchor constant:height * 0.015].active = true;
  [_departDestLabel.leadingAnchor constraintEqualToAnchor:readGuide.leadingAnchor constant:12].active = true;
  [_departDestLabel.trailingAnchor constraintEqualToAnchor:readGuide.trailingAnchor constant:-12].active = true;
  [_departDestLabel.heightAnchor constraintEqualToAnchor:guide.heightAnchor multiplier:0.04].active = true;
  
  [_departDestField.topAnchor constraintEqualToAnchor:_departDestLabel.bottomAnchor constant:height * 0.01].active = true;
  [_departDestField.leadingAnchor constraintEqualToAnchor:readGuide.leadingAnchor constant:12].active = true;
  [_departDestField.trailingAnchor constraintEqualToAnchor:readGuide.trailingAnchor constant:-12].active = true;
  [_departDestField.heightAnchor constraintEqualToAnchor:guide.heightAnchor multiplier:0.06].active = true;
  
  [_departTimeLabel.topAnchor constraintEqualToAnchor:_departDestField.bottomAnchor constant:height * 0.01].active = true;
  [_departTimeLabel.leadingAnchor constraintEqualToAnchor:readGuide.leadingAnchor constant:12].active = true;
  [_departTimeLabel.trailingAnchor constraintEqualToAnchor:readGuide.trailingAnchor constant:-12].active = true;
  [_departTimeLabel.heightAnchor constraintEqualToAnchor:guide.heightAnchor multiplier:0.04].active = true;
  
  [_departTimeField.topAnchor constraintEqualToAnchor:_departTimeLabel.bottomAnchor constant:height * 0.01].active = true;
  [_departTimeField.leadingAnchor constraintEqualToAnchor:readGuide.leadingAnchor constant:12].active = true;
  [_departTimeField.trailingAnchor constraintEqualToAnchor:readGuide.trailingAnchor constant:-12].active = true;
  [_departTimeField.heightAnchor constraintEqualToAnchor:guide.heightAnchor multiplier:0.06].active = true;
  
  [_arrivalDestLabel.topAnchor constraintEqualToAnchor:_departTimeField.bottomAnchor constant:height * 0.01].active = true;
  [_arrivalDestLabel.leadingAnchor constraintEqualToAnchor:readGuide.leadingAnchor constant:12].active = true;
  [_arrivalDestLabel.trailingAnchor constraintEqualToAnchor:readGuide.trailingAnchor constant:-12].active = true;
  [_arrivalDestLabel.heightAnchor constraintEqualToAnchor:guide.heightAnchor multiplier:0.04].active = true;
  
  [_arrivalDestField.topAnchor constraintEqualToAnchor:_arrivalDestLabel.bottomAnchor constant:height * 0.01].active = true;
  [_arrivalDestField.leadingAnchor constraintEqualToAnchor:readGuide.leadingAnchor constant:12].active = true;
  [_arrivalDestField.trailingAnchor constraintEqualToAnchor:readGuide.trailingAnchor constant:-12].active = true;
  [_arrivalDestField.heightAnchor constraintEqualToAnchor:guide.heightAnchor multiplier:0.06].active = true;
  
  [_arrivalTimeLabel.topAnchor constraintEqualToAnchor:_arrivalDestField.bottomAnchor constant:height * 0.01].active = true;
  [_arrivalTimeLabel.leadingAnchor constraintEqualToAnchor:readGuide.leadingAnchor constant:12].active = true;
  [_arrivalTimeLabel.trailingAnchor constraintEqualToAnchor:readGuide.trailingAnchor constant:-12].active = true;
  [_arrivalTimeLabel.heightAnchor constraintEqualToAnchor:guide.heightAnchor multiplier:0.04].active = true;
  
  [_arrivalTimeField.topAnchor constraintEqualToAnchor:_arrivalTimeLabel.bottomAnchor constant:height * 0.01].active = true;
  [_arrivalTimeField.leadingAnchor constraintEqualToAnchor:readGuide.leadingAnchor constant:12].active = true;
  [_arrivalTimeField.trailingAnchor constraintEqualToAnchor:readGuide.trailingAnchor constant:-12].active = true;
  [_arrivalTimeField.heightAnchor constraintEqualToAnchor:guide.heightAnchor multiplier:0.06].active = true;
  
  [_durationLabel.topAnchor constraintEqualToAnchor:_arrivalTimeField.bottomAnchor constant:height * 0.01].active = true;
  [_durationLabel.leadingAnchor constraintEqualToAnchor:readGuide.leadingAnchor constant:12].active = true;
  [_durationLabel.trailingAnchor constraintEqualToAnchor:readGuide.trailingAnchor constant:-12].active = true;
  [_durationLabel.heightAnchor constraintEqualToAnchor:guide.heightAnchor multiplier:0.04].active = true;
  
  [_durationField.topAnchor constraintEqualToAnchor:_durationLabel.bottomAnchor constant:height * 0.01].active = true;
  [_durationField.leadingAnchor constraintEqualToAnchor:readGuide.leadingAnchor constant:12].active = true;
  [_durationField.trailingAnchor constraintEqualToAnchor:readGuide.trailingAnchor constant:-12].active = true;
  [_durationField.heightAnchor constraintEqualToAnchor:guide.heightAnchor multiplier:0.06].active = true;
  
  [_airlineLabel.topAnchor constraintEqualToAnchor:_durationField.bottomAnchor constant:height * 0.01].active = true;
  [_airlineLabel.leadingAnchor constraintEqualToAnchor:readGuide.leadingAnchor constant:12].active = true;
  [_airlineLabel.trailingAnchor constraintEqualToAnchor:readGuide.trailingAnchor constant:-12].active = true;
  [_airlineLabel.heightAnchor constraintEqualToAnchor:guide.heightAnchor multiplier:0.04].active = true;
  
  [_airlineField.topAnchor constraintEqualToAnchor:_airlineLabel.bottomAnchor constant:height * 0.01].active = true;
  [_airlineField.leadingAnchor constraintEqualToAnchor:readGuide.leadingAnchor constant:12].active = true;
  [_airlineField.trailingAnchor constraintEqualToAnchor:readGuide.trailingAnchor constant:-12].active = true;
  [_airlineField.heightAnchor constraintEqualToAnchor:guide.heightAnchor multiplier:0.06].active = true;
  
  [_flightNumberLabel.topAnchor constraintEqualToAnchor:_airlineField.bottomAnchor constant:height * 0.01].active = true;
  [_flightNumberLabel.leadingAnchor constraintEqualToAnchor:readGuide.leadingAnchor constant:12].active = true;
  [_flightNumberLabel.trailingAnchor constraintEqualToAnchor:readGuide.trailingAnchor constant:-12].active = true;
  [_flightNumberLabel.heightAnchor constraintEqualToAnchor:guide.heightAnchor multiplier:0.04].active = true;
  
  [_flightNumberField.topAnchor constraintEqualToAnchor:_flightNumberLabel.bottomAnchor constant:height * 0.01].active = true;
  [_flightNumberField.leadingAnchor constraintEqualToAnchor:readGuide.leadingAnchor constant:12].active = true;
  [_flightNumberField.trailingAnchor constraintEqualToAnchor:readGuide.trailingAnchor constant:-12].active = true;
  [_flightNumberField.heightAnchor constraintEqualToAnchor:guide.heightAnchor multiplier:0.06].active = true;
  
  if (_isButton) {
    [self saveButtonSetup];
    [self.view addSubview:_saveButton];
    
    [_saveButton.leadingAnchor constraintEqualToAnchor:readGuide.leadingAnchor constant:height * 0.01].active = true;
    [_saveButton.trailingAnchor constraintEqualToAnchor:readGuide.trailingAnchor constant:-12].active = true;
    [_saveButton.heightAnchor constraintEqualToAnchor:guide.heightAnchor multiplier:0.05].active = true;
    [_saveButton.bottomAnchor constraintEqualToAnchor:guide.bottomAnchor constant:-height * 0.01].active = true;
  }
}

- (UILabel *) departDestLabelSetup {
  _departDestLabel = [[UILabel alloc] init];
  _departDestLabel.translatesAutoresizingMaskIntoConstraints = false;
  _departDestLabel.textAlignment = NSTextAlignmentCenter;
  _departDestLabel.font = [UIFont boldSystemFontOfSize:24];
  _departDestLabel.text = @"Departure Destination";
  return _departDestLabel;
}

- (UITextField *) departDestFieldSetup {
  _departDestField = [[UITextField alloc] init];
  _departDestField.translatesAutoresizingMaskIntoConstraints = false;
  _departDestField.keyboardType = UIKeyboardTypeDefault;
  _departDestField.backgroundColor = UIColor.whiteColor;
  _departDestField.borderStyle = UITextBorderStyleRoundedRect;
  _departDestField.enabled = false;
  return _departDestField;
}

- (UILabel *) departTimeLabelSetup {
  _departTimeLabel = [[UILabel alloc] init];
  _departTimeLabel.translatesAutoresizingMaskIntoConstraints = false;
  _departTimeLabel.textAlignment = NSTextAlignmentCenter;
  _departTimeLabel.font = [UIFont boldSystemFontOfSize:24];
  _departTimeLabel.text = @"Departure Time";
  return _departTimeLabel;
}

- (UITextField *) departTimeFieldSetup {
  _departTimeField = [[UITextField alloc] init];
  _departTimeField.translatesAutoresizingMaskIntoConstraints = false;
  _departTimeField.keyboardType = UIKeyboardTypeDefault;
  _departTimeField.backgroundColor = UIColor.whiteColor;
  _departTimeField.borderStyle = UITextBorderStyleRoundedRect;
  _departTimeField.enabled = false;
  return _departTimeField;
}

- (UILabel *) arrivalDestLabelSetup {
  _arrivalDestLabel = [[UILabel alloc] init];
  _arrivalDestLabel.translatesAutoresizingMaskIntoConstraints = false;
  _arrivalDestLabel.textAlignment = NSTextAlignmentCenter;
  _arrivalDestLabel.font = [UIFont boldSystemFontOfSize:24];
  _arrivalDestLabel.text = @"Arrival Destination";
  return _arrivalDestLabel;
}

- (UITextField *) arrivalDestFieldSetup {
  _arrivalDestField = [[UITextField alloc] init];
  _arrivalDestField.translatesAutoresizingMaskIntoConstraints = false;
  _arrivalDestField.keyboardType = UIKeyboardTypeDefault;
  _arrivalDestField.backgroundColor = UIColor.whiteColor;
  _arrivalDestField.borderStyle = UITextBorderStyleRoundedRect;
  _arrivalDestField.enabled = false;
  return _arrivalDestField;
}

- (UILabel *) arrivalTimeLabelSetup {
  _arrivalTimeLabel = [[UILabel alloc] init];
  _arrivalTimeLabel.translatesAutoresizingMaskIntoConstraints = false;
  _arrivalTimeLabel.textAlignment = NSTextAlignmentCenter;
  _arrivalTimeLabel.font = [UIFont boldSystemFontOfSize:24];
  _arrivalTimeLabel.text = @"Arrival Time";
  return _arrivalTimeLabel;
}

- (UITextField *) arrivalTimeFieldSetup {
  _arrivalTimeField = [[UITextField alloc] init];
  _arrivalTimeField.translatesAutoresizingMaskIntoConstraints = false;
  _arrivalTimeField.keyboardType = UIKeyboardTypeDefault;
  _arrivalTimeField.backgroundColor = UIColor.whiteColor;
  _arrivalTimeField.borderStyle = UITextBorderStyleRoundedRect;
  _arrivalTimeField.enabled = false;
  return _arrivalTimeField;
}

- (UILabel *) durationLabelSetup {
  _durationLabel = [[UILabel alloc] init];
  _durationLabel.translatesAutoresizingMaskIntoConstraints = false;
  _durationLabel.textAlignment = NSTextAlignmentCenter;
  _durationLabel.font = [UIFont boldSystemFontOfSize:24];
  _durationLabel.text = @"Duration";
  return _durationLabel;
}

- (UITextField *) durationFieldSetup {
  _durationField = [[UITextField alloc] init];
  _durationField.translatesAutoresizingMaskIntoConstraints = false;
  _durationField.keyboardType = UIKeyboardTypeDefault;
  _durationField.backgroundColor = UIColor.whiteColor;
  _durationField.borderStyle = UITextBorderStyleRoundedRect;
  _durationField.enabled = false;
  return _durationField;
}

- (UILabel *) airlineLabelSetup {
  _airlineLabel = [[UILabel alloc] init];
  _airlineLabel.translatesAutoresizingMaskIntoConstraints = false;
  _airlineLabel.textAlignment = NSTextAlignmentCenter;
  _airlineLabel.font = [UIFont boldSystemFontOfSize:24];
  _airlineLabel.text = @"Airline";
  return _airlineLabel;
}

- (UITextField *) airlineFieldSetup {
  _airlineField = [[UITextField alloc] init];
  _airlineField.translatesAutoresizingMaskIntoConstraints = false;
  _airlineField.keyboardType = UIKeyboardTypeDefault;
  _airlineField.backgroundColor = UIColor.whiteColor;
  _airlineField.borderStyle = UITextBorderStyleRoundedRect;
  _airlineField.enabled = false;
  return _airlineField;
}

- (UILabel *) flightNumberLabelSetup {
  _flightNumberLabel = [[UILabel alloc] init];
  _flightNumberLabel.translatesAutoresizingMaskIntoConstraints = false;
  _flightNumberLabel.textAlignment = NSTextAlignmentCenter;
  _flightNumberLabel.font = [UIFont boldSystemFontOfSize:24];
  _flightNumberLabel.text = @"Flight Number";
  return _flightNumberLabel;
}

- (UITextField *) flightNumberFieldSetup {
  _flightNumberField = [[UITextField alloc] init];
  _flightNumberField.translatesAutoresizingMaskIntoConstraints = false;
  _flightNumberField.keyboardType = UIKeyboardTypeDefault;
  _flightNumberField.backgroundColor = UIColor.whiteColor;
  _flightNumberField.borderStyle = UITextBorderStyleRoundedRect;
  _flightNumberField.enabled = false;
  return _flightNumberField;
}

- (UIButton *) saveButtonSetup {
  _saveButton = [[UIButton alloc] init];
  _saveButton.translatesAutoresizingMaskIntoConstraints = false;
  [_saveButton addTarget:self
                  action:@selector(saveFlight)
        forControlEvents:UIControlEventTouchUpInside];
  [_saveButton setTitle:@"Save This Flight" forState:UIControlStateNormal];
  _saveButton.backgroundColor = UIColor.blueColor;
  return _saveButton;
}

- (void) saveFlight {
  [_viewModel saveFlight:_dataDict];
}

@end
