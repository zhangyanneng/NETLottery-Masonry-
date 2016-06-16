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
    
    NSDictionary *dict = self.setData[indexPath.section];
    cell.textLabel.text = dict[@"ZItems"][indexPath.row][@"title"];
    cell.imageView.image = [UIImage imageNamed:dict[@"ZItems"][indexPath.row][@"icon"]];
    
    return cell;
}

#pragma mark - 懒加载数据模型
-(NSArray *)setData{
    if (_setData == nil) {
        _setData = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"settingData.plist" ofType:nil]];
    }
    return  _setData;
}



@end
