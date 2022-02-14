//
//  WaterCollectionVC.h
//  OCCommonLibrary
//
//  Created by 周本健 on 2022/2/14.
//

#import "BaseVC.h"
#import "TwoColumnWaterFlowLayout.h"

NS_ASSUME_NONNULL_BEGIN

@interface WaterCollectionVC : BaseVC<UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) TwoColumnWaterFlowLayout *tcwFlowLayout;
@property (strong, nonatomic) UICollectionView *waterCV;

@end

NS_ASSUME_NONNULL_END
