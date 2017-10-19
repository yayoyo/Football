//
//  ViewController.m
//  Football
//
//  Created by Apple on 2017/9/15.
//  Copyright © 2017年 tiantuo. All rights reserved.
//

#import "ViewController.h"
#import "DrawBoardVC.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    DrawBoardVC * vc = [[DrawBoardVC alloc]init];
//    [self presentViewController:vc animated:YES completion:^{
//        NSLog(@"展示PANTwoViewController完毕.......");
//    }];
    UIView * testview = [[UIView alloc]init];
    [self.view addSubview:testview];
    testview.backgroundColor = [UIColor redColor];
    [testview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.height.equalTo(@100);
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
