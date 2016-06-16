//
//  UIView+ZYN_Extension.h
//  NETLottery
//
//  Created by zyn on 16/6/14.
//  Copyright © 2016年 zyn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ZYN_Extension)
/**
 *  分类中不能添加成员变量
    但是分类中可以添加属性，它会生成get和set方法的声明并不会实现，不会生成带下划线的成员变量
 */
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;


@end
