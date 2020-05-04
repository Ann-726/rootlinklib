//
//  NSObject+MJHRuntime.m
//  YDHealthy
//
//  Created by chni on 16/9/5.
//  Copyright © 2016年 孟家豪. All rights reserved.
//

#import "NSObject+MJHRuntime.h"
#import <objc/runtime.h>
@implementation NSObject (MJHRuntime)


///交换实例方法
+ (BOOL)exchangeInstanceMethodInClass:(SEL)basicSel with:(SEL)newSel {
    Method originalMethod = class_getInstanceMethod(self, basicSel);
    Method newMethod = class_getInstanceMethod(self, newSel);
    if (!originalMethod || !newMethod) return NO;
    
    class_addMethod(self,
                    basicSel,
                    class_getMethodImplementation(self, basicSel),
                    method_getTypeEncoding(originalMethod));
    class_addMethod(self,
                    newSel,
                    class_getMethodImplementation(self, newSel),
                    method_getTypeEncoding(newMethod));
    
    method_exchangeImplementations(class_getInstanceMethod(self, basicSel),
                                   class_getInstanceMethod(self, newSel));
    return YES;
}

@end
