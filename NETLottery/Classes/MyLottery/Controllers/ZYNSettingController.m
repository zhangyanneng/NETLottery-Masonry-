//
//  ZYNSettingController.m
//  NETLottery
//
//  Created by zyn on 16/6/15.
//  Copyright © 2016年 zyn. All rights reserved.
//

#import "ZYNSettingController.h"
#import "ZYNSettingHomeCell.h"
#import "ZYNQuestionTipsController.h"

@interface ZYNSettingController ()

 @property (nonatomic,strong) NSArray *setData;


@end

@implementation ZYNSettingController

- (instancetype)init{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.setData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.setData[section][ZItems] count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //获取数据
    NSDictionary *item = self.setData[indexPath.section][ZItems][indexPath.row];
    //创建cell
    ZYNSettingHomeCell *cell = [ZYNSettingHomeCell settingHomeCell:tableView withItem:item];
    //赋值
    cell.cellItem = item;
    
    return cell;
}

#pragma mark -  实现UITableViewDelegate代理协议方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 去除选择灰色效果
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
     NSDictionary *item = self.setData[indexPath.section][ZItems][indexPath.row];
    if ([item[ZTargetVc] length] <= 0) {
        return;
    }
    
    Class class = NSClassFromString(item[ZTargetVc]);
    
    UIViewController *targetVc= [[class alloc] init];
    targetVc.title = item[ZTitle];
    if ([targetVc isKindOfClass:[ZYNSettingController class]]) {
        ZYNSettingController *settingVc = (ZYNSettingController *)targetVc;
        settingVc.plistName = item[ZPlistName];
        [self.navigationController pushViewController:settingVc animated:YES];

    } else {
        [self.navigationController pushViewController:targetVc animated:YES];
    }
}

#pragma mark - 头部视图设置
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return self.setData[section][ZHeader];
}

#pragma mark - 底部视图设置
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return self.setData[section][ZFooter];
}



#pragma mark - 懒加载数据模型
-(NSArray *)setData{
    if (_setData == nil) {
        _setData = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:self.plistName ofType:nil]];
    }
    return  _setData;
}



@end
