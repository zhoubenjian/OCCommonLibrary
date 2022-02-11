//
//  HomeVC.m
//  OCCommonLibrary
//
//  Created by 周本健 on 2022/2/11.
//

#import "HomeVC.h"

#import "Masonry.h"

@interface HomeVC ()

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"主页";
    self.view.backgroundColor = UIColor.whiteColor;
    
    self.dataArray = [[NSMutableArray alloc] initWithObjects:@"DefaultTableView", @"DefaultTableView", @"DefaultTableView", @"DefaultTableView", nil];
    [self createUI];
    
}

- (void)createUI {
    
    self.mainView = [[HomeView alloc] init];
    [self.view addSubview:self.mainView];
    
    
    
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    
    
    [self.mainView loadData:self.dataArray];
}

@end
