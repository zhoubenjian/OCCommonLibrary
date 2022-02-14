//
//  DefaultVC.h
//  OCCommonLibrary
//
//  Created by 周本健 on 2022/2/14.
//

#import "BaseVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface DefaultVC : BaseVC<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *defaultTableView;

@end

NS_ASSUME_NONNULL_END
