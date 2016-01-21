//
//  MSHTTPClient+Cookie.h
//  LYHttpClient
//
//  Created by wuhh on 16/1/5.
//  Copyright © 2016年 wuhh. All rights reserved.
//

#import "MSHTTPClient.h"


@interface MSHTTPClient (Cookie)


/// 默认 MSHTTPClientReturnCacheDataThenLoad 的缓存方式
+ (NSURLSessionDataTask *)GET:(NSString *)URLString
                         host:(NSString *)HostString
                       cookie:(BOOL)cookie
                   parameters:(id)parameters
                      success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                      failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

+ (NSURLSessionDataTask *)POST:(NSString *)URLString
                          host:(NSString *)HostString
                        cookie:(BOOL)cookie
                    parameters:(id)parameters
                       success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

/// 自定义缓存 方式
+ (NSURLSessionDataTask *)GET:(NSString *)URLString
                         host:(NSString *)HostString
                       cookie:(BOOL)cookie
                   parameters:(id)parameters
                  cachePolicy:(MSHTTPClientRequestCachePolicy)cachePolicy
                      success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                      failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;


+ (NSURLSessionDataTask *)POST:(NSString *)URLString
                          host:(NSString *)HostString
                        cookie:(BOOL)cookie
                    parameters:(id)parameters
                   cachePolicy:(MSHTTPClientRequestCachePolicy)cachePolicy
                       success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;


/// 自定义parameters 的拼接方式  appendType: @"/" @"="    Get方法才有拼接方式
+ (NSURLSessionDataTask *)GET:(NSString *)URLString
                         host:(NSString *)HostString
                       cookie:(BOOL)cookie
                   parameters:(id)parameters
                   appendType:(NSString*)type
                  cachePolicy:(MSHTTPClientRequestCachePolicy)cachePolicy
                      success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                      failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

+ (NSURLSessionDataTask *)POST:(NSString *)URLString
                          host:(NSString *)HostString
                        cookie:(BOOL)cookie
                    parameters:(id)parameters
                    appendType:(NSString*)type
                   cachePolicy:(MSHTTPClientRequestCachePolicy)cachePolicy
                       success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;





@end
