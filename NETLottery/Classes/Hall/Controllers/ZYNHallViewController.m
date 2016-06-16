//
//  ZYNHallViewController.m
//  NETLottery
//
//  Created by zyn on 16/6/13.
//  Copyright © 2016年 zyn. All rights reserved.
//

#import "ZYNHallViewController.h"

@interface ZYNHallViewController ()

@end

@implementation ZYNHallViewController
{
    UIView *_cover;
    UIImageView *_imageView;
    UIButton *_closeBtn;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = ZYNRondomColor;
    
    self.navigationItem.title = @"购彩大厅";
    
    //创建button
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"CS50_activity_image"] forState:UIControlStateNormal];
    [btn sizeToFit];
    
    [btn addTarget: self action:@selector(leftBarButtonItemClick) forControlEvents:UIControlEventTouchUpInside];
    //包装到左边导航按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
}
#pragma mark - 活动点击按钮事件
- (void)leftBarButtonItemClick {
    //蒙板存在则点击按钮直接返回
    if (_cover) return;
    
    //创建蒙板
    UIView *cover = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    cover.backgroundColor = [UIColor blackColor];
    cover.alpha = 0.5;
    //关闭用户交互
    cover.userInteractionEnabled = NO;
    self.tabBarController.tabBar.userInteractionEnabled = NO;
    
    [self.tabBarController.view addSubview:cover];
    _cover = cover;
    
    //创建活动页
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"showActivity"]];
    [imageView sizeToFit];
    imageView.center = cover.center;
    [self.tabBarController.view addSubview:imageView];
    _imageView = imageView;
    
    //添加关闭按钮
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [closeBtn setImage:[UIImage imageNamed:@"alphaClose"] forState:UIControlStateNormal];
    [closeBtn sizeToFit];
    closeBtn.center = CGPointMake(cover.center.x + imageView.width * 0.5,cover.center.y - imageView.height * 0.5);
    [closeBtn addTarget:self action:@selector(closeActivity) forControlEvents:UIControlEventTouchUpInside];
    
    [self.tabBarController.view addSubview:closeBtn];
    _closeBtn = closeBtn;
    
}
- (void)closeActivity {
    
    [_closeBtn removeFromSuperview];
    _closeBtn = nil;
    
    [_imageView removeFromSuperview];
    _imageView = nil;
    
    [_cover removeFromSuperview];
    _cover = nil;
    
    self.tabBarController.tabBar.userInteractionEnabled = YES;
    
}

@end
