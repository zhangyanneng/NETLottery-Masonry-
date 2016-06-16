//
//  ZYNTabBarController.m
//  NETLottery
//
//  Created by zyn on 16/6/13.
//  Copyright © 2016年 zyn. All rights reserved.
//

#import "ZYNTabBarController.h"
#import "ZYNBottomView.h"
#import "ZYNNavigationController.h"
#import "ZYNHallViewController.h"
#import "ZYNArenaViewController.h"
#import "ZYNDiscoverViewController.h"
#import "ZYNHistoryViewController.h"
#import "ZYNMyLotteryViewController.h"



@interface ZYNTabBarController ()<ZYNBottomViewDelegate>

@end

@implementation ZYNTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载子控制器
    [self loadChildVc];
    //加载底部视图
    [self loadBottomView];
}

#pragma mark -  加载子控制器
- (void)loadChildVc {
    //大厅 bundle设置为nil，默认是[UIBundle mainBudle]
    ZYNNavigationController *hallNav = [[ZYNNavigationController alloc] initWithRootViewController:[[ZYNHallViewController alloc] init]];
    //竞技场
    ZYNNavigationController *arenaNav = [[ZYNNavigationController alloc] initWithRootViewController:[[ZYNArenaViewController alloc] init]];
    //发现
    ZYNNavigationController *discoverNav = [[ZYNNavigationController alloc] initWithRootViewController:[[ZYNDiscoverViewController alloc] initWithStyle:UITableViewStyleGrouped]];
    //彩票消息
    ZYNNavigationController *historyNav = [[ZYNNavigationController alloc] initWithRootViewController:[[ZYNHistoryViewController alloc] init]];
    //我的彩票
    ZYNNavigationController *myLotteryNav = [[ZYNNavigationController alloc] initWithRootViewController:[[ZYNMyLotteryViewController alloc] init]];
    
    self.viewControllers = @[hallNav,arenaNav,discoverNav,historyNav,myLotteryNav];
}

#pragma mark - 加载底部视图
- (void)loadBottomView {
    //创建视图
    ZYNBottomView *bottmView = [[ZYNBottomView alloc] initWithFrame:self.tabBar.bounds];
    //设置代理
    bottmView.delegate = self;
    //设置背景颜色
//    bottmView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1.0];
    
    //添加视图
    [self.tabBar addSubview:bottmView];
    //添加btn
    [self.childViewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //
        
        UIImage *norImage = [UIImage imageNamed:[NSString stringWithFormat:@"TabBar%zd",idx + 1]];
        UIImage *selImage = [UIImage imageNamed:[NSString stringWithFormat:@"TabBar%zdSel",idx + 1]];
        
        [bottmView addButtonWithNorImage:norImage selectImage:selImage];
    }];
    
}

#pragma mark - 实现代理协议的方法
- (void)bottomView:(ZYNBottomView *)bottomView didSelectIndex:(NSInteger)index {
    
    self.selectedIndex = index;
}


@end
