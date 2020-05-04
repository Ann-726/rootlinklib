//
//  NSDictionary+MJHDictionary.h
//  MJHFoundation
//
//  Created by chni on 16/8/2.
//  Copyright © 2016年 孟家豪. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (MJHDictionary)


///将字典对象转为json字符串
- (NSString *)dictionaryToJsonString;

///参数字典处理（ko、time、token）
//- (NSDictionary *)appendParameterDictionary;

@end
