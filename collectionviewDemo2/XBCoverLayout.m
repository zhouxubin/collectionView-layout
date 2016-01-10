//
//  XBCoverLayout.m
//  collectionviewDemo2
//
//  Created by mac on 16/1/9.
//  Copyright © 2016年 zhouxubin. All rights reserved.
//

#import "XBCoverLayout.h"

@implementation XBCoverLayout

- (void)prepareLayout {
    [super prepareLayout];
    self.itemSize = CGSizeMake(180, 180);
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    // 获取已经布局好的属性
    NSArray *attributes = [super layoutAttributesForElementsInRect:rect];
    for (UICollectionViewLayoutAttributes *attribute in attributes) {
        CGFloat centerX = self.collectionView.contentOffset.x + self.collectionView.bounds.size.width * 0.5;
        CGFloat scale = ABS((attribute.center.x - centerX) / (self.collectionView.bounds.size.width + self.itemSize.width * 0.5));
        // 如果scale大于0.5的话,那么cell的一半就滚出了可视范围
        if (scale > 0.5) {
            scale = 0.5;
        }
        attribute.transform = CGAffineTransformMakeScale(1 - scale, 1 - scale);
    }
    return attributes;
}

// 允许在重新布局的时候改变bounds
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    NSLog(@"%@", NSStringFromCGPoint(proposedContentOffset));
    CGRect rect;
    rect.origin = proposedContentOffset;
    rect.size = self.collectionView.bounds.size;
    NSArray *attributes = [super layoutAttributesForElementsInRect:rect];
    // 遍历布局属性,把离中心距离最小的布局取出来
    CGFloat gap = MAXFLOAT;
    CGFloat minDistance = 0;
    for (UICollectionViewLayoutAttributes *attribute in attributes) {
        if (gap > ABS(attribute.center.x - proposedContentOffset.x - self.collectionView.bounds.size.width * 0.5)) {
            gap = ABS(attribute.center.x - proposedContentOffset.x - self.collectionView.bounds.size.width * 0.5);
            minDistance = attribute.center.x - proposedContentOffset.x - self.collectionView.bounds.size.width * 0.5;
        }
    }
    CGPoint point = CGPointMake(proposedContentOffset.x + minDistance, proposedContentOffset.y);
    
    return point;
}

@end
