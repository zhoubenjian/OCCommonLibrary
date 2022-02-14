//
//  SelfAdaptionVC.h
//  OCCommonLibrary
//
//  Created by 周本健 on 2022/2/14.
//

#import "BaseVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface SelfAdaptionVC : BaseVC<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *adaptTableView;

@property (strong, nonatomic) NSMutableArray *data;

@end

NS_ASSUME_NONNULL_END
