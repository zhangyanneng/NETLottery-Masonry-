//
//  ZYNSettingHomeCell.m
//  NETLottery
//
//  Created by zyn on 16/6/16.
//  Copyright © 2016年 张艳能. All rights reserved.
//

#import "ZYNSettingHomeCell.h"

@implementation ZYNSettingHomeCell

+(instancetype)settingHomeCell:(UITableView *)tableView withItem:(NSDictionary *)item {
    static NSString *ID = @"cell";
    ZYNSettingHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[ZYNSettingHomeCell alloc] initWithStyle:[self cellStyleWithItem:item] reuseIdentifier:ID];
    }
    return cell;
}
+ (UITableViewCellStyle )cellStyleWithItem:(NSDictionary *)item {
    
    NSString *cellStyle = item[ZCellStyle];
    if ([cellStyle isEqualToString:@"UITableViewCellStyleSubtitle"]) {
        return UITableViewCellStyleSubtitle;
    } else if([cellStyle isEqualToString:@"UITableViewCellStyleValue1"]) {
        return UITableViewCellStyleValue1;
    }else if([cellStyle isEqualToString:@"UITableViewCellStyleValue2"]) {
        return UITableViewCellStyleValue2;
    } else {
        return UITableViewCellStyleDefault;
    }
}


#pragma mark - 重写set方法
- (void)setCellItem:(NSDictionary *)cellItem {
    _cellItem = cellItem;
    
    self.textLabel.text = cellItem[ZTitle];
    if(cellItem[ZCellStyle]){
        self.detailTextLabel.text = cellItem[ZSubTitle];
    }
    if (cellItem[ZIcon]) {
        self.imageView.image = [UIImage imageNamed:cellItem[ZIcon]];
    }
    //添加辅助视图
    Class className = NSClassFromString(cellItem[ZAccessoryType]);
    //初始化转换的类
    id obj = [[className alloc] init];
    //判断类的类型
    if ([obj isKindOfClass:[UIImageView class]]) {
        //如果是图片
        UIImageView *imageView = (UIImageView *)obj;
        imageView.image = [UIImage imageNamed:cellItem[ZAccessoryName]];
        [imageView sizeToFit];//设置大小
        self.accessoryView = imageView;
        
    } else if ([obj isKindOfClass:[UISwitch class]]) {
        UISwitch *switchs = (UISwitch *) obj;
        self.accessoryView = switchs;
        
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        switchs.on = [ud boolForKey:cellItem[ZKeyName]];
        
        //
        [switchs addTarget:self action:@selector(switchsBtnValueChange:) forControlEvents:UIControlEventValueChanged];
    }
}

- (void)switchsBtnValueChange: (UISwitch *)sender {
    
    NSUserDefaults *uDefaults = [NSUserDefaults standardUserDefaults];
    [uDefaults setBool:sender.isOn forKey:self.cellItem[ZKeyName]];
    

}

- (void)setSubTime:(NSString *)subTime {
    _subTime = subTime;
    
    self.detailTextLabel.text = subTime;
    
    self.detailTextLabel.textColor = [UIColor redColor];
    
}

@end
