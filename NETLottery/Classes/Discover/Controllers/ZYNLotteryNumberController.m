//
//  ZYNLotteryNumberController.m
//  NETLottery
//
//  Created by zyn on 16/6/15.
//  Copyright © 2016年 zyn. All rights reserved.
//

#import "ZYNLotteryNumberController.h"
#import "Masonry.h"

@interface ZYNLotteryNumberController ()

@end

@implementation ZYNLotteryNumberController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"幸运选号";
    
    //设置界面
    [self setupUI];
}

- (void)setupUI {
    //添加背景图片
    UIImageView *backgroudView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"luck_entry_background"]];
    //代码方式实现，如果导航中设置了背景图片，则self.view的大小发生改变，x会从导航栏的左下角开始
    //打印出来的bounds{{0, 0}, {320, 568}}
    //使用storyboard中则是全屏幕大小
    backgroudView.frame = self.view.bounds;
    [self.view addSubview:backgroudView];
    
    //添加跑马灯
    UIImageView *lightView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lucky_entry_light0"]];
    lightView.y = 50; // 设置y
    lightView.centerX = self.view.centerX;
    [lightView sizeToFit];
    [self.view addSubview:lightView];
    //设置帧动画，UIImageView自带的动画
    lightView.animationImages = @[
                                  [UIImage imageNamed:@"lucky_entry_light0"],
                                  [UIImage imageNamed:@"lucky_entry_light1"]
                                  ];
    lightView.animationDuration = 1;
    //无限次重复
    lightView.animationRepeatCount = 0;
    //开启动画
    [lightView startAnimating];
    
    //添加4个视图
    UIButton *birthdayBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [birthdayBtn setImage:[UIImage imageNamed:@"luck_entry_birthday_button_normal"] forState:UIControlStateNormal];
    [birthdayBtn sizeToFit];//内容填充获取宽高
    [self.view addSubview:birthdayBtn];
    
    UIButton *numberBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [numberBtn setImage:[UIImage imageNamed:@"luck_entry_number_button_normal"] forState:UIControlStateNormal];
    [numberBtn sizeToFit];
    [self.view addSubview:numberBtn];
    
    UIButton *lotsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [lotsBtn setImage:[UIImage imageNamed:@"luck_entry_lots_button_normal"] forState:UIControlStateNormal];
    [lotsBtn sizeToFit];
    [self.view addSubview:lotsBtn];
    
    UIButton *rouletteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rouletteBtn setImage:[UIImage imageNamed:@"luck_entry_roulette_button_normal"] forState:UIControlStateNormal];
    [rouletteBtn sizeToFit];
    [self.view addSubview:rouletteBtn];
    
    //设置布局约束
    [birthdayBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(100); // y
        make.left.mas_equalTo(self.view).offset(20); // x
    }];
    [numberBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(birthdayBtn); // y
        make.right.mas_equalTo(self.view).offset(-20); //x
    }];
    [lotsBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(birthdayBtn); // x
        make.top.mas_equalTo(birthdayBtn.mas_bottom).offset(20); // y
    }];
    [rouletteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(numberBtn); // x
        make.top.mas_equalTo(lotsBtn); // y
    }];
}

@end
