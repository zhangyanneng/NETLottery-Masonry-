
//
//  ZYNBottomView.m
//  NETLottery
//
//  Created by zyn on 16/6/13.
//  Copyright © 2016年 zyn. All rights reserved.
//

#import "ZYNBottomView.h"
#import "ZYNBottomButton.h"

@interface ZYNBottomView ()
@property (nonatomic, weak) ZYNBottomButton *selButton;

@end

@implementation ZYNBottomView


#pragma mark - 添加button
- (void)addButtonWithNorImage:(UIImage *)norImage selectImage: (UIImage *)selImage{
    ZYNBottomButton *btn = [ZYNBottomButton buttonWithType:UIButtonTypeCustom];
    
    btn.tag = self.subviews.count; // 1,2,3...
    //设置背景图片
    [btn setBackgroundImage:norImage forState:UIControlStateNormal];
    [btn setBackgroundImage:selImage forState:UIControlStateSelected];
    //添加事件
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    
    [self addSubview:btn];
}

- (void)btnClick:(ZYNBottomButton *)btn {
    //关闭上一个按钮的选中状态
    _selButton.selected = NO;
    //设置当前选择的按钮状态
    btn.selected = YES;
    
    _selButton = btn;
    
    //将btn的tag传递给控制器
    if ([self.delegate respondsToSelector:@selector(bottomView:didSelectIndex:)]) {
        [self.delegate bottomView:self didSelectIndex:btn.tag];
    }
    
    
}

#pragma mark -  设置子控件的约束
- (void)layoutSubviews {
    [super layoutSubviews];
    //设置子控件的布局
    CGFloat btnW = self.bounds.size.width / self.subviews.count;
    CGFloat btnH = self.bounds.size.height;
    CGFloat btnY = 0;
    
    [self.subviews enumerateObjectsUsingBlock:^(__kindof ZYNBottomButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CGFloat btnX = idx * btnW;
        obj.frame = CGRectMake(btnX, btnY, btnW, btnH);
        if (idx == 0 && !_selButton) {
            obj.selected = YES;
            _selButton = obj;
        }
    }];
//    //默认第一个button被选中
//    ZYNBottomButton *btn = self.subviews.firstObject;
//    btn.selected = YES;
//    _selButton = btn;
}
@end
