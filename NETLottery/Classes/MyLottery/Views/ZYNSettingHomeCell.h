//
//  ZYNSettingHomeCell.h
//  NETLottery
//
//  Created by zyn on 16/6/16.
//  Copyright © 2016年 张艳能. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYNSettingHomeCell : UITableViewCell


@property (nonatomic,strong) NSDictionary *item;

+ (instancetype)settingHomeCell:(UITableView *)tableView;

@end
