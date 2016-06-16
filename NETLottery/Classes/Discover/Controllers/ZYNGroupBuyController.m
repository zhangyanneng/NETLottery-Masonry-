//
//  ZYNGroupBuyController.m
//  NETLottery
//
//  Created by zyn on 16/6/15.
//  Copyright © 2016年 zyn. All rights reserved.
//

#import "ZYNGroupBuyController.h"
#import "ZYNCategoryButton.h"

@interface ZYNGroupBuyController ()

@property (nonatomic, weak) UIView *headerView;
@property (nonatomic, weak) UIButton *headerBtn;



@end

@implementation ZYNGroupBuyController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    
    ZYNCategoryButton *headerBtn = [ZYNCategoryButton buttonWithType:UIButtonTypeCustom];
    [headerBtn setTitle:@"全部彩种" forState:UIControlStateNormal];
    [headerBtn setImage:[UIImage imageNamed:@"YellowDownArrow"] forState:UIControlStateNormal];
    
    [headerBtn addTarget:self action:@selector(headerBtnClick) forControlEvents:UIControlEventTouchDown];
    //设置frame,否则图片不会显示出来
    [headerBtn sizeToFit];
    
    self.navigationItem.titleView = headerBtn;
    _headerBtn = headerBtn;
    
    //创建顶部视图
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 0)];
    headView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:headView];
    _headerView = headView;
}

#pragma mark - 按钮事件响应
- (void)headerBtnClick {
    //旋转按钮中的图片
    CGFloat height;
    CGAffineTransform transform;
    
    if (self.headerView.height == 0) {
        height = 200;
        //旋转180度
        transform = CGAffineTransformMakeRotation(M_PI * 0.99);
    } else {
        height = 0;
        //
        transform =CGAffineTransformIdentity;
    }
    [UIView animateWithDuration:0.25 animations:^{
        _headerView.height = height;
        _headerBtn.imageView.transform = transform;
        
    }];
    
}


@end
