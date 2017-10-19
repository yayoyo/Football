//
//  BaseViewController.m
//  Football
//
//  Created by Apple on 2017/10/16.
//  Copyright © 2017年 tiantuo. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self getNetInfo];
    
}
-(void)creatLeftItem:(NSString *)title normalImage:(NSString *)ImgName selectImage:(NSString *)selectImgName{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 44, 44);
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:ImgName] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn setImage:IMG(selectImgName) forState:UIControlStateSelected];
    [btn addTarget:self action:@selector(leftClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * bbi = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = bbi;
}
-(void)creatRightItem:(NSString *)title normalImage:(NSString *)ImgName selectImage:(NSString *)selectImgName{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 44, 44);
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn setImage:IMG(ImgName) forState:UIControlStateNormal];
    [btn setImage:IMG(selectImgName) forState:UIControlStateSelected];
    UIBarButtonItem * BBI = [[UIBarButtonItem alloc]initWithCustomView:btn];
    [btn addTarget:self action:@selector(rightClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = BBI;
    
}

-(void)leftClick:(UIButton *)btn{
//    [self.navigationController popViewControllerAnimated:YES];
}
-(void)rightClick:(UIButton *)btn{
    
}
-(void)popView{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)getNetInfo{
    Reachability* reach = [Reachability reachabilityWithHostname:@"www.apple.com"];
    reach.reachableBlock = ^(Reachability * reachability)
    {
        NSString * netStateStr = [reachability currentReachabilityString];
        NSLog(@"%@",netStateStr);
        [reachability currentReachabilityStatus];
        //        如果有网络就调用 接口
        dispatch_async(dispatch_get_main_queue(), ^{
//            [MBProgressHUD showSuccess:netStateStr view:self.view];
        });
    };
    //    如果没有网络  提示请连接网络
    reach.unreachableBlock = ^(Reachability * reachability)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSString *toast = [NSString stringWithFormat:@"请连接网络"];
            [MBProgressHUD showError:toast view:self.view];
        
        });
    };
    
    [reach startNotifier];
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
