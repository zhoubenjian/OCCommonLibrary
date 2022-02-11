//
//  HomeVC.h
//  OCCommonLibrary
//
//  Created by 周本健 on 2022/2/11.
//

#import "BaseVC.h"
#import "HomeView.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeVC : BaseVC

@property (strong, nonatomic) HomeView *mainView;

@property (strong, nonatomic) NSMutableArray *dataArray;

@end

NS_ASSUME_NONNULL_END
