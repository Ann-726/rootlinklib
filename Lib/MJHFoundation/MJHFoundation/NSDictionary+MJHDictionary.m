//
//  NSDictionary+MJHDictionary.m
//  MJHFoundation
//
//  Created by chni on 16/8/2.
//  Copyright © 2016年 孟家豪. All rights reserved.
//

#import "NSDictionary+MJHDictionary.h"

@implementation NSDictionary (MJHDictionary)


- (NSString *)descriptionWithLocale:(id)locale {
    NSMutableString *string = [NSMutableString string];
    
    // 开头有个{
    [string appendString:@"{\n"];
    
    // 遍历所有的键值对
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj,  BOOL *stop) {
        [string appendFormat:@"\t%@", key];
        [string appendString:@" : "];
        [string appendFormat:@"%@,\n", obj];
    }];
    
    // 结尾有个}
    [string appendString:@"}"];
    
    // 查找最后一个逗号
    NSRange range = [string rangeOfString:@"," options:NSBackwardsSearch];
    if (range.location != NSNotFound)
        [string deleteCharactersInRange:range];
    
    return string;
}


- (NSString *)dictionaryToJsonString {
    
    if ([NSJSONSerialization isValidJSONObject:self]) {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:0 error:&error];
        NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        if (!error) {
           return json;
        }
        NSLog(@"%@",error.localizedDescription);
    }
    return nil;
}

//- (NSDictionary *)appendParameterDictionary {
//    NSMutableDictionary *muParameterDictionary = [NSMutableDictionary dictionaryWithDictionary:self];
//    NSString *verifyTime = [NSDate getFormattedBeijingTime];
//    [muParameterDictionary setObject:[[NSString stringWithFormat:@"%@%@",verifyTime,YD_SYS_CODE] MD5Hex] forKey:@"token"];
//    [muParameterDictionary setObject:verifyTime forKey:@"time"];
//    [muParameterDictionary setObject:YD_KO forKey:@"ko"];
//    return muParameterDictionary;
//}

@end
