//
//  ComplexVC.m
//  OCCommonLibrary
//
//  Created by 周本健 on 2022/2/16.
//

#import "ComplexVC.h"

#import "Masonry.h"

@interface ComplexVC ()

@end

@implementation ComplexVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"复合";
    
    self.view.backgroundColor = UIColor.whiteColor;
    [self createUI];
}

- (void)createUI {
    
    self.mainView = [[ComplexView alloc] init];
    [self.view addSubview:self.mainView];
    
    
    
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

@end
