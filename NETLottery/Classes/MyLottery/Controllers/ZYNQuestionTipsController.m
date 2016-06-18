//
//  ZYNQuestionTipsController.m
//  NETLottery
//
//  Created by zyn on 16/6/17.
//  Copyright © 2016年 张艳能. All rights reserved.
//

#import "ZYNQuestionTipsController.h"
#import "ZYNQuestion.h"
#import "ZYNTipsViewController.h"

@interface ZYNQuestionTipsController ()

@property (nonatomic,strong) NSArray *questions;

@end

@implementation ZYNQuestionTipsController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"问题列表";
    
    
    
}
#pragma mark - 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.questions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.textLabel.text = [self.questions[indexPath.row] title];
    //设置单元格样式
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    ZYNTipsViewController *webView = [[ZYNTipsViewController alloc] init];
    webView.question = self.questions[indexPath.row];
    [self.navigationController pushViewController:webView animated:YES];
//    [self presentViewController:webView animated:YES completion:nil];
    
}


#pragma mark - 懒加载数据模型
-(NSArray *)questions{
    if (_questions == nil) {
        //加载json文件内容
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"help.json" ofType:nil];
        
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        //
        NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        //字典转模型
        NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:array.count];
        for (NSDictionary *dict in array) {
            [arrM addObject:[ZYNQuestion questionWithDict:dict]];
        }
        _questions = [arrM copy];
    }
    
    return  _questions;
}


@end
