//
//  AppDelegate.m
//  OCCommonLibrary
//
//  Created by 周本健 on 2022/2/11.
//

#import "AppDelegate.h"
#import "ViewController.h"

#import "Tools.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (void)createNavigationVC {
    
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.navigation = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
    
    /* 修复Swift5.5后，iOS 13导航栏黑色背景 */
    if (@available(iOS 13.0, *)) {
        UINavigationBarAppearance *appearance = [[UINavigationBarAppearance alloc] init];
        appearance.backgroundColor = [Tools colorWithHex:@"#EE82EE"];
        // 避免导航栏标题无效
        [appearance setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:17.0],
                                             NSForegroundColorAttributeName:[UIColor whiteColor]}];
        
        self.navigation.navigationBar.standardAppearance = appearance;
        self.navigation.navigationBar.scrollEdgeAppearance = appearance;
    }
    /* 修复Swift5.5后，iOS 13导航栏黑色背景 */
    
    [self.navigation.navigationBar setTranslucent:NO];
    [self.navigation.navigationBar setShadowImage:[[UIImage alloc] init]];
    [self.navigation.navigationBar setBarTintColor:[Tools colorWithHex:@"#EE82EE"]];
    [self.navigation.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:17.0],
                                                     NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.window.rootViewController = self.navigation;
    [self.window makeKeyAndVisible];
}


#pragma mark - UISceneSession lifecycle


//- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
//    // Called when a new scene session is being created.
//    // Use this method to select a configuration to create the new scene with.
//    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
//}
//
//
//- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
//    // Called when the user discards a scene session.
//    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//}


@end
