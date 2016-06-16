//
//  ZYNArenaViewController.m
//  NETLottery
//
//  Created by zyn on 16/6/13.
//  Copyright © 2016年 zyn. All rights reserved.
//

#import "ZYNArenaViewController.h"

@interface ZYNArenaViewController ()

@end

@implementation ZYNArenaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置背景
    self.view.layer.contents = (__bridge id)[UIImage imageNamed:@"NLArenaBackground"].CGImage;
    //头部视图
    UISegmentedControl *segmentC = [[UISegmentedControl alloc] initWithItems:@[@"足球",@"篮球"]];
    segmentC.bounds = CGRectMake(0, 0, 140, 28);
    self.navigationItem.titleView = segmentC;
    // 默认选择第一个
    segmentC.selectedSegmentIndex = 0;
    
    //设置导航栏背景
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"NLArenaNavBar64"] forBarMetrics:UIBarMetricsDefault];
    
    //设置普通状态的图片
    [segmentC setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [segmentC setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    //清除中中间的颜色
    [segmentC setTintColor:[UIColor clearColor]];
    //设置字体的颜色
    [segmentC setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]} forState:UIControlStateNormal];
    [segmentC setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]} forState:UIControlStateSelected];
    
}


@end
