//
//  CommonCollectionViewCell.m
//  OCCommonLibrary
//
//  Created by 周本健 on 2022/2/14.
//

#import "CommonCollectionViewCell.h"

#import "Masonry.h"

@implementation CommonCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = UIColor.whiteColor;
        self.layer.cornerRadius = 10;
        self.layer.masksToBounds = YES;
        [self createCellUI];
    }
    
    return self;
}

- (void)createCellUI {
    
    self.commonView = [[UIView alloc] init];
    self.commonView.layer.cornerRadius = 10;
    self.contentView.backgroundColor = UIColor.purpleColor;
    [self addSubview:self.commonView];
    
    
    
    [self.commonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
}

@end
