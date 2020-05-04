//
//  UIButton+MJHButton.h
//  YDHealthy
//
//  Created by chni on 16/8/12.
//  Copyright © 2016年 孟家豪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (MJHButton)

 
/**
 *  倒计时
 *
 *  @param title       倒计时完成后显示标题
 *  @param time        倒计时时间
 *  @param cancelBlock 取消或完成计时回调
 *
 *  @return 定时器对象
 */
- (dispatch_source_t)countDown:(NSString *)title
                 countDownTime:(NSInteger)time
                    resetColor:(UIColor *)color
                         block:(void(^)(void))cancelBlock;


- (int)count:(int)number;

@end
