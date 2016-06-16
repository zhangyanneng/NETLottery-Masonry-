//
//  ZYNHistoryViewController.m
//  NETLottery
//
//  Created by zyn on 16/6/13.
//  Copyright © 2016年 zyn. All rights reserved.
//

#import "ZYNHistoryViewController.h"

@interface ZYNHistoryViewController ()

@end

@implementation ZYNHistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = ZYNRondomColor;
    self.navigationItem.title = @"开奖信息";
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [rightBtn setTitle:@"开奖推送" forState:UIControlStateNormal];
    [rightBtn setImage:[UIImage imageNamed:@"Historyawards_pushSettings"] forState:UIControlStateNormal];
    [rightBtn sizeToFit];
    //添加到右侧导航
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    
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
