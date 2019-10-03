#import "DeptTableViewController.h"

@interface DeptTableViewController ()

@end

@implementation DeptTableViewController

- (id) initWithDict:(NSDictionary *) dict{
  _dataDict = dict;
  _sectionArray = @[@"Outbund Trip", @"Inbound Trip"];
  return [self initWithStyle:UITableViewStylePlain];
}

- (void)viewDidLoad {
  self.tableView.delegate = self;
  self.tableView.dataSource = self;
  
  dispatch_async(dispatch_get_main_queue(), ^{
    [self.tableView reloadData];
  });
  
  [super viewDidLoad];
  [self.tableView registerNib:[UINib nibWithNibName:@"DeptTableViewCell" bundle:nil] forCellReuseIdentifier:@"DeptCell"];
  self.tableView.rowHeight = 54;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  NSString *key = _sectionArray[section];
  NSArray *array = _dataDict[key];
  return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  NSString *key = _sectionArray[indexPath.section];
  NSDictionary *dict = _dataDict[key][indexPath.row][@"FlightSegment"];
  DeptTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DeptCell" forIndexPath:indexPath];
  cell.departDest.text = dict[@"DepartureAirport"][@"LocationCode"];
  cell.arriveDest.text = dict[@"ArrivalAirport"][@"LocationCode"];
  cell.departTime.text = [dict[@"DepartureDateTime"] stringByReplacingOccurrencesOfString:@"T" withString:@" "];
  return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
  return _sectionArray[section];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  UINavigationController *navVC = (UINavigationController *) UIApplication.sharedApplication.keyWindow.rootViewController;
  NSString *key = _sectionArray[indexPath.section];
  NSDictionary *_dict = _dataDict[key][indexPath.row][@"FlightSegment"];
  NSDictionary *dict = @{ @"DepartDest" : _dict[@"DepartureAirport"][@"LocationCode"],
                          @"DepartTime" : _dict[@"DepartureDateTime"],
                          @"ArrivalDest" : _dict[@"ArrivalAirport"][@"LocationCode"],
                          @"ArrivalTime" : _dict[@"ArrivalDateTime"],
                          @"Duration" : _dict[@"JourneyDuration"],
                          @"Airline" : _dict[@"OperatingAirline"][@"Value"],
                          @"FlightNumber" : _dict[@"FlightNumber"]
  };
  _detailVC = [[DetailViewController alloc] initWithDict:dict button:true];
  [navVC pushViewController:_detailVC animated:YES];
}

@end
