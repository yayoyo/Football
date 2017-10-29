//
//  FBTabBarController.m
//  Football
//
//  Created by Apple on 2017/9/16.
//  Copyright © 2017年 tiantuo. All rights reserved.
//

#import "FBTabBarController.h"
#import "FBNavigationController.h"

@interface FBTabBarController ()
{
    BOOL __shouldAutorotate;
}
@end

@implementation FBTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //首页
    HomeViewController * home = [[HomeViewController alloc]init];
    [self addChildVc:home title:@"首页" image:nil selectedImage:nil];
    //商城
    ShopViewController * shop = [[ShopViewController alloc]init];
    [self addChildVc:shop title:@"商城" image:nil selectedImage:nil];
    CircleViewController * circle = [[CircleViewController alloc]init];
    //圈子
    [self addChildVc:circle title:@"圈子" image:nil selectedImage:nil];
    //个人中心
    ProfileViewController * profile = [[ProfileViewController alloc]init];
    [self addChildVc:profile title:@"个人中心" image:nil selectedImage:nil];
}
- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    childVc.title = title;
    childVc.tabBarItem.image = IMG(image);
    childVc.tabBarItem.selectedImage = [IMG(selectedImage) imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
  //设置文字样式
    NSMutableDictionary * textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor colorWithHexString:@"666666"];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = [UIColor colorWithHexString:@"fe0202"];
   [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    FBNavigationController * nav = [[FBNavigationController alloc]initWithRootViewController:childVc ];
    [self addChildViewController:nav];
  
}


#pragma mark - - orientation
// 是否支持转屏
- (BOOL)shouldAutorotate
{
    return [self.selectedViewController shouldAutorotate];
}
// 返回nav栈中的最后一个对象支持的旋转方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return [self.selectedViewController supportedInterfaceOrientations];
}
// 返回nav栈中最后一个对象,坚持旋转的方向
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return [self.selectedViewController preferredInterfaceOrientationForPresentation];
}

@end
