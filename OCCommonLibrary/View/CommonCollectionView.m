//
//  CommonCollectionView.m
//  OCCommonLibrary
//
//  Created by 周本健 on 2022/2/14.
//

#import "CommonCollectionView.h"
#import "CommonCollectionViewCell.h"
#import "Tools.h"

#import "Masonry.h"

@implementation CommonCollectionView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = UIColor.whiteColor;
        [self createViewUI];
    }
    
    return self;
}

- (void)createViewUI {
    
    self.commonCV = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.layout];
    self.commonCV.backgroundColor = UIColor.whiteColor;
    /* 注册 */
    [self.commonCV registerClass:[CommonCollectionViewCell class] forCellWithReuseIdentifier:@"common"];
    /* 注册 */
//    /* 观察者 */
//    [self.commonCV addObserver:self forKeyPath:@"ContentHeight" options:0 context:NULL];
//    /* 观察者 */
    self.commonCV.delegate = self;
    self.commonCV.dataSource = self;
    [self addSubview:self.commonCV];
    
    

    [self.commonCV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
}



//#pragma mark - 重写observeValueForKeyPath方法，一旦UICollectionView的contentSize发生改变，就会调用这个方法
//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
//    [self.commonCV mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.height.mas_greaterThanOrEqualTo(self.commonCV.collectionViewLayout.collectionViewContentSize.height);
//    }];
//}
//
//#pragma mark - 销毁
//- (void)dealloc {
//    [self.commonCV removeObserver:self forKeyPath:@"ContentHeight"];
//}



#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"点击了CommonCollectionView：第%ld行", indexPath.row + 1);
    [Tools ShowMsg:[NSString stringWithFormat:@"第%ld行", indexPath.row + 1]];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"common";
    CommonCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    return cell;
}



#pragma mark - 初始化layout
- (UICollectionViewFlowLayout *)layout {
    if (_layout == nil) {
        _layout = [[UICollectionViewFlowLayout alloc] init];
        
        // 滑动方向
        _layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        // Item大小
        _layout.itemSize = CGSizeMake((kSCREEN_WIDTH - 30) / 2, 200);
        // 行间距(纵向间距)
        _layout.minimumInteritemSpacing = 10;
        // 列间距(横向间距)
        _layout.minimumLineSpacing = 10;
        _layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    }
    return _layout;
}

@end
