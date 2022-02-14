//
//  SelfAdaptionTableViewCell.m
//  OCCommonLibrary
//
//  Created by 周本健 on 2022/2/14.
//

#import "SelfAdaptionTableViewCell.h"

#import "Masonry.h"

@implementation SelfAdaptionTableViewCell

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
    
    self.adaptLabel = [[UILabel alloc] init];
    self.adaptLabel.numberOfLines = 0;      // 多行文本
    [self addSubview:self.adaptLabel];
    
    
    
    [self.adaptLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(5);
        make.left.mas_offset(50);
        make.bottom.mas_offset(-5);
        make.right.mas_offset(-50);
    }];
}

@end
