//
//  ZYNMyLotteryViewController.m
//  NETLottery
//
//  Created by zyn on 16/6/13.
//  Copyright © 2016年 zyn. All rights reserved.
//

#import "ZYNMyLotteryViewController.h"
#import "ZYNSettingController.h"
#import "Masonry.h"

@interface ZYNMyLotteryViewController ()

@end

@implementation ZYNMyLotteryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setupUI];

}
#pragma mark - 搭建界面
- (void)setupUI {
    self.view.backgroundColor = ZYNRondomColor;
    self.navigationItem.title = @"我的彩票";
    //配置左边按钮
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setTitle:@"客服" forState:UIControlStateNormal];
    [leftBtn setImage:[UIImage imageNamed:@"FBMM_Barbutton"] forState:UIControlStateNormal];
    [leftBtn sizeToFit];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    //配置右边按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Mylottery_config"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarBtnClick)];
    //配置返回按钮
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    //配置主界面
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LoginScreen"]];
    //确定图片的大小
    [imageView sizeToFit];
    [self.view addSubview:imageView];
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    //拉伸图片处理,使用扩展类方法处理
    [loginBtn setBackgroundImage:[UIImage resizableWithName:@"RedButton"] forState:UIControlStateNormal];
    [loginBtn setBackgroundImage:[UIImage resizableWithName:@"RedButtonPressed"] forState:UIControlStateHighlighted];
    //添加事件
    [loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:loginBtn];
    
    UIButton *signBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [signBtn setTitle:@"注册" forState:UIControlStateNormal];
    //拉伸图片处理,使用扩展类方法处理
    [signBtn setBackgroundImage:[UIImage resizableWithName:@"RedButton"] forState:UIControlStateNormal];
    [signBtn setBackgroundImage:[UIImage resizableWithName:@"RedButtonPressed"] forState:UIControlStateHighlighted];
    //添加事件
    [signBtn addTarget:self action:@selector(signBtnCLick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:signBtn];
    
    //设置约束
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(50);
        make.centerX.equalTo(self.view);
    }];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(imageView.mas_bottom).offset(60); // y
        make.left.mas_equalTo(self.view).offset(20); // x
        make.right.mas_equalTo(self.view).offset(-20); //width
    }];
    [signBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(loginBtn.mas_bottom).offset(20); // y
        make.left.mas_equalTo(self.view).offset(20); // x
        make.right.mas_equalTo(self.view).offset(-20); //width
    }];
}
#pragma mark - 按钮响应事件
- (void)loginBtnClick {
    
}

- (void)signBtnCLick {
    
}

- (void)rightBarBtnClick {
    
    ZYNSettingController *setting = [[ZYNSettingController alloc] initWithStyle:UITableViewStyleGrouped];
    
    [self.navigationController pushViewController:setting animated:YES];
    
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
