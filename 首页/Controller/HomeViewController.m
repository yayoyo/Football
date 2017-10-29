//
//  HomeViewController.m
//  Football
//
//  Created by Apple on 2017/10/16.
//  Copyright © 2017年 tiantuo. All rights reserved.
//

#import "HomeViewController.h"
#import "IQTextView.h"
#import "TestViewController.h"
#import "AppDelegate.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>
@interface HomeViewController ()<UIScrollViewDelegate,TZImagePickerControllerDelegate>
{
    TZImagePickerController *imagePickerVc;
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatRightItem:@"test" normalImage:nil selectImage:nil];
//    [self wr_setNavBarBarTintColor:[UIColor orangeColor]];
   
    // 设置初始导航栏透明度
//    self.navigationController.navigationBar.alpha = 0 ;
//
//    // 设置导航栏按钮和标题颜色
//    [self wr_setNavBarTintColor:[UIColor whiteColor]];
//    UIScrollView * testScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, sWidth, sHeight - HOME_INDICATOR_HEIGHT)];
//    testScrollView.backgroundColor = [UIColor redColor];
//    testScrollView.contentSize = CGSizeMake(sWidth, sHeight - HOME_INDICATOR_HEIGHT);
//    testScrollView.showsVerticalScrollIndicator = NO;
//    [self.view addSubview: testScrollView];
//    UIView * smallView = [[UIView alloc]initWithFrame:CGRectMake(0, -NAVIGATION_BAR_HEIGHT, sWidth, 220)];
//    smallView.backgroundColor = [UIColor greenColor];
//    testScrollView.delegate = self;
//    [testScrollView addSubview:smallView];
  
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > (220 - NAVIGATION_BAR_HEIGHT *2)) {
        CGFloat alpha = (offsetY - (220 - NAVIGATION_BAR_HEIGHT *2)) / NAVIGATION_BAR_HEIGHT;
        [self wr_setNavBarBackgroundAlpha:alpha];
        [self wr_setNavBarTintColor:[[UIColor blackColor] colorWithAlphaComponent:alpha]];
        [self wr_setNavBarTitleColor:[[UIColor blackColor] colorWithAlphaComponent:alpha]];
        [self wr_setStatusBarStyle:UIStatusBarStyleDefault];
       self.title = @"321";
    }
    else
    {
        [self wr_setNavBarBackgroundAlpha:0];
        [self wr_setNavBarTintColor:[UIColor whiteColor]];
        [self wr_setNavBarTitleColor:[UIColor whiteColor]];
        [self wr_setStatusBarStyle:UIStatusBarStyleLightContent];
        self.title = @"123";
    }
}
-(void)refreshData{
    
}
-(void)loadMore{
    
}
-(void)rightClick:(UIButton *)btn{
    NSLog(@"111");
    TestViewController * test = [TestViewController new];
    [self presentViewController:test animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // 如果不是竖屏, 强制转为竖屏
    if ([UIDevice currentDevice].orientation != UIDeviceOrientationPortrait) {
        [self orientationToPortrait:UIInterfaceOrientationPortrait];
    }
    
    //    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
    //        [self orientationToPortrait:UIInterfaceOrientationPortrait];
    //    }
}
#pragma mark 强制转屏
// 当回到原来的视图时, 如果希望这个视图还是竖屏, 可强制旋转一下
//强制旋转屏幕
- (void)orientationToPortrait:(UIInterfaceOrientation)orientation {
    SEL selector = NSSelectorFromString(@"setOrientation:");
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
    [invocation setSelector:selector];
    [invocation setTarget:[UIDevice currentDevice]];
    int val = orientation;
    [invocation setArgument:&val atIndex:2];//前两个参数已被target和selector占用
    [invocation invoke];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
