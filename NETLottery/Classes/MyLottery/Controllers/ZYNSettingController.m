//
//  ZYNSettingController.m
//  NETLottery
//
//  Created by zyn on 16/6/15.
//  Copyright © 2016年 zyn. All rights reserved.
//

#import "ZYNSettingController.h"

@interface ZYNSettingController ()

 @property (nonatomic,strong) NSArray *setData;


@end

@implementation ZYNSettingController

- (instancetype)init
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.setData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.setData[section][@"ZItems"] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    NSDictionary *item = self.setData[indexPath.section][@"ZItems"][indexPath.row];
    cell.textLabel.text = item[@"ZTitle"];
    
    if (item[@"ZIcon"]) {
        cell.imageView.image = [UIImage imageNamed:item[@"ZIcon"]];
    }
    //添加辅助视图
    Class className = NSClassFromString(item[@"ZAccessoryType"]);
    //初始化转换的类
    id obj = [[className alloc] init];
    //判断类的类型
    if ([obj isKindOfClass:[UIImageView class]]) {
        //如果是图片
        UIImageView *imageView = (UIImageView *)obj;
        imageView.image = [UIImage imageNamed:item[@"ZAccessoryName"]];
        [imageView sizeToFit];//设置大小
        cell.accessoryView = imageView;
        
    } else if ([obj isKindOfClass:[UISwitch class]]) {
        cell.accessoryView = (UISwitch *) obj;
    }
    
    return cell;
}

#pragma mark -  实现UITableViewDelegate代理协议方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 去除选择灰色效果
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
     NSDictionary *item = self.setData[indexPath.section][@"ZItems"][indexPath.row];
    if ([item[@"ZTargetVc"] length] <= 0) {
        return;
    }
    
    Class class = NSClassFromString(item[@"ZTargetVc"]);
    
    UIViewController *targetVc= [[class alloc] init];
    targetVc.title = item[@"ZTitle"];
    if ([targetVc isKindOfClass:[ZYNSettingController class]]) {
        ZYNSettingController *settingVc = (ZYNSettingController *)targetVc;
        settingVc.plistName = item[@"ZPlistName"];
        [self.navigationController pushViewController:settingVc animated:YES];

    } else {
        [self.navigationController pushViewController:targetVc animated:YES];
    }
}

#pragma mark - 头部视图设置
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return self.setData[section][@"ZHeader"];
}

#pragma mark - 底部视图设置
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return self.setData[section][@"ZFooter"];
}



#pragma mark - 懒加载数据模型
-(NSArray *)setData{
    if (_setData == nil) {
        _setData = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:self.plistName ofType:nil]];
    }
    return  _setData;
}



@end
