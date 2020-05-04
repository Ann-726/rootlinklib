//
//  NSString+MJHRestfulRequestUtil.h
//  YDHealthy
//
//  Created by chni on 16/8/16.
//  Copyright © 2016年 孟家豪. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MJHRestfulRequestUtil)


///拼接url
- (NSString *)appendParameterUrlForparameterArray:(NSArray *)array;

- (NSString *)stringToUTF8String;

@end
