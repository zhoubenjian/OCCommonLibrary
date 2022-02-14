//
//  HighCollectionViewCell.m
//  OCCommonLibrary
//
//  Created by 周本健 on 2022/2/14.
//

#import "HighCollectionViewCell.h"

#import "Masonry.h"

@implementation HighCollectionViewCell

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
    
    self.highView = [[UIView alloc] init];
    self.highView.layer.cornerRadius = 10;
    self.highView.backgroundColor = UIColor.systemPinkColor;
    [self addSubview:self.highView];
    
    
    
    [self.highView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
}

@end
