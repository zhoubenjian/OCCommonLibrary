//
//  WaterCollectionVC.m
//  OCCommonLibrary
//
//  Created by 周本健 on 2022/2/14.
//

#import "WaterCollectionVC.h"
#import "HighCollectionViewCell.h"
#import "LowCollectionViewCell.h"
#import "Tools.h"

#import "Masonry.h"
#import "MBProgressHUD.h"

@interface WaterCollectionVC ()

@end

@implementation WaterCollectionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"瀑布流";
    [self createUI];
}

- (void)createUI {
    
    self.waterCV = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.tcwFlowLayout];
    /* 注册 */
    [self.waterCV registerClass:[HighCollectionViewCell class] forCellWithReuseIdentifier:@"high"];
    [self.waterCV registerClass:[LowCollectionViewCell class] forCellWithReuseIdentifier:@"low"];
    /* 注册 */
    self.waterCV.delegate = self;
    self.waterCV.dataSource = self;
    [self.view addSubview:self.waterCV];
    
    
    
    [self.waterCV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}



#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"点击了WaterCollectionView：第%ld个Item", indexPath.row + 1);
    [Tools ShowMsg:[NSString stringWithFormat:@"第%ld个Item", indexPath.row + 1]];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 30;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *low = @"low";
    static NSString *high = @"high";
    if (indexPath.row % 2 == 0 || indexPath.row % 3 == 0) {
        
        LowCollectionViewCell *lowCell = [collectionView dequeueReusableCellWithReuseIdentifier:low forIndexPath:indexPath];
        return lowCell;
        
    } else {
        
        HighCollectionViewCell *highCell = [collectionView dequeueReusableCellWithReuseIdentifier:high forIndexPath:indexPath];
        return highCell;
    }

}



// 初始化tcwFlowLayout
- (TwoColumnWaterFlowLayout *)tcwFlowLayout {
    if (_tcwFlowLayout == nil) {
        // layout内部有设置默认属性
        _tcwFlowLayout = [[TwoColumnWaterFlowLayout alloc] init];
        // 计算每个item高度方法，必须实现（也可以设计为代理实现）
        //        __weak typeof(self) weakSelf = self;
        [_tcwFlowLayout computeIndexCellHeightWithWidthBlock:^CGFloat(NSIndexPath *indexPath, CGFloat width) {
            if (indexPath.row % 2 == 0 || indexPath.row % 3 == 0) {
                return 195.0;
            } else {
                return 400.0;
            }
        }];
        // 内间距
        _tcwFlowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    }
    return _tcwFlowLayout;
}

@end
