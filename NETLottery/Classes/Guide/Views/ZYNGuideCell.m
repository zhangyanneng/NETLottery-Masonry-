
//
//  ZYNGuideCell.m
//  NETLottery
//
//  Created by zyn on 16/6/19.
//  Copyright © 2016年 张艳能. All rights reserved.
//

#import "ZYNGuideCell.h"
#import "ZYNTabBarController.h"

@interface ZYNGuideCell ()

@property (nonatomic, weak) UIButton *startBtn;


@end

@implementation ZYNGuideCell

//重写初始化方法
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(go2MainView) forControlEvents:UIControlEventTouchUpInside];
        [btn sizeToFit];
        btn.y = self.contentView.height * 0.85;
        btn.centerX = self.contentView.centerX;
        btn.hidden = YES;
        [self.contentView addSubview:btn];
        _startBtn = btn;
        
    }
    return self;
}

- (void)go2MainView {
    //进入主界面
    [UIApplication sharedApplication].keyWindow.rootViewController = [[ZYNTabBarController alloc] init];
    
    
    
}

- (void)setIsHiden:(BOOL)isHiden {
    _isHiden = isHiden;
    
    self.startBtn.hidden = isHiden;
}

@end
