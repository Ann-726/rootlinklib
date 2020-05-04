//
//  UIColor+MJHColor.h
//  MJHFoundation
//
//  Created by chni on 16/8/2.
//  Copyright © 2016年 孟家豪. All rights reserved.
//

#import <UIKit/UIKit.h>

#define RGBA_COLOR(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

@interface UIColor (MJHColor)
///hex值返回颜色
+ (UIColor *)colorWithHexString:(NSString *)hexString;

@end
