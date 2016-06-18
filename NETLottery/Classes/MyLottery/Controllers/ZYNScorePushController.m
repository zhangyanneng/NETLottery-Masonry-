//
//  ZYNScorePushController.m
//  NETLottery
//
//  Created by zyn on 16/6/17.
//  Copyright © 2016年 张艳能. All rights reserved.
//

#import "ZYNScorePushController.h"
#import "ZYNSettingHomeCell.h"

@interface ZYNScorePushController ()

@property (nonatomic,strong) UIDatePicker *datePicker;

@property (nonatomic,strong) UIToolbar *toolBar;

@property (nonatomic,strong) ZYNSettingHomeCell *selCell;

@property (nonatomic,strong) UITextField *textField;

@end

@implementation ZYNScorePushController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - 重写tableView: didSelectRowAtIndexPath:方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) {
        return;
    }
    
    //获取单元格
    ZYNSettingHomeCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    _selCell = cell;
    
    [cell.contentView addSubview:self.textField];
    
    [self.textField becomeFirstResponder];
    
}

- (void)cancelBtnClick {
    [self.view endEditing:YES];
}

- (void)doneBtnClick {
    
    NSDate *date = self.datePicker.date;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"HH:mm";
    
    self.selCell.subTime = [formatter stringFromDate:date];
    
    [self.view endEditing:YES];
}

#pragma mark - 懒加载控件
- (UIDatePicker *)datePicker {
    if (_datePicker == nil) {
        _datePicker = [[UIDatePicker alloc] init];
        _datePicker.datePickerMode = UIDatePickerModeTime;
        _datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh-Hans"];
    }
    return _datePicker;
}

- (UIToolbar *)toolBar {
    if (_toolBar == nil) {
        _toolBar = [[UIToolbar alloc] init];
        //必须设置高度
        _toolBar.bounds = CGRectMake(0, 0, 0, 44);
        
        UIBarButtonItem *cancelBtn = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelBtnClick)];
        
         UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(doneBtnClick)];
        
         UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        
        _toolBar.items = @[cancelBtn,flexSpace,doneBtn];
        
    }
    return _toolBar;
}

- (UITextField *)textField {
    if (_textField == nil) {
        _textField = [[UITextField alloc] init];
        _textField.inputView = self.datePicker;
        _textField.inputAccessoryView = self.toolBar;
    }
    return _textField;
}


@end
