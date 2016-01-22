//
//  AppDelegate.m
//  Objc0121
//
//  Created by 劉坤昶 on 2016/1/21.
//  Copyright © 2016年 劉坤昶 Johnny. All rights reserved.
//

#import "AppDelegate.h"
#import "MainTVC.h"
#import "ClassListTVC.h"


@interface AppDelegate ()

@property(strong,nonatomic) UITabBarController *tabBarController;
@property(strong,nonatomic) UIImage *tabIcon;
@property(strong,nonatomic) UIImage *tabSelectedIcon;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{


    
    MainTVC *onePage = [MainTVC new];
    UINavigationController *onePageNav = [[UINavigationController alloc] initWithRootViewController:onePage];
    self.tabIcon = [UIImage imageNamed:@"001"];
    self.tabSelectedIcon = [UIImage imageNamed:@"001"];
    onePage.tabBarItem =
    [[UITabBarItem alloc] initWithTitle:@"探索" image:self.tabIcon selectedImage:self.tabSelectedIcon];
    
    ClassListTVC *twoPage = [ClassListTVC new];
    UINavigationController *twoPageNav = [[UINavigationController alloc] initWithRootViewController:twoPage];
    self.tabIcon = [UIImage imageNamed:@"002"];
    self.tabSelectedIcon = [UIImage imageNamed:@"002"];
    twoPage.tabBarItem =
    [[UITabBarItem alloc] initWithTitle:@"課程列表" image:self.tabIcon selectedImage:self.tabSelectedIcon];
    
    
    NSArray *controllers = [[NSArray alloc] initWithObjects:onePageNav,twoPageNav, nil];
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = controllers;
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    
    
    
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
