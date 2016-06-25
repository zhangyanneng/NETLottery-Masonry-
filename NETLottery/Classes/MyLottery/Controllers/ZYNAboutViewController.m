//
//  ZYNAboutViewController.m
//  NETLottery
//
//  Created by zyn on 16/6/18.
//  Copyright © 2016年 张艳能. All rights reserved.
//

#import "ZYNAboutViewController.h"

@interface ZYNAboutViewController ()

@end

@implementation ZYNAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *headerView = [[UIView alloc] init];
    headerView.height = self.view.height * 0.7;
    headerView.centerX = self.view.centerX;
    
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"about_logo"]];
    [headerView addSubview:imgView];
    imgView.y = headerView.height * 0.2;
    imgView.centerX = headerView.centerX;
    
    
    self.tableView.tableHeaderView = headerView;
    
}


#pragma mark - 评分支持

- (void)scoreSupport {
   UIApplication *app = [UIApplication sharedApplication];
    NSURL *url = [NSURL URLWithString:@"http://itunes.apple.com/cn/app/id411654863?mt=8"];
    [app openURL:url];
}

#pragma mark - 客服电话
- (void)callCustomerService {
    UIApplication *app = [UIApplication sharedApplication];
    NSURL *url = [NSURL URLWithString:@"tel://10086"];
    [app openURL:url];
}

@end
