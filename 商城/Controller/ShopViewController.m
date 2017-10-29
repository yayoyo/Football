//
//  ShopViewController.m
//  Football
//
//  Created by Apple on 2017/10/17.
//  Copyright © 2017年 tiantuo. All rights reserved.
//

#import "ShopViewController.h"

@interface ShopViewController ()<TZImagePickerControllerDelegate>
{
    TZImagePickerController *imagePickerVc;
}

@end

@implementation ShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 44, 44);
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn setTitle:@"1" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
  
    UIBarButtonItem * BBI = [[UIBarButtonItem alloc]initWithCustomView:btn];
    [btn addTarget:self action:@selector(rightClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = BBI;
     
}

-(void)rightClick:(UIButton *)btn{
    NSLog(@"111");
   TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:9 columnNumber:3 delegate:self pushPhotoPickerVc:YES];
    imagePickerVc.naviBgColor = [UIColor whiteColor];
    // You can get the photos by block, the same as by delegate.
    // 你可以通过block或者代理，来得到用户选择的照片.
    [imagePickerVc setDidFinishPickingPhotosWithInfosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto, NSArray<NSDictionary *> *infos) {
        
    }];
    [self presentViewController:imagePickerVc animated:YES completion:nil];
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
