//
//  ZYNBottomView.h
//  NETLottery
//
//  Created by zyn on 16/6/13.
//  Copyright © 2016年 zyn. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZYNBottomView;
@protocol ZYNBottomViewDelegate <NSObject>
@optional
//代理协议方法，获取到vc的索引
- (void)bottomView:(ZYNBottomView *)bottomView didSelectIndex:(NSInteger)index;

@end

@interface ZYNBottomView : UIView
/**
 *  添加代理属性
 */
@property (nonatomic, weak) id<ZYNBottomViewDelegate> delegate;


- (void)addButtonWithNorImage:(UIImage *)norImage selectImage: (UIImage *)selImage;

@end
