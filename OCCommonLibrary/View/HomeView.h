//
//  HomeView.h
//  OCCommonLibrary
//
//  Created by 周本健 on 2022/2/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeView : UIView<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UIScrollView *sv;
@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) UITableView *tb;

@property (strong, nonatomic) NSMutableArray *dataArray;

// 加载数据
- (void)loadData:(NSMutableArray *)dataArray;

@end

NS_ASSUME_NONNULL_END
