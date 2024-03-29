#import <UIKit/UIKit.h>
#import "DeptTableViewCell.h"
#import "DetailViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface DeptTableViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSDictionary *dataDict;
@property (nonatomic, strong) NSArray *sectionArray;
@property (nonatomic, strong) DetailViewController *detailVC;

- (instancetype) initWithDict:(NSDictionary *) dict;

@end

NS_ASSUME_NONNULL_END
