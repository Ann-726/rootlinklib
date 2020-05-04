//
//  UIView+MJHView.h
//  MJHFoundation
//
//  Created by cocoa on 2018/6/5.
//

#import <UIKit/UIKit.h>

@interface UIView (MJHView)

+ (UIView *)buildNavTitleView:(NSString *)title;
+ (UIView *)buildNavImageView:(NSString *)imageName;


- (void)setBorderWithView:(BOOL)top left:(BOOL)left bottom:(BOOL)bottom right:(BOOL)right borderColor:(UIColor *)color borderWidth:(CGFloat)width isShort:(NSString *)shortBorder;
@end
