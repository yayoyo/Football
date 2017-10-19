//
//  HomeViewController.m
//  Football
//
//  Created by Apple on 2017/10/16.
//  Copyright © 2017年 tiantuo. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self creatLeftItem:@"test" normalImage:nil selectImage:nil ];
    [self creatRightItem:@"right" normalImage:nil selectImage:nil];
//    [MJRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshData)];
//    [MJRefreshFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore)];
//    UIImageView * smallImg = [[UIImageView alloc]init];
//    [smallImg sd_setImageWithURL:ImageUrlStr(@"111") placeholderImage:nil];
     NSDictionary * parmas = @{@"tag":@"1"};
    [YBHttpTool post:@"http://118.178.230.158:90/zhubaoke/jrth/xsms.do" params:parmas success:^(NSDictionary *obj) {
        NSLog(@"%@",obj);
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
    
}
-(void)refreshData{
    
}
-(void)loadMore{
    
}
-(void)rightClick:(UIButton *)btn{
    NSLog(@"111");
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
