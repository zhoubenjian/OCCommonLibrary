//
//  CommonCollectionVC.m
//  OCCommonLibrary
//
//  Created by 周本健 on 2022/2/14.
//

#import "CommonCollectionVC.h"

#import "Masonry.h"

@interface CommonCollectionVC ()

@end

@implementation CommonCollectionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"普通";
    self.view.backgroundColor = UIColor.whiteColor;
    [self createUI];
}

- (void)createUI {
    
    self.mainView = [[CommonCollectionView alloc] init];
    [self.view addSubview:self.mainView];
    
    
    
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    
    
    
//    [self.mainView loadData];
}

@end
