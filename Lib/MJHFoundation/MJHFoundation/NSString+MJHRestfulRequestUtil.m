//
//  NSString+MJHRestfulRequestUtil.m
//  YDHealthy
//
//  Created by chni on 16/8/16.
//  Copyright © 2016年 孟家豪. All rights reserved.
//

#import "NSString+MJHRestfulRequestUtil.h"
@implementation NSString (MJHRestfulRequestUtil)

- (NSString *)appendParameterUrlForparameterArray:(NSArray *)array {
    NSMutableArray *muParameterArray = [NSMutableArray arrayWithArray:array];
    return [NSString stringWithFormat:@"%@/%@",self,[muParameterArray componentsJoinedByString:@"/"]];
}

- (NSString *)stringToUTF8String {
    return [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
}



@end
