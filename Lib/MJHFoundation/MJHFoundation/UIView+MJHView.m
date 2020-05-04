//
//  UIView+MJHView.m
//  MJHFoundation
//
//  Created by cocoa on 2018/6/5.
//

#import "UIView+MJHView.h"

@implementation UIView (MJHView)

+ (UIView *)buildNavTitleView:(NSString *)title {
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 46)];
    UILabel *titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 46)];
    titleLabel.text = title;
    titleLabel.textColor=[UIColor colorWithRed:24.0/255.0 green:25.0/255.0 blue:27.0/255.0 alpha:1];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    titleLabel.font=[UIFont systemFontOfSize:20];
    [view addSubview:titleLabel];
    return view;
}

+ (UIView *)buildNavImageView:(NSString *)imageName {
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-34, 7, 68, 33)];
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width,view.frame.size.height)];
    [imageView setImage:[UIImage imageNamed:imageName]];
    [view addSubview:imageView];
    return view;
}

- (void)setBorderWithView:(BOOL)top left:(BOOL)left bottom:(BOOL)bottom right:(BOOL)right borderColor:(UIColor *)color borderWidth:(CGFloat)width isShort:(NSString *)shortBorder
{
    if (top) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, 0, self.frame.size.width, width);
        layer.backgroundColor = color.CGColor;
        [self.layer addSublayer:layer];
    }
    if (left) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, 0, width, self.frame.size.height);
        layer.backgroundColor = color.CGColor;
        [self.layer addSublayer:layer];
    }
    if (bottom) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, self.frame.size.height - width, self.frame.size.width, width);
        layer.backgroundColor = color.CGColor;
        [self.layer addSublayer:layer];
    }
    if (right) {
        CALayer *layer = [CALayer layer];
        if ([shortBorder isEqualToString:@"top"]) {
            layer.frame = CGRectMake(self.frame.size.width - width, [UIScreen mainScreen].bounds.size.height*0.0260, width, self.frame.size.height - [UIScreen mainScreen].bounds.size.height*0.0260);
        }else if ([shortBorder isEqualToString:@"buttom"]) {
            layer.frame = CGRectMake(self.frame.size.width - width, 0, width, self.frame.size.height - [UIScreen mainScreen].bounds.size.height*0.0260);
        }else{
            layer.frame = CGRectMake(self.frame.size.width - width, 0, width, self.frame.size.height);
        }
        layer.backgroundColor = color.CGColor;
        [self.layer addSublayer:layer];
    }
}

@end
