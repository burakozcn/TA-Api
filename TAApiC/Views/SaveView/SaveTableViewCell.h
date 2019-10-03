#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SaveTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *departDest;
@property (weak, nonatomic) IBOutlet UILabel *arriveDest;
@property (weak, nonatomic) IBOutlet UILabel *departTime;

@end

NS_ASSUME_NONNULL_END
