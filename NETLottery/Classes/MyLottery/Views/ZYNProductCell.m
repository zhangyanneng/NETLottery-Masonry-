//
//  ZYNProductCell.m
//  NETLottery
//
//  Created by zyn on 16/6/17.
//  Copyright © 2016年 张艳能. All rights reserved.
//

#import "ZYNProductCell.h"
#import "ZYNProduct.h"

@interface ZYNProductCell ()

@property (weak, nonatomic) IBOutlet  UIImageView *iconView;
@property (weak, nonatomic) IBOutlet  UILabel *nameView;

@end

@implementation ZYNProductCell


- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.iconView.layer.cornerRadius = 10;
    self.iconView.layer.masksToBounds = YES;
}

- (void)setProduct:(ZYNProduct *)product {
    _product = product;
    //赋值
    self.iconView.image = [UIImage imageNamed:self.product.icon];
    self.nameView.text = self.product.title;
}


@end
