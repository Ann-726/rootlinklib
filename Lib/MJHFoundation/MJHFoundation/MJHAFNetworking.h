//
//  MJHAFNetworking.h
//  MJHFoundation
//
//  Created by chni on 16/8/2.
//  Copyright © 2016年 孟家豪. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface MJHAFNetworking : NSObject

///请求成功block
typedef void (^successBlock)(NSURLSessionDataTask *task, id responseObject);

///请求失败block
typedef void (^failureBlock)(NSURLSessionDataTask *task,NSError *error);

typedef void (^formDataBlock)(id <AFMultipartFormData> formData);

typedef void (^progressBlock)(NSProgress * uploadProgress);

///创建SessionManager
+ (MJHAFNetworking *)shareMJHAFNetworking;


/**
 *  POST请求
 *
 *  @param url       网址
 *  @param parameter 参数字典
 *  @param time      请求超时时间
 *  @param success   请求成功
 *  @param failure   请求失败
 *
 */
- (NSURLSessionDataTask *)MJHPost:(NSString *)url
                        parameter:(NSDictionary *)parameter
                  timeOutInterval:(NSTimeInterval)time
                          success:(successBlock)success
                          failure:(failureBlock)failure;
/**
 *  GET请求
 *
 *  @param url       网址
 *  @param parameter 参数字典
 *  @param time      请求超时时间
 *  @param success   请求成功
 *  @param failure   请求失败
 *
 */
- (NSURLSessionDataTask *)MJHGet:(NSString *)url
                       parameter:(id)parameter
                 timeOutInterval:(NSTimeInterval)time
                         success:(successBlock)success
                         failure:(failureBlock)failure;

/**
 *  上传数据
 *
 *  @param url       网址
 *  @param parameter 参数
 *  @param time      上传时间
 *  @param dataProcessing     构造数据的地方,例：
 [formData appendPartWithFileData:imgData name:@"uploadFile" fileName:imgNameStr mimeType:@"image/jpg"];  //imgData图片数据，name上传参数名，fileName文件名
 *  @param progress   上传进度
 *  @param success   请求成功
 *  @param failure   请求失败
 *
 */
- (NSURLSessionDataTask *)MJHUploadFile:(NSString *)url
                              parameter:(NSDictionary *)parameter
                        timeOutInterval:(NSTimeInterval)time
                             uploadBody:(formDataBlock)dataProcessing
                         uploadProgress:(progressBlock)progress
                                success:(successBlock)success
                                failure:(failureBlock)failure;
@end
