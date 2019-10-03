#import <UIKit/UIKit.h>
#import "SaveTableViewCell.h"
#import "SaveViewModel.h"
#import "DetailViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SaveTableViewController : UITableViewController

@property (nonatomic,strong) DetailViewController *detailVC;
@property (nonatomic, strong) SaveViewModel *viewModel;
@property (nonatomic, strong) NSArray<FlightSchedule *> *flightArray;

@end

NS_ASSUME_NONNULL_END
