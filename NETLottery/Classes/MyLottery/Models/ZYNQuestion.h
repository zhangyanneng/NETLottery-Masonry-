//
//  ZYNQuestion.h
//  NETLottery
//
//  Created by zyn on 16/6/17.
//  Copyright © 2016年 张艳能. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYNQuestion : NSObject
/**
  {
 "title" : "如何领奖？",
 "html" : "help.html",
 "id" : "howtoprize"
 },
 */

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *html;
@property (nonatomic, copy) NSString *ID;

+ (instancetype)questionWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;




@end
