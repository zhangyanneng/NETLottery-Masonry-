//
//  ZYNDiscoverCell.m
//  NETLottery
//
//  Created by zyn on 16/6/14.
//  Copyright © 2016年 zyn. All rights reserved.
//

#import "ZYNDiscoverCell.h"
#import "Masonry.h"

@implementation ZYNDiscoverCell


-  (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //添加子控件
        [self setupUI];
        
    }
    
    return self;
}

- (void)setupUI {
    UIImageView *titleView = [[UIImageView alloc] init];
    [self.contentView addSubview:titleView];
    _titleView = titleView;
    
    UILabel *descLabel = [[UILabel alloc] init];
    [self.contentView addSubview:descLabel];
    _descView = descLabel;
    
    UIImageView *iconView = [[UIImageView alloc] init];
    [self.contentView addSubview:iconView];
    _iconView = iconView;
    
    [_titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(self.contentView).offset(8); // x,y
//        make.height.equalTo(@(21));
//        make.width.equalTo(@(70));
    }];
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView);
        make.right.bottom.mas_equalTo(self.contentView);
    }];
    
    [_descView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(_titleView);
        make.right.mas_equalTo(_iconView.mas_left).offset(8);
        make.bottom.mas_equalTo(self.contentView).offset(-8);
    }];

    
}

#pragma mark -  设置约束
- (void)layoutSubviews {
    [super layoutSubviews];
    
}

#pragma mark - 重写set方法

- (void)setTitleView:(UIImageView *)titleView {
    _titleView = titleView;
    //自动根据图片内容设置宽高
    [_titleView sizeToFit];
}

- (void)setIconView:(UIImageView *)iconView {
    _iconView = iconView;
    
    [_iconView sizeToFit];
}

@end
