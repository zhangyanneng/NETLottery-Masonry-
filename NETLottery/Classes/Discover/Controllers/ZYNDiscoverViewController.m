//
//  ZYNDiscoverViewController.m
//  NETLottery
//
//  Created by zyn on 16/6/14.
//  Copyright © 2016年 zyn. All rights reserved.
//

#import "ZYNDiscoverViewController.h"
#import "ZYNDiscoverCell.h"
#import "ZYNGroupBuyController.h"
#import "ZYNLotteryNumberController.h"

@interface ZYNDiscoverViewController ()

@property (nonatomic,strong) NSArray * disArray;

@end

@implementation ZYNDiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"发现";
    
    self.tableView.rowHeight = 80;
    
    //返回按钮
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backBtn;

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.disArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.disArray[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    ZYNDiscoverCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[ZYNDiscoverCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    NSDictionary *dict = self.disArray[indexPath.section][indexPath.row];
    //设置数据
    cell.titleView.image = [UIImage imageNamed:dict[@"title"]];
    cell.descView.text = dict[@"desc"];
    cell.iconView.image = [UIImage imageNamed:dict[@"image"]];
    
    return cell;
}

#pragma mark - table view delegate
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) {
        //第0组的第0行
        ZYNGroupBuyController *groupVc = [[ZYNGroupBuyController alloc] init];

        [self.navigationController pushViewController:groupVc animated:YES];
    }
    
    if (indexPath.section == 2 && indexPath.row == 0) {
        //第2组的第0行
        ZYNLotteryNumberController *lotteryNumVc = [[ZYNLotteryNumberController alloc] init];
        [self.navigationController pushViewController:lotteryNumVc animated:YES];
    }
    
}


#pragma mark - 懒加载数据模型
-(NSArray *)disArray{
    if (_disArray == nil) {
        _disArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"discover.plist" ofType:nil]];
    }
    return  _disArray;
}


@end
