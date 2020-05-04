//
//  NSString+MJHEncryption.h
//  MJHFoundation
//
//  Created by chni on 16/8/2.
//  Copyright © 2016年 孟家豪. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MJHEncryption)


///进行MD5编码
- (NSString *)MD5Hex;

///从16进制的字符串格式转换为NSData
- (NSData *)hexadecimalStringToData;

@end
