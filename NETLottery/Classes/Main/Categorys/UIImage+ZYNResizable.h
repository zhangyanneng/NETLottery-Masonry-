//
//  UIImage+ZYNResizable.h
//  QQ聊天
//
//  Created by zyn on 16/5/23.
//  Copyright © 2016年 zyn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ZYNResizable)
/**
 *
 
 *  @param imageName 需要拉伸的图片名称
 *
 *  @return 返回拉伸的图片的图片
 */
+ (UIImage *)resizableWithName:(NSString *)imageName;

@end
