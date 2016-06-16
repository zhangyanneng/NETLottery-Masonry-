//
//  ZYNNavigationController.m
//  NETLottery
//
//  Created by zyn on 16/6/13.
//  Copyright © 2016年 zyn. All rights reserved.
//

#import "ZYNNavigationController.h"

@interface ZYNNavigationController ()

@end

@implementation ZYNNavigationController


+ (void)initialize {
    // 1.获取导航条的外观代理对象
    //外观代理对象决定navBar将来展示的效果
    UINavigationBar *navBar = [UINavigationBar appearance];
    // 2.设置导航条背景
    [navBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    
    // 3.设置导航栏标题颜色
    [navBar setTitleTextAttributes:@{
                                     NSForegroundColorAttributeName : [UIColor whiteColor]
                                     }];
    // 4.设置两侧按钮的颜色
    [navBar setTintColor:[UIColor whiteColor]];
 
}

- (void)viewDidLoad {
    [super viewDidLoad];
  
}
/**
 *重写该方法，统一设置push后隐藏tabBar导航
 *
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    //设置在push的时候隐藏tabbar
    if(self.childViewControllers.count > 0){
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
    
}



@end
