//
//  ZYNProductController.m
//  NETLottery
//
//  Created by zyn on 16/6/17.
//  Copyright © 2016年 张艳能. All rights reserved.
//

#import "ZYNProductController.h"
#import "ZYNProduct.h"
#import "ZYNProductCell.h"


@interface ZYNProductController ()

@property (nonatomic,weak) UICollectionViewFlowLayout *flowLayout;

@property (nonatomic,strong) NSArray *products;

@end

@implementation ZYNProductController

#pragma mark - 重写init方法
- (instancetype)init
{
    UICollectionViewFlowLayout *flowLayout =[[UICollectionViewFlowLayout alloc] init];
    
    flowLayout.itemSize = CGSizeMake(76, 91);
    flowLayout.minimumLineSpacing = 5;
    flowLayout.minimumInteritemSpacing = 5;
    flowLayout.sectionInset = UIEdgeInsetsMake(20, 0, 0, 0);
    
    return [super initWithCollectionViewLayout:flowLayout];;
}


static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    UINib *cellNib = [UINib nibWithNibName:@"ZYNProductCell" bundle:nil];
    //初始化
    
    [self.collectionView registerNib: cellNib forCellWithReuseIdentifier:reuseIdentifier];
   
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.products.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ZYNProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.product = self.products[indexPath.row];
    
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ZYNProductCell *cell = (ZYNProductCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    ZYNProduct *pruduct =  cell.product;
    
    //拼接url
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@://%@",pruduct.customUrl,pruduct.ID]];
    //通过Application去打开应用
    UIApplication *application = [UIApplication sharedApplication];
    if ([application canOpenURL:url]) {
        //直接打开应用
        [application openURL:url];
    } else {
        //打开苹果应用上的地址
        [application openURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",pruduct.url]]];
    }
}

#pragma mark - 懒加载数据模型
-(NSArray *)products{
    if (_products == nil) {
        //加载json文件内容
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"more_project.json" ofType:nil];
        
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        //
        NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        //字典转模型
        NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:array.count];
        for (NSDictionary *dict in array) {
            [arrM addObject:[ZYNProduct productWithDict:dict]];
        }
        _products = [arrM copy];
    }
    
    return  _products;
}


@end
