//
//  UIImageView+MJHImageView.m
//  YBH
//
//  Created by chni on 2017/4/7.
//  Copyright © 2017年 孟家豪. All rights reserved.
//

#import "UIImageView+MJHImageView.h"

@implementation UIImageView (MJHImageView)

- (UIImageView *)rotate360Degree {
    CABasicAnimation *animation = [ CABasicAnimation
                                   animationWithKeyPath: @"transform" ];
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    
    //围绕Z轴旋转，垂直与屏幕
    animation.toValue = [ NSValue valueWithCATransform3D:
                         
                         CATransform3DMakeRotation(M_PI, 0.0, 0.0, 1.0) ];
    animation.duration = 0.5;
    //旋转效果累计，先转180度，接着再旋转180度，从而实现360旋转
    animation.cumulative = YES;
    animation.repeatCount = 9999999;
    
    //在图片边缘添加一个像素的透明区域，去图片锯齿
    CGRect imageRrect = CGRectMake(0, 0,self.frame.size.width, self.frame.size.height);
    UIGraphicsBeginImageContext(imageRrect.size);
    [self.image drawInRect:CGRectMake(1,1,self.frame.size.width-2,self.frame.size.height-2)];
    self.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [self.layer addAnimation:animation forKey:nil];
    return self;
}

- (void)stopRotate360 {
    [self.layer removeAllAnimations];
}

@end
