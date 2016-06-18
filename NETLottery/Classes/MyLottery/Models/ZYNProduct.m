//
//  ZYNProduct.m
//  NETLottery
//
//  Created by zyn on 16/6/17.
//  Copyright © 2016年 张艳能. All rights reserved.
//

#import "ZYNProduct.h"

@implementation ZYNProduct

+(instancetype)productWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        self.title = dict[@"title"];
        self.stitle = dict[@"stitle"];
        self.ID = dict[@"id"];
        self.url = dict[@"url"];
        self.customUrl = dict[@"customUrl"];
        self.icon = dict[@"icon"];
    }
    return self;
}


@end
