//
//  MSHTTPClient.h
//  MSHTTPClient
//
//  Created by wuhhon 15/12/28.
//  Copyright © 2015年 wuhh. All rights reserved.
//

#import "AFNetworking.h"
#import "YYCache.h"
#import "NSJSONSerialization+LYJSON.h"

#define MSHTTPClientTimeoutInterval  15

static NSString * const MSHTTPClientRequestCache = @"MSHTTPClientRequestCache";


typedef NS_ENUM(NSUInteger, MSHTTPClientRequestCachePolicy){
    MSHTTPClientReturnCacheDataThenLoad = 0,  ///< 有缓存就先返回缓存，同步请求数据
    MSHTTPClientReloadIgnoringLocalCacheData, ///< 忽略缓存，重新请求
    MSHTTPClientReturnCacheDataElseLoad,      ///< 有缓存就用缓存，没有缓存就重新请求(用于数据不变时)
    MSHTTPClientReturnCacheDataDontLoad,      ///< 有缓存就用缓存，没有缓存就不发请求，当做请求出错处理（用于离线模式）
};



typedef NS_ENUM(NSUInteger, MSHTTPClientRequestType) {
    MSHTTPClientRequestTypeGET = 0,
    MSHTTPClientRequestTypePOST,
};


@interface MSHTTPClient : AFHTTPSessionManager

+ (instancetype)sharedClient;

+ (void)cancelAllRequests;

/// 默认 MSHTTPClientReturnCacheDataThenLoad 的缓存方式
+ (NSURLSessionDataTask *)GET:(NSString *)URLString
                         host:(NSString *)HostString
                   parameters:(id)parameters
                      success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                      failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

+ (NSURLSessionDataTask *)POST:(NSString *)URLString
                          host:(NSString *)HostString
                    parameters:(id)parameters
                       success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

/// 自定义缓存 方式
+ (NSURLSessionDataTask *)GET:(NSString *)URLString
                         host:(NSString *)HostString
                   parameters:(id)parameters
                  cachePolicy:(MSHTTPClientRequestCachePolicy)cachePolicy
                      success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                      failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;


+ (NSURLSessionDataTask *)POST:(NSString *)URLString
                          host:(NSString *)HostString
                    parameters:(id)parameters
                   cachePolicy:(MSHTTPClientRequestCachePolicy)cachePolicy
                       success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;


/// 自定义parameters 的拼接方式  appendType: @"/" @"="    Get方法才有拼接方式
+ (NSURLSessionDataTask *)GET:(NSString *)URLString
                         host:(NSString *)HostString
                   parameters:(id)parameters
                   appendType:(NSString*)type
                  cachePolicy:(MSHTTPClientRequestCachePolicy)cachePolicy
                      success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                      failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

+ (NSURLSessionDataTask *)POST:(NSString *)URLString
                          host:(NSString *)HostString
                    parameters:(id)parameters
                    appendType:(NSString*)type
                   cachePolicy:(MSHTTPClientRequestCachePolicy)cachePolicy
                       success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;


@end



