//
//  CommonCollectionView.h
//  OCCommonLibrary
//
//  Created by 周本健 on 2022/2/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CommonCollectionView : UIView<UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) UICollectionViewFlowLayout *layout;
@property (strong, nonatomic) UIScrollView *sv;
@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) UICollectionView *commonCV;

//- (void)loadData;

@end

NS_ASSUME_NONNULL_END
