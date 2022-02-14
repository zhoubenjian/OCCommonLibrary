//
//  HomeVC.m
//  OCCommonLibrary
//
//  Created by 周本健 on 2022/2/11.
//

#import "HomeVC.h"
#import "DefaultVC.h"
#import "SelfAdaptionVC.h"
#import "CommonCollectionVC.h"
#import "WaterCollectionVC.h"

#import "Masonry.h"

@interface HomeVC ()

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"主页";
    self.view.backgroundColor = UIColor.whiteColor;
    
    self.dataArray = [[NSMutableArray alloc] initWithObjects:@"DefaultTableView", @"SelfAdaptTableView", @"CommonCollectionView", @"WaterCollectionView", nil];
    [self createUI];
}

- (void)createUI {
    
    self.mainView = [[HomeView alloc] init];
    // 加载数据
    [self.mainView loadData:self.dataArray];
    [self.view addSubview:self.mainView];
    
    
    
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    
    
    __weak typeof(self)Self = self;
    self.mainView.SkipToDefaultVC = ^{
        DefaultVC *dVC = [[DefaultVC alloc] init];
        [Self.navigationController pushViewController:dVC animated:YES];
    };
    
    self.mainView.SkipToSelfAdaptVC = ^{
        SelfAdaptionVC *saVC = [[SelfAdaptionVC alloc] init];
        [Self.navigationController pushViewController:saVC animated:YES];
    };
    
    self.mainView.SkipToCommonCollectionVC = ^{
        CommonCollectionVC *ccVC = [[CommonCollectionVC alloc] init];
        [Self.navigationController pushViewController:ccVC animated:YES];
    };
    
    self.mainView.SkipToWaterCollectionVC = ^{
        WaterCollectionVC *wcVC = [[WaterCollectionVC alloc] init];
        [Self.navigationController pushViewController:wcVC animated:YES];
    };
}

@end
