//
//  TestViewController.m
//  Football
//
//  Created by Apple on 2017/10/27.
//  Copyright © 2017年 tiantuo. All rights reserved.
//

#import "TestViewController.h"
#import "AppDelegate.h"
@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenColor];
    UIView *redView = [[UIView alloc]initWithFrame:CGRectMake(0, STATUS_BAR_HEIGHT,sHeight ,sWidth )];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    [self wr_setNavBarBarTintColor:[UIColor orangeColor]];
//    AppDelegate * appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//
//    appDelegate.allowRotation = YES;//(以上2行代码,可以理解为打开横屏开关)
//
//    [self setNewOrientation:YES];//调用转屏代码
   
   
}

- (void)setNewOrientation:(BOOL)fullscreen

{
    
    if (fullscreen) {
        
        NSNumber *resetOrientationTarget = [NSNumber numberWithInt:UIInterfaceOrientationUnknown];
        
        [[UIDevice currentDevice] setValue:resetOrientationTarget forKey:@"orientation"];
        
        
        
        NSNumber *orientationTarget = [NSNumber numberWithInt:UIInterfaceOrientationLandscapeLeft];
        
        [[UIDevice currentDevice] setValue:orientationTarget forKey:@"orientation"];
        
    }else{
        
        NSNumber *resetOrientationTarget = [NSNumber numberWithInt:UIInterfaceOrientationUnknown];
        
        [[UIDevice currentDevice] setValue:resetOrientationTarget forKey:@"orientation"];
        
        
        
        NSNumber *orientationTarget = [NSNumber numberWithInt:UIInterfaceOrientationPortrait];
        
        [[UIDevice currentDevice] setValue:orientationTarget forKey:@"orientation"];
        
    }
    
}
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

//设置是否隐藏
- (BOOL)prefersStatusBarHidden {
    //    [super prefersStatusBarHidden];
    return NO;
}

//设置隐藏动画
- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation {
    return UIStatusBarAnimationNone;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = NO;

}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    AppDelegate * appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    appDelegate.allowRotation = NO;//关闭横屏仅允许竖屏
    
    [self setNewOrientation:NO];
     self.navigationController.navigationBar.hidden = NO;
}
@end
