//
//  ComplexView.h
//  OCCommonLibrary
//
//  Created by 周本健 on 2022/2/16.
//

#import <UIKit/UIKit.h>
#import "TwoColumnWaterFlowLayout.h"

NS_ASSUME_NONNULL_BEGIN

@interface ComplexView : UIView<UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) UIScrollView *sv;
@property (strong, nonatomic) UIView *contentView;

@property (strong, nonatomic) UILabel *hLabel;
@property (strong, nonatomic) UICollectionViewFlowLayout *hLayout;
@property (strong, nonatomic) UICollectionView *hcv;        // 横向CollectionView

@property (strong, nonatomic) UILabel *tLabel;
@property (strong, nonatomic) UITableView *tv;              // TableView

@property (strong, nonatomic) UILabel *vLabel;
@property (strong, nonatomic) UICollectionViewFlowLayout *vLayout;
@property (strong, nonatomic) UICollectionView *vcv;        // 纵向CollectionView

@property (strong, nonatomic) UILabel *wLabel;
@property (strong, nonatomic) TwoColumnWaterFlowLayout *wLayout;
@property (strong, nonatomic) UICollectionView *wcv;        // 瀑布流CollectionView

@end

NS_ASSUME_NONNULL_END
