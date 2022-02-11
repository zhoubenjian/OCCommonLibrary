//
//  HomeTableViewCell.m
//  OCCommonLibrary
//
//  Created by 周本健 on 2022/2/11.
//

#import "HomeTableViewCell.h"

#import "Masonry.h"

@implementation HomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = UIColor.whiteColor;
        
        [self createCellUI];
    }
    
    return self;
}



- (void)createCellUI {
    
    self.label = [[UILabel alloc] init];
    [self addSubview:self.label];
    
    
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_greaterThanOrEqualTo(0);
        make.height.mas_equalTo(40);
        make.center.mas_equalTo(self);
    }];
}

@end
