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

@property (copy, nonatomic) void (^SkipToDefaultVC)(void);
@property (copy, nonatomic) void (^SkipToSelfAdaptVC)(void);
@property (copy, nonatomic) void (^SkipToCommonCollectionVC)(void);
@property (copy, nonatomic) void (^SkipToWaterCollectionVC)(void);

@property (strong, nonatomic) NSMutableArray *data;

// 加载数据
- (void)loadData:(NSMutableArray *)dataArray;

@end

NS_ASSUME_NONNULL_END
