//
//  XBImageViewCell.m
//  collectionviewDemo2
//
//  Created by mac on 16/1/9.
//  Copyright © 2016年 zhouxubin. All rights reserved.
//

#import "XBImageViewCell.h"

@interface XBImageViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end

@implementation XBImageViewCell

- (void)setImage:(UIImage *)image {
    _image = image;
    self.imageView.image = image;
}

@end
