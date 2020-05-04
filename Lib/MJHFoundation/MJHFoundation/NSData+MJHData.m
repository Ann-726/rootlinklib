//
//  NSData+MJHData.m
//  MJHFoundation
//
//  Created by chni on 16/8/2.
//  Copyright © 2016年 孟家豪. All rights reserved.
//

#import "NSData+MJHData.h"

@implementation NSData (MJHData)

- (NSString *)hexadecimalString {
    NSUInteger len = [self length];
    
    if (len == 0)
    {
        return nil;
    }
    
    const Byte *p = [self bytes];
    
    NSMutableString *hexString = [[NSMutableString alloc] initWithCapacity:len*2];
    
    for (int i=0; i < len; i++)
    {
        [hexString appendFormat:@"%02x", *p++];
    }
    
    return [hexString uppercaseString];
}


@end
