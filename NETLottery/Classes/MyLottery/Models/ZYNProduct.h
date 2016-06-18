//
//  ZYNProduct.h
//  NETLottery
//
//  Created by zyn on 16/6/17.
//  Copyright © 2016年 张艳能. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYNProduct : NSObject
/**
    {
     "title": "邮箱大师",
     "stitle":"网易推出的通用邮箱APP",
     "id": "com.netease.mailmaster",
     "url": "https://itunes.apple.com/cn/app/you-xiang-da-shi/id897003024?mt=8",
     "icon": "mail",
     "customUrl": "mailmaster"
     }
 */

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *stitle;
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *customUrl;


+ (instancetype)productWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;


@end
