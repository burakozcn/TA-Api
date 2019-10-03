#import "SaveTableViewController.h"

@interface SaveTableViewController ()

@end

@implementation SaveTableViewController

-(id) init {
  _viewModel = [[SaveViewModel alloc] init];
  _flightArray = [_viewModel savedFlightFetch];
  return [self initWithStyle:UITableViewStylePlain];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  [self.tableView registerNib:[UINib nibWithNibName:@"SaveTableViewCell" bundle:nil] forCellReuseIdentifier:@"SaveViewCell"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return _flightArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  SaveTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SaveViewCell" forIndexPath:indexPath];
  cell.arriveDest.text = _flightArray[indexPath.row].arrivalDest;
  cell.departDest.text = _flightArray[indexPath.row].departDest;
  cell.departTime.text = [_flightArray[indexPath.row].departTime stringByReplacingOccurrencesOfString:@"T" withString:@" "];
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  FlightSchedule *flight = _flightArray[indexPath.row];
  NSDictionary *dict = @{ @"DepartDest" : flight.departDest,
                          @"DepartTime" : flight.departTime,
                          @"ArrivalDest" : flight.arrivalDest,
                          @"ArrivalTime" : flight.arrivalTime,
                          @"Duration" : flight.duration,
                          @"Airline" : flight.airline,
                          @"FlightNumber" : flight.flightNumber
  };
  [self showAlertWithDict:dict];
}

-(void) showAlertWithDict:(NSDictionary *) dict {
  UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Option" message:@"Please choose an option" preferredStyle:UIAlertControllerStyleActionSheet];
  UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"Open Detail" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    UINavigationController *navVC = (UINavigationController *)UIApplication.sharedApplication.keyWindow.rootViewController;
    self->_detailVC = [[DetailViewController alloc] initWithDict:dict button:false];
    [navVC pushViewController:self->_detailVC animated:YES];
  }];
  UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"Delete This Flight" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    [self->_viewModel deleteFlight:dict];
  }];
  [alert addAction:action1];
  [alert addAction:action2];
  [UIApplication.sharedApplication.keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
}

@end
