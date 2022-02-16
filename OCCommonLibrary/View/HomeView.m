//
//  HomeView.m
//  OCCommonLibrary
//
//  Created by 周本健 on 2022/2/11.
//

#import "HomeView.h"
#import "HomeTableViewCell.h"

#import "Masonry.h"

@implementation HomeView

- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = UIColor.greenColor;
        [self createViewUI];
    }

    return self;
}

- (void)createViewUI {
    
    self.sv = [[UIScrollView alloc] init];
    self.sv.backgroundColor = UIColor.whiteColor;
    [self addSubview:self.sv];
    
    self.contentView = [[UIView alloc] init];
    self.contentView.backgroundColor = UIColor.whiteColor;
    [self.sv addSubview:self.contentView];
    
    self.tb = [[UITableView alloc] init];
    self.tb.backgroundColor = UIColor.greenColor;
    self.tb.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tb.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.tb.showsVerticalScrollIndicator = NO;
    self.tb.scrollEnabled = NO;
    /* 注册（自定义cell需注册） */
    [self.tb registerClass:[HomeTableViewCell class] forCellReuseIdentifier:@"home"];
    /* 注册（自定义cell需注册） */
    /* 观察者 */
    [self.tb addObserver:self forKeyPath:@"contentSize" options:0 context:NULL];
    /* 观察者 */
    self.tb.delegate = self;
    self.tb.dataSource = self;
    [self.contentView addSubview:self.tb];
    
    
    
    [self.sv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.sv);
        make.width.mas_equalTo(self.sv);
        make.height.mas_greaterThanOrEqualTo(0);
    }];
    
    [self.tb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.contentView);
        make.height.mas_greaterThanOrEqualTo(0);
    }];
}

// 加载数据
- (void)loadData:(NSMutableArray *)dataArray {
    self.data = [dataArray mutableCopy];
    NSLog(@"%@", self.data);
    // 刷新数据
    [self.tb reloadData];
}



// 更新约束
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {

    [self.tb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_greaterThanOrEqualTo(self.tb.contentSize.height);
    }];
}

// 销毁观察者
- (void)dealloc {
    [self.tb removeObserver:self forKeyPath:@"contentSize"];
}



#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        case 0:
            self.SkipToDefaultVC();
            break;
            
        case 1:
            self.SkipToSelfAdaptVC();
            break;
            
        case 2:
            self.SkipToCommonCollectionVC();
            break;
            
        case 3:
            self.SkipToWaterCollectionVC();
            break;
            
        case 4:
            self.SkipToComplexVC();
            
        default:
            break;
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"home";
    /* 自定义cell需要使用带forIndexPath参数的构造方法 */
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[HomeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.label.text = [NSString stringWithFormat:@"%@", self.data[indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

@end
