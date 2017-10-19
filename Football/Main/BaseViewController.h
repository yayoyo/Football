//
//  BaseViewController.h
//  Football
//
//  Created by Apple on 2017/10/16.
//  Copyright © 2017年 tiantuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
//左按钮
-(void)creatLeftItem:(NSString *)title normalImage:(NSString *)ImgName selectImage:(NSString *)selectImgName;
//右按钮
-(void)creatRightItem:(NSString *)title normalImage:(NSString *)ImgName selectImage:(NSString *)selectImgName;
//左按钮的点击
-(void)leftClick:(UIButton *)btn;
//右按钮的点击
-(void)rightClick:(UIButton *)btn;
//返回
-(void)popView;
//获取网络状态
-(void)getNetInfo;
@end
