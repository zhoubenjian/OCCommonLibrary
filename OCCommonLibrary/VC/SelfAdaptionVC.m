//
//  SelfAdaptionVC.m
//  OCCommonLibrary
//
//  Created by 周本健 on 2022/2/14.
//

#import "SelfAdaptionVC.h"
#import "SelfAdaptionTableViewCell.h"

#import "Masonry.h"

@interface SelfAdaptionVC ()

@end

@implementation SelfAdaptionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
    self.data = [[NSMutableArray alloc] initWithObjects:@"床前明月光，疑是地上霜。举头望明月，低头思故乡。",
                 @"日照香炉生紫烟，遥看瀑布挂前川。飞流直下三千尺，疑是银河落九天。",
                 @"李白乘舟将欲行，忽闻岸上踏歌声。桃花潭水深千尺，不及汪伦送我情。",
                 @"君不见黄河之水天上来，奔流到海不复回。君不见高堂明镜悲白发，朝如青丝暮成雪。人生得意须尽欢，莫使金樽空对月。天生我材必有用，千金散尽还复来。烹羊宰牛且为乐，会须一饮三百杯。岑夫子，丹丘生，将进酒，杯莫停。与君歌一曲，请君为我倾耳听。钟鼓馔玉不足贵，但愿长醉不复醒。古来圣贤皆寂寞，惟有饮者留其名。陈王昔时宴平乐，斗酒十千恣欢谑。主人何为言少钱，径须沽取对君酌。五花马，千金裘，呼儿将出换美酒，与尔同销万古愁。",
                 nil];
}

- (void)createUI {
    
    self.adaptTableView = [[UITableView alloc] init];                                 // 默认cell高度44
    self.adaptTableView.backgroundColor = UIColor.whiteColor;
    self.adaptTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.adaptTableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);                // 补全分割线
    self.adaptTableView.delegate = self;
    self.adaptTableView.dataSource = self;
    /* 注册 */
    [self.adaptTableView registerClass:[SelfAdaptionTableViewCell class] forCellReuseIdentifier:@"adapt"];
    /* 注册 */
    [self.view addSubview:self.adaptTableView];
    
    
    
    [self.adaptTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(kSCREEN_WIDTH);
        make.height.mas_equalTo(kSCREEN_HEIGHT - kSTATUSBAR_HEIGHT_and_NAVBAR_HEIGHT);
        make.centerX.mas_equalTo(self.view);
        make.top.mas_offset(0);
    }];
}



#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"adapt";
    SelfAdaptionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[SelfAdaptionTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.adaptLabel.text = self.data[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

@end
