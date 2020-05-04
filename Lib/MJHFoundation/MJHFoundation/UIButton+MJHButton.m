//
//  UIButton+MJHButton.m
//  YDHealthy
//
//  Created by chni on 16/8/12.
//  Copyright © 2016年 孟家豪. All rights reserved.
//

#import "UIButton+MJHButton.h"



@implementation UIButton (MJHButton)




- (dispatch_source_t)countDown:(NSString *)title
                 countDownTime:(NSInteger)time
                    resetColor:(UIColor *)color
                         block:(void(^)(void))cancelBlock;
 {
    //全局并发队列
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //主队列；属于串行队列
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
   
    //定时循环执行事件
    //dispatch_source_set_timer 方法值得一提的是最后一个参数（leeway），他告诉系统我们需要计时器触发的精准程度。所有的计时器都不会保证100%精准，这个参数用来告诉系统你希望系统保证精准的努力程度。如果你希望一个计时器每5秒触发一次，并且越准越好，那么你传递0为参数。另外，如果是一个周期性任务，比如检查email，那么你会希望每10分钟检查一次，但是不用那么精准。所以你可以传入60，告诉系统60秒的误差是可接受的。他的意义在于降低资源消耗。
    
    __block  NSInteger _surplusSecond = time;

    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, globalQueue);
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC, 0.0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{ //计时器事件处理器
        if (_surplusSecond <= 0) {
            dispatch_source_cancel(timer); //取消定时循环计时器；使得句柄被调用，即事件被执行
            dispatch_async(mainQueue, ^{
                self.enabled = YES;
                [self setTitle:title forState:UIControlStateNormal];
                [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                [self setBackgroundColor:color];
//                _surplusSecond = time;
            });
        } else {
            _surplusSecond--;
            dispatch_async(mainQueue, ^{
                NSString *btnInfo = [NSString stringWithFormat:@"重新获取（%lds）", (long)(_surplusSecond + 1)];
                self.enabled = NO;
                [self setTitle:btnInfo forState:UIControlStateDisabled];
                [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                [self setBackgroundColor:[UIColor grayColor]];
            });
        }
    });
    dispatch_source_set_cancel_handler(timer, ^{ //计时器取消处理器；调用 dispatch_source_cancel 时执行
        if (cancelBlock) {
            cancelBlock();
        }
    });
    dispatch_resume(timer);  //恢复定时循环计时器；Dispatch Source 创建完后默认状态是挂起的，需要主动恢复，否则事件不会被传递，也不会被执行
    return timer;
}

- (int)count:(int)number {
    return number;
}

@end
