
//
//  LoadingView.m
//  LoadingAnimation
//
//  Created by IsLand on 16/1/8.
//  Copyright © 2016年 IsLand. All rights reserved.
//

#import "LoadingView.h"

@interface LoadingView ()

@property (nonatomic , strong) UIImageView *imageView;


@property (nonatomic ,   weak) CAReplicatorLayer *replicatorLayer;


@end

@implementation LoadingView

singleton_implementation(LoadingView)

- (void)addLoading:(UIViewController *)currentContrler
{
    self.frame = CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    self.backgroundColor = [UIColor clearColor];
    [currentContrler.view addSubview:self];
    [self addImageView];
    [self addReplicatorLayer];
    [self addAnimation];
   
}
- (void)addImageView
{
    UIImageView *imageView = [[UIImageView alloc]init];
    [self addSubview:imageView];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.frame = CGRectMake(172, 200,6, 6);
    imageView.backgroundColor = [UIColor orangeColor];
    imageView.layer.cornerRadius = 3;
    imageView.layer.masksToBounds = YES;
    imageView.layer.transform = CATransform3DMakeScale(0.01, 0.01, 0.01);
    _imageView = imageView;
}

- (void)addReplicatorLayer
{
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.bounds = CGRectMake(200, 200,10, 10);
    replicatorLayer.position = self.center;
    replicatorLayer.preservesDepth = YES;
    [replicatorLayer addSublayer:_imageView.layer];
    [self.layer addSublayer:replicatorLayer];
    _replicatorLayer = replicatorLayer;
}
- (void)addAnimation
{

    CGFloat count = 15.0;
    _replicatorLayer.instanceDelay = 1.0 / count;
    _replicatorLayer.instanceCount = count;
    //相对于_replicatorLayer.position旋转
    _replicatorLayer.instanceTransform = CATransform3DMakeRotation((2 * M_PI) / count, 0, 0, 1.0);
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.duration = 1;
    animation.repeatCount = MAXFLOAT;
    //    animation.autoreverses = YES;
    //从原大小变小时,动画 回到原状时不要动画
    animation.fromValue = @(1);
    animation.toValue = @(0.01);
    [_imageView.layer addAnimation:animation forKey:nil];

}

- (void)removeLoading
{

    [self removeFromSuperview];

}
@end
