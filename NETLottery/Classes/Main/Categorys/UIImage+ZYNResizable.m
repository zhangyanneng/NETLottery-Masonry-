//
//  UIImage+ZYNResizable.m
//  QQ聊天
//
//  Created by zyn on 16/5/23.
//  Copyright © 2016年 zyn. All rights reserved.
//

#import "UIImage+ZYNResizable.h"

@implementation UIImage (ZYNResizable)

+ (UIImage *)resizableWithName:(NSString *)imageName{
    UIImage *image = [UIImage imageNamed:imageName];
    /**
     *  1. 可以在图片资源里，选择show slicing进行设置拉伸图片
     *  2. 这里是使用代码的方式来实现图片的拉伸
     */
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(image.size.width * 0.5,image.size.height * 0.5,image.size.width * 0.5,image.size.height * 0.5) resizingMode:UIImageResizingModeTile];
    //下面方法现在已经过时，仍然可以继续使用
//    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}
@end
