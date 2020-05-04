//
//  SVProgressHUD+MJHSVProgressHUDUtil.m
//  YDHealthy
//
//  Created by chni on 16/8/16.
//  Copyright © 2016年 孟家豪. All rights reserved.
//

#import "SVProgressHUD+MJHSVProgressHUDUtil.h"
#import "NSString+MJHHelper.h"
#define SHOW_TIME 2.0

@implementation SVProgressHUD (MJHSVProgressHUDUtil)

+ (void)showErrorAndDismiss:(NSString *)errorMsg {
    if ([errorMsg isNull]) {
        errorMsg = @"";
    }
    
//    [SVProgressHUD setMinimumDismissTimeInterval:SHOW_TIME];
    dispatch_async(dispatch_get_main_queue(), ^{
        [SVProgressHUD showErrorWithStatus:errorMsg];
    });
}


+ (void)showSuccessAndDismiss:(NSString *)successMsg {
    if ([successMsg isNull]) {
        successMsg = @"";
    }
   
//    [SVProgressHUD setMinimumDismissTimeInterval:SHOW_TIME];
    dispatch_async(dispatch_get_main_queue(), ^{
        [SVProgressHUD showSuccessWithStatus:successMsg];
    });
}

@end
