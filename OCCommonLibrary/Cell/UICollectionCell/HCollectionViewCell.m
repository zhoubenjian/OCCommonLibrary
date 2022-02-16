//
//  HCollectionViewCell.m
//  OCCommonLibrary
//
//  Created by 周本健 on 2022/2/16.
//

#import "HCollectionViewCell.h"

#import "Masonry.h"

@implementation HCollectionViewCell

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
    
    self.hView = [[UIView alloc] init];
    [self addSubview:self.hView];
    
    
    
    [self.hView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
}

@end
