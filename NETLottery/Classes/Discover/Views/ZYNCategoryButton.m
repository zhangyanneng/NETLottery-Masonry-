//
//  ZYNCategoryButton.m
//  NETLottery
//
//  Created by zyn on 16/6/15.
//  Copyright © 2016年 zyn. All rights reserved.
//

#import "ZYNCategoryButton.h"

@implementation ZYNCategoryButton


- (void)layoutSubviews {
    //一定需要super
    [super layoutSubviews];
    self.titleLabel.x = 0;
    self.imageView.x = self.titleLabel.width + 5;
}

@end
