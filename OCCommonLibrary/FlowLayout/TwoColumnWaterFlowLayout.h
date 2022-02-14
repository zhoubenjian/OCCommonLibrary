//
//  TwoColumnWaterFlowLayout.h
//  OC QuShiHuo
//
//  Created by 周本健 on 2019/7/2.
//  Copyright © 2019 Personal. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef CGFloat(^HeightBlock)(NSIndexPath *index, CGFloat width);
@interface TwoColumnWaterFlowLayout : UICollectionViewFlowLayout

/** 列数 **/
@property(nonatomic, assign) NSInteger lineNumber;
/** 行列数 **/
@property(nonatomic, assign) CGFloat rowSpacing;
/** 列间距 **/
@property(nonatomic, assign) CGFloat lineSpacing;
/** 内边距 **/
@property(nonatomic, assign) UIEdgeInsets sectionInsets;

/**
 计算各个item高度方法 必须实现
 
 @param block 设计计算item高度block
 */
- (void)computeIndexCellHeightWithWidthBlock:(CGFloat(^)(NSIndexPath *indexPath, CGFloat width))block;

@end


