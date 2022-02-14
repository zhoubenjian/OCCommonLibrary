//
//  DefaultVC.m
//  OCCommonLibrary
//
//  Created by 周本健 on 2022/2/14.
//

#import "DefaultVC.h"

#import "Masonry.h"

@interface DefaultVC ()

@end

@implementation DefaultVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"默认";
    [self createUI];
}

- (void)createUI {
    
    self.defaultTableView = [[UITableView alloc] init];                                 // 默认cell高度44
    self.defaultTableView.backgroundColor = UIColor.whiteColor;
    self.defaultTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.defaultTableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);                // 补全分割线
    self.defaultTableView.dataSource = self;
    [self.view addSubview:self.defaultTableView];
    
    
    
    [self.defaultTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(kSCREEN_WIDTH);
        make.height.mas_equalTo(kSCREEN_HEIGHT - kSTATUSBAR_HEIGHT_and_NAVBAR_HEIGHT);
        make.centerX.mas_equalTo(self.view);
        make.top.mas_offset(0);
    }];
}



#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"default";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"Default-%ld", indexPath.row + 1];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

@end
