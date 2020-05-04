//
//  SVProgressHUD+MJHSVProgressHUDUtil.h
//  YDHealthy
//
//  Created by chni on 16/8/16.
//  Copyright © 2016年 孟家豪. All rights reserved.
//

#import  "SVProgressHUD.h"

@interface SVProgressHUD (MJHSVProgressHUDUtil)

+ (void)showErrorAndDismiss:(NSString *)errorMsg;

+ (void)showSuccessAndDismiss:(NSString *)successMsg;

@end
