//
//  AppDelegate.m
//  TableViewApp
//
//  Created by HuS on 15/6/4.
//  Copyright (c) 2015年 HuS. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //改变状态栏风格,需要在项目info中配置View controller-based status bar appearance为NO
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    //设置导航栏背景颜色
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:231.0/255.0 green:95.0/255.0 blue:53.0/255.0 alpha:0.3]];
    //设置导航栏返回颜色
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    //设置导航栏标题颜色和字体
    [[UINavigationBar appearance] setTitleTextAttributes:
                @{NSFontAttributeName:[UIFont fontWithName:@"AvenirNextCondensed-DemiBold" size:20],
                            NSForegroundColorAttributeName:[UIColor whiteColor]}];
    //设置到toolbar颜色和以及barbutton颜色
    [[UIBarButtonItem appearance] setTintColor:[UIColor colorWithRed:235.0/255.0 green:73.0/255.0 blue:27.0/255.0 alpha:1.0]];
    [[UIToolbar appearance] setBarTintColor:[UIColor colorWithRed:237.0/255.0 green:240.0/255.0 blue:243.0/255.0 alpha:0.5]];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
