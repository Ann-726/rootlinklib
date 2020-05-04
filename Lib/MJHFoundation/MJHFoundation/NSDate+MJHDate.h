//
//  NSDate+MJHDate.h
//  MJHFoundation
//
//  Created by chni on 16/8/2.
//  Copyright © 2016年 孟家豪. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 时间格式化类型
 */
typedef  NS_ENUM(NSInteger,MJHFormatterTypeEnum) {

    MJHFormatterShortDateStyle = 0,    /**< e.g. 16/8/3 */
    MJHFormatterMediumDateStyle,       /**< e.g. 2016年8月3日 */
    MJHFormatterLongDateStyle,         /**< e.g. 2016年8月3日 */
    MJHFormatterFullDateStyle,         /**< e.g. 2016年8月3日 星期三 */
    MJHFormatterDefaultStyle,          /**< e.g. 2016-08-03 13:44:29 */
    MJHFormatterShortTimeStyle,        /**< e.g. 下午1:53 */
    MJHFormatterMediumTimeStyle,       /**< e.g. 下午1:56:35 */
    MJHFormatterLongTimeStyle,         /**< e.g. GMT+8 下午1:57:56 */
    MJHFormatterFullTimeStyle          /**< e.g. 中国标准时间 下午1:58:59 */
    
};


@interface NSDate (MJHDate)

///获取北京时间（未格式化）
+ (NSDate *)getUnformattedBeijingTime;

///获取北京时间（格式化  e.g. yyyy-MM-dd HH:mm:ss）
+ (NSString *)getFormattedBeijingTime;

/**
 *  根据类型获取格式化字符串
 *
 *  @param type 类型
 *  @param date 时间
 *
 *  @return 格式化后的字符串
 */
+ (NSString *)getFormatterDateByStyle:(MJHFormatterTypeEnum)type
                                 date:(NSDate *)date;


/**
 *  判断时间是否在一段时间范围内
 *
 *  @param beginDate 开始时间
 *  @param endDate   结束时间
 *
 *  @return bool值
 */
- (BOOL)dateIsBetweenDate:(NSDate*)beginDate andDate:(NSDate*)endDate;

/**
 *
 *  @param dateFormat yyyyMMdd
 *  @param string 20170331
 *  @param type  MJHFormatterMediumDateStyle
 *
 *  @return 2017年3月31日
 */
+ (NSString *)formatDateToString:(NSString *)dateFormat dateString:(NSString *)string formatterType:(MJHFormatterTypeEnum)type;

@end
