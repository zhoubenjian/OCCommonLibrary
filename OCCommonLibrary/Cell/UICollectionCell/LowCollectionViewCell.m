//
//  LowCollectionViewCell.m
//  OCCommonLibrary
//
//  Created by 周本健 on 2022/2/14.
//

#import "LowCollectionViewCell.h"

#import "Masonry.h"

@implementation LowCollectionViewCell

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
    
    self.lowView = [[UIView alloc] init];
    self.lowView.layer.cornerRadius = 10;
    self.lowView.backgroundColor = UIColor.systemRedColor;
    [self addSubview:self.lowView];
    
    
    
    [self.lowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
}

@end
