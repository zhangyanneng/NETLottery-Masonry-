//
//  ZYNSettingHomeCell.h
//  NETLottery
//
//  Created by zyn on 16/6/16.
//  Copyright © 2016年 张艳能. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ZHeader                 @"ZHeader"
#define ZFooter                 @"ZFooter"
#define ZItems                  @"ZItems"

#define ZTitle                  @"ZTitle"
#define ZIcon                   @"ZIcon"
#define ZSubTitle               @"ZSubTitle"
#define ZAccessoryType          @"ZAccessoryType"
#define ZAccessoryName          @"ZAccessoryName"
#define ZTargetVc               @"ZTargetVc"
#define ZPlistName              @"ZPlistName"
#define ZCellStyle              @"ZCellStyle"
#define ZTargetVc               @"ZTargetVc"
#define ZKeyName                @"ZKeyName"
//#define ZKeyName


@interface ZYNSettingHomeCell : UITableViewCell


@property (nonatomic,strong) NSDictionary *cellItem;

@property (nonatomic,strong) NSString *subTime;

+(instancetype)settingHomeCell:(UITableView *)tableView withItem:(NSDictionary *)item;

@end
