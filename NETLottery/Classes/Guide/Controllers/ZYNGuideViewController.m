//
//  ZYNGuideViewController.m
//  NETLottery
//
//  Created by zyn on 16/6/18.
//  Copyright © 2016年 张艳能. All rights reserved.
//

#import "ZYNGuideViewController.h"
#import "ZYNGuideCell.h"

@interface ZYNGuideViewController ()

@end

@implementation ZYNGuideViewController
{
    UIImageView *_ballView;
    UIImageView *_largeView;
    UIImageView *_smallView;
    NSInteger _oldIdx;
}

- (instancetype)init
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = [UIScreen mainScreen].bounds.size;
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    return [super initWithCollectionViewLayout:flowLayout];
}


static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.pagingEnabled = YES;
    self.collectionView.bounces = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLine"]];
    imageView.x = -200;
    [self.collectionView addSubview:imageView];
    
    UIImageView *ballView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guide1"]];
    [self.collectionView addSubview:ballView];
    _ballView = ballView;
    
    UIImageView *largeView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLargeText1"]];
    largeView.y = self.collectionView.height * 0.7;
    [self.collectionView addSubview:largeView];
    _largeView = largeView;
    
    UIImageView *smallView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    smallView.y = self.collectionView.height * 0.8;
    [self.collectionView addSubview:smallView];
    _smallView = smallView;
    
    
    [self.collectionView registerClass:[ZYNGuideCell class] forCellWithReuseIdentifier:reuseIdentifier];
}
#pragma mark - ScorllView
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //获取到偏移量
    CGFloat offSetX = scrollView.contentOffset.x;
    //
    NSInteger idx = offSetX / self.view.width;
    
    CGFloat changeOffSetX = offSetX;
    
    //当前的idx大于_oldIdx则是向左滑动，小于则是向右滑动
    if (idx > _oldIdx) {
        changeOffSetX += self.view.width;
    } else if(idx < _oldIdx){
        changeOffSetX -= self.view.width;
    } else {
        return;
    }
    //赋值
    _oldIdx = idx;
    
    //设置图片信息
    _ballView.image = [UIImage imageNamed:[NSString stringWithFormat:@"guide%zd",idx + 1]];
    _largeView.image = [UIImage imageNamed:[NSString stringWithFormat:@"guideLargeText%zd",idx + 1]];
    _smallView.image = [UIImage imageNamed:[NSString stringWithFormat:@"guideSmallText%zd",idx + 1]];

    //先移动到下一个视图中
    _ballView.x = changeOffSetX;
    _largeView.x = changeOffSetX;
    _smallView.x = changeOffSetX;
    
    //动画回到当前位置
    [UIView animateWithDuration:0.25 animations:^{
        _ballView.x = offSetX;
        _largeView.x = offSetX;
        _smallView.x = offSetX;
    }];
    
    
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ZYNGuideCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.contentView.layer.contents = (__bridge id)[UIImage imageNamed:[NSString stringWithFormat:@"guide%zdBackground",indexPath.row + 1]].CGImage;
    
    if (indexPath.row == 3) {
        cell.isHiden = NO;
    } else {
        cell.isHiden = YES;
    }
    
    return cell;
}


@end
