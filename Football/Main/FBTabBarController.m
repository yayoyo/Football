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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
