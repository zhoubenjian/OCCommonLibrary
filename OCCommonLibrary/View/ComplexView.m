//
//  ComplexView.m
//  OCCommonLibrary
//
//  Created by 周本健 on 2022/2/16.
//

#import "ComplexView.h"
#import "HCollectionViewCell.h"
#import "CommonCollectionViewCell.h"
#import "HighCollectionViewCell.h"
#import "LowCollectionViewCell.h"
#import "Tools.h"

#import "Masonry.h"

@implementation ComplexView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = UIColor.whiteColor;
        [self createViewUI];
    }
    
    return self;
}

- (void)createViewUI {
    
    self.sv = [[UIScrollView alloc] init];
    self.sv.backgroundColor = UIColor.whiteColor;
    [self addSubview:self.sv];
    
    self.contentView = [[UIView alloc] init];
    self.contentView.backgroundColor = UIColor.whiteColor;
    [self.sv addSubview:self.contentView];
    
    self.hLabel = [[UILabel alloc] init];
    self.hLabel.text = @"hcv";
    [self.contentView addSubview:self.hLabel];
    
    self.hcv = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.hLayout];
    self.hcv.backgroundColor = UIColor.greenColor;
    self.hcv.showsHorizontalScrollIndicator = NO;        // 隐藏滑动条
    // 注册
    [self.hcv registerClass:[HCollectionViewCell class] forCellWithReuseIdentifier:@"horizontal"];
    self.hcv.delegate = self;
    self.hcv.dataSource = self;
    [self.contentView addSubview:self.hcv];
    
    self.tLabel = [[UILabel alloc] init];
    self.tLabel.text = @"tcv";
    [self.contentView addSubview:self.tLabel];
    
    self.tv = [[UITableView alloc] init];
    self.tv.backgroundColor = UIColor.whiteColor;
    self.tv.showsVerticalScrollIndicator = NO;          // 隐藏滑动条
    self.tv.scrollEnabled = NO;                         // 禁止滑动
    self.tv.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tv.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    // 观察者（forKeyPath必须是：contentSize）
    [self.tv addObserver:self forKeyPath:@"contentSize" options:0 context:NULL];
    self.tv.delegate = self;
    self.tv.dataSource = self;
    [self.contentView addSubview:self.tv];
    
    self.vLabel = [[UILabel alloc] init];
    self.vLabel.text = @"vcv";
    [self.contentView addSubview:self.vLabel];
    
    self.vcv = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.vLayout];
    self.vcv.backgroundColor = UIColor.cyanColor;
    self.vcv.showsVerticalScrollIndicator = NO;         // 隐藏滑动条
    // 注册
    [self.vcv registerClass:[CommonCollectionViewCell class] forCellWithReuseIdentifier:@"vertical"];
    // 观察者（forKeyPath必须是：contentSize）
    [self.vcv addObserver:self forKeyPath:@"contentSize" options:0 context:NULL];
    self.vcv.delegate = self;
    self.vcv.dataSource = self;
    [self.contentView addSubview:self.vcv];
    
    self.wLabel = [[UILabel alloc] init];
    self.wLabel.text = @"vcv";
    [self.contentView addSubview:self.wLabel];
    
    self.wcv = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.wLayout];
    self.wcv.backgroundColor = UIColor.magentaColor;
    self.wcv.showsVerticalScrollIndicator = NO;         // 隐藏滑动条
    // 注册
    [self.wcv registerClass:[LowCollectionViewCell class] forCellWithReuseIdentifier:@"low"];
    [self.wcv registerClass:[HighCollectionViewCell class] forCellWithReuseIdentifier:@"high"];
    // 观察者（forKeyPath必须是：contentSize）
    [self.wcv addObserver:self forKeyPath:@"contentSize" options:0 context:NULL];
    self.wcv.delegate = self;
    self.wcv.dataSource = self;
    [self.contentView addSubview:self.wcv];
    
    
    
    [self.sv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.sv);
        make.width.mas_equalTo(self.sv);
        make.height.mas_greaterThanOrEqualTo(0);
    }];

    [self.hLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_greaterThanOrEqualTo(0);
        make.height.mas_equalTo(40);
        make.centerX.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.contentView.mas_top).mas_offset(5);
    }];

    [self.hcv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.contentView);
        make.height.mas_equalTo((kSCREEN_WIDTH - 40) / 4 + 20);
        make.top.mas_equalTo(self.hLabel.mas_bottom).mas_offset(0);
        make.centerX.mas_equalTo(self.contentView);
    }];

    [self.tLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_greaterThanOrEqualTo(0);
        make.height.mas_offset(40);
        make.centerX.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.hcv.mas_bottom).mas_offset(5);
    }];

    [self.tv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.contentView);
        make.height.mas_greaterThanOrEqualTo(0);
        make.centerX.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.tLabel.mas_bottom).mas_offset(0);
    }];
    
    [self.vLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_greaterThanOrEqualTo(0);
        make.height.mas_offset(40);
        make.centerX.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.tv.mas_bottom).mas_offset(5);
    }];
    
    [self.vcv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.contentView);
        make.height.mas_greaterThanOrEqualTo(0);
        make.centerX.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.vLabel.mas_bottom).mas_offset(0);
    }];
    
    [self.wLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_greaterThanOrEqualTo(0);
        make.height.mas_offset(40);
        make.centerX.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.vcv.mas_bottom).mas_offset(0);
    }];
    
    [self.wcv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.contentView);
        make.height.mas_greaterThanOrEqualTo(0);
        make.centerX.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.wLabel.mas_bottom).mas_offset(0);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).mas_offset(-5);
    }];
}



#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"第%ld行", indexPath.row + 1);
    [Tools ShowMsg:[NSString stringWithFormat:@"tv：第%ld行", indexPath.row + 1]];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 13;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"subtitle";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;        // 无点击样式
    cell.backgroundColor = [Tools randomColor];
    return cell;
}



#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([collectionView isEqual:self.hcv]) {
        NSLog(@"hcv第：%ld个Item", indexPath.row + 1);
        [Tools ShowMsg:[NSString stringWithFormat:@"hcv第：%ld个Item", indexPath.row + 1]];
    } else if ([collectionView isEqual:self.vcv]) {
        NSLog(@"vcv第：%ld个Item", indexPath.row + 1);
        [Tools ShowMsg:[NSString stringWithFormat:@"vcv第：%ld个Item", indexPath.row + 1]];
    } else if ([collectionView isEqual:self.wcv]) {
        NSLog(@"wcv第：%ld个Item", indexPath.row + 1);
        [Tools ShowMsg:[NSString stringWithFormat:@"wcv第：%ld个Item", indexPath.row + 1]];
    }
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    if ([collectionView isEqual:self.hcv]) {
        return 10;
    } else if ([collectionView isEqual:self.vcv]) {
        return 15;
    } else if ([collectionView isEqual:self.wcv]) {
        return 20;
    }
    
    return 0;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([collectionView isEqual:self.hcv]) {
        
        static NSString *identifier = @"horizontal";
        HCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
        cell.hView.backgroundColor = UIColor.systemPinkColor;
        return cell;
        
    } else if ([collectionView isEqual:self.vcv]) {
        
        static NSString *identifier = @"vertical";
        CommonCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
        return cell;
        
    } else if ([collectionView isEqual:self.wcv]) {
        
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
    
    return [[UICollectionViewCell alloc] init];
}



#pragma mark - 观察者——更新约束
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    [self.tv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_greaterThanOrEqualTo(self.tv.contentSize.height);
    }];
    
    [self.vcv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_greaterThanOrEqualTo(self.hcv.mas_bottom).offset(self.tv.contentSize.height + 10);
        make.height.mas_greaterThanOrEqualTo(self.vcv.contentSize.height);
    }];
    
    [self.wcv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_greaterThanOrEqualTo(self.hcv.mas_bottom).offset(self.tv.contentSize.height + self.vcv.contentSize.height + 15);
        make.height.mas_greaterThanOrEqualTo(self.wcv.contentSize.height);
    }];
}

#pragma mark - 观察者——销毁
- (void)dealloc {
    [self.tv removeObserver:self forKeyPath:@"contentSize"];
    [self.vcv removeObserver:self forKeyPath:@"contentSize"];
    [self.wcv removeObserver:self forKeyPath:@"contentSize"];
}



#pragma mark - 初始化hLayout
- (UICollectionViewFlowLayout *)hLayout {
    
    if (_hLayout == nil) {
        _hLayout = [[UICollectionViewFlowLayout alloc] init];
        
        // 滑动方向：水平
        _hLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        // Item大小
        _hLayout.itemSize = CGSizeMake((kSCREEN_WIDTH - 50) / 4, (kSCREEN_WIDTH - 50) / 4);
        // 行间距(纵向间距)
        _hLayout.minimumInteritemSpacing = 0;
        // 列间距(横向间距)
        _hLayout.minimumLineSpacing = 10;
        _hLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    }
    
    return _hLayout;
}

#pragma mark - 初始化vLayout
- (UICollectionViewFlowLayout *)vLayout {
    
    if (_vLayout == nil) {
        _vLayout = [[UICollectionViewFlowLayout alloc] init];
        
        // 滑动方向：竖直
        _vLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        // Item大小
        _vLayout.itemSize = CGSizeMake((kSCREEN_WIDTH - 30) / 2, 200);
        // 行间距(纵向间距)
        _vLayout.minimumInteritemSpacing = 10;
        // 列间距(横向间距)
        _vLayout.minimumLineSpacing = 10;
        _vLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    }
    
    return _vLayout;
}

#pragma mark - 初始化wLayout
- (TwoColumnWaterFlowLayout *)wLayout {
    if (_wLayout == nil) {
        // layout内部有设置默认属性
        _wLayout = [[TwoColumnWaterFlowLayout alloc] init];
        // 计算每个item高度方法，必须实现（也可以设计为代理实现）
        //        __weak typeof(self) weakSelf = self;
        [_wLayout computeIndexCellHeightWithWidthBlock:^CGFloat(NSIndexPath *indexPath, CGFloat width) {
            if (indexPath.row % 2 == 0 || indexPath.row % 3 == 0) {
                return 195.0;
            } else {
                return 400.0;
            }
        }];
        // 内间距
        _wLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    }
    
    return _wLayout;
}

@end
