//
//  AppDelegate.m
//  Football
//
//  Created by Apple on 2017/9/15.
//  Copyright © 2017年 tiantuo. All rights reserved.
//

#import "AppDelegate.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    NSString *key = @"CFBundleVersion";
    // 上一次的使用版本（存储在沙盒中的版本号）
    NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    // 当前软件的版本号（从Info.plist中获得）
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    
    if ([currentVersion isEqualToString:lastVersion]) {
        // 版本号相同：这次打开和上次打开的是同一个版本
        self.window.rootViewController = [[FBTabBarController alloc] init];
    } else {
        // 这次打开的版本和上一次不一样，显示新特性
        self.window.rootViewController = [[HWNewfeatureViewController alloc] init];
        
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
     //键盘的自适应和回收
    [[IQKeyboardManager sharedManager]setEnable:YES];
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    return YES;
}

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(nullable UIWindow *)window

{
    
    if (_allowRotation == YES) {
        
        return UIInterfaceOrientationMaskLandscapeLeft;
        
    }else{
        
        return (UIInterfaceOrientationMaskPortrait);
        
    }
    
}



- (void)applicationWillResignActive:(UIApplication *)application {
    self.allowRotation = NO;
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
   self.allowRotation = NO;
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
   self.allowRotation = NO;
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    self.allowRotation =NO;
}


- (void)applicationWillTerminate:(UIApplication *)application {
    self.allowRotation =NO;
}


@end
