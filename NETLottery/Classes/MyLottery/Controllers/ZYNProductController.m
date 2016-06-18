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

@property (nonatomic,strong) UICollectionViewFlowLayout *flowLayout;

@property (nonatomic,strong) NSArray *products;

@end

@implementation ZYNProductController

#pragma mark - 重写init方法
- (instancetype)init
{
    _flowLayout = [[UICollectionViewFlowLayout alloc] init];
    self = [super initWithCollectionViewLayout:_flowLayout];
    if (self) {
        
    }
    return self;
}


static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    UINib *cellNib = [UINib nibWithNibName:@"ZYNProductCell" bundle:nil];
    //初始化
    ZYNProductCell *cell = [[cellNib instantiateWithOwner:nil options:nil] lastObject];
    
    self.flowLayout.itemSize = cell.bounds.size;
    self.flowLayout.minimumLineSpacing = 5;
    self.flowLayout.minimumInteritemSpacing = 5;
    self.flowLayout.sectionInset = UIEdgeInsetsMake(20, 0, 0, 0);
    
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
