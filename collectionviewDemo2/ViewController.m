//
//  ViewController.m
//  collectionviewDemo2
//
//  Created by mac on 16/1/9.
//  Copyright © 2016年 zhouxubin. All rights reserved.
//

#import "ViewController.h"
#import "XBImageViewCell.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;

@property (nonatomic, strong) NSArray *images;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // 设置内边距
    self.myCollectionView.contentInset = UIEdgeInsetsMake(0, self.myCollectionView.bounds.size.width * 0.5 - 180, 0, self.myCollectionView.bounds.size.width * 0.5 - 180);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // 取出图片
    UIImage *image = self.images[indexPath.item];
    XBImageViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.image = image;
    return cell;
}

#pragma mark - 懒加载
- (NSArray *)images {
    if (!_images) {
        NSMutableArray *arrayM = [NSMutableArray array];
        for (int i = 1; i < 21; i++) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d", i]];
            [arrayM addObject:image];
        }
        _images = arrayM;
    }
    return _images;
}

@end
