//
//  NSString+MJHHelper.h
//  MJHFoundation
//
//  Created by chni on 16/8/2.
//  Copyright © 2016年 孟家豪. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MJHHelper)


#pragma mark 验证

///检查是否为空
- (BOOL)isNull;

///检查手机号码
- (BOOL)isValidatePhoneNumber;

///判断邮箱
- (BOOL)isValidateEmail;

///判断是否为整形
- (BOOL)isValidatePureInt;

///判断是否为浮点形：
- (BOOL)isValidatePureFloat;

///判断是否为数字
- (BOOL)isIntAndValidatePureFloat;

///密码判断规则（6-14位，字母或数字）
- (BOOL)isValidatePasswordLegal;

- (BOOL)isNumberId;
///2-20位 字母或数字
- (BOOL)judgeUserNameWordLegal;
///校验身份证号码
- (BOOL)validateIDCardNumber;
///从身份证上获取性别
- (NSString *)getIdentityCardSex;
//根据身份证号码转换成生日
- (NSString *)birthdayStrFromIdentityCard;
#pragma mark 路径

///在Documents中创建路径
+ (NSString *)creatPathInDocuments:(NSString *)fileName;

///判断指定路径上文件是否存在
+ (BOOL)fileExistsAtPath:(NSString *)filePath;

#pragma mark 时间处理相关

///将yyyy-MM-dd HH:mm:ss 截取为yyyy-MM-dd
- (NSString *)cutOfftimeToDate;

#pragma mark 其他

///获取手机型号
+ (NSString *)iphoneType;


@end
