
//
//  ZYNQuestion.m
//  NETLottery
//
//  Created by zyn on 16/6/17.
//  Copyright © 2016年 张艳能. All rights reserved.
//

#import "ZYNQuestion.h"

@implementation ZYNQuestion

+ (instancetype)questionWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        self.ID = dict[@"id"];
        self.title = dict[@"title"];
        self.html = dict[@"html"];
    }
    return self;
}

@end
