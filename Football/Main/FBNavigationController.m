//
//  FBNavigationController.m
//  Football
//
//  Created by Apple on 2017/9/16.
//  Copyright © 2017年 tiantuo. All rights reserved.
//

#import "FBNavigationController.h"

@interface FBNavigationController ()

@end

@implementation FBNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(UIStatusBarStyle)preferredStatusBarStyle

{
    
    return UIStatusBarStyleLightContent;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = nil;
    }
    if (self.viewControllers.count > 0) {
         viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

- (void)back
{

    // 因为self本来就是一个导航控制器，self.navigationController这里是nil的
    [self popViewControllerAnimated:YES];
}


@end
