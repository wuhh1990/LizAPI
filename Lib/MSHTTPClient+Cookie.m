//
//  MSHTTPClient+Cookie.m
//  LYHttpClient
//
//  Created by wuhh on 16/1/5.
//  Copyright © 2016年 wuhh. All rights reserved.
//

#import "MSHTTPClient+Cookie.h"
#import "YYCache.h"
#import "NSJSONSerialization+LYJSON.h"

@implementation MSHTTPClient (Cookie)

#pragma mark - public 默认 优先缓存
//优先使用缓存
+ (NSURLSessionDataTask *)GET:(NSString *)URLString
                         host:(NSString *)HostString
                       cookie:(BOOL)cookie
                   parameters:(id)parameters
                      success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                      failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{
    
    NSString* URL = [NSString stringWithFormat:@"%@%@",HostString,URLString];
    
    return [self requestMethod:MSHTTPClientRequestTypeGET
                     urlString:URL
                        cookie:(BOOL)cookie
                    parameters:parameters
                   cachePolicy:MSHTTPClientReturnCacheDataThenLoad
                       success:success
                       failure:failure];
}

+ (NSURLSessionDataTask *)POST:(NSString *)URLString
                          host:(NSString *)HostString
                        cookie:(BOOL)cookie
                    parameters:(id)parameters
                       success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{
    
    NSString* URL = [NSString stringWithFormat:@"%@%@",HostString,URLString];
    
    return [self requestMethod:MSHTTPClientRequestTypePOST
                     urlString:URL
                        cookie:(BOOL)cookie
                    parameters:parameters
                   cachePolicy:MSHTTPClientReturnCacheDataThenLoad
                       success:success
                       failure:failure];
}

#pragma mark - Public 自定义缓存方式
+ (NSURLSessionDataTask *)GET:(NSString *)URLString
                         host:(NSString *)HostString
                       cookie:(BOOL)cookie
                   parameters:(id)parameters
                  cachePolicy:(MSHTTPClientRequestCachePolicy)cachePolicy
                      success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                      failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{
    
    NSString* URL = [NSString stringWithFormat:@"%@%@",HostString,URLString];
    
    return [self requestMethod:MSHTTPClientRequestTypeGET
                     urlString:URL
                        cookie:(BOOL)cookie
                    parameters:parameters
                   cachePolicy:cachePolicy
                       success:success
                       failure:failure];
}

+ (NSURLSessionDataTask *)POST:(NSString *)URLString
                          host:(NSString *)HostString
                        cookie:(BOOL)cookie
                    parameters:(id)parameters
                   cachePolicy:(MSHTTPClientRequestCachePolicy)cachePolicy
                       success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{
    
    NSString* URL = [NSString stringWithFormat:@"%@%@",HostString,URLString];
    
    return [self requestMethod:MSHTTPClientRequestTypePOST
                     urlString:URL
                        cookie:(BOOL)cookie
                    parameters:parameters
                   cachePolicy:cachePolicy
                       success:success
                       failure:failure];
}


#pragma mark - Public 自定义拼接方式
+ (NSURLSessionDataTask *)GET:(NSString *)URLString
                         host:(NSString *)HostString
                       cookie:(BOOL)cookie
                   parameters:(id)parameters
                   appendType:(NSString*)appendType
                  cachePolicy:(MSHTTPClientRequestCachePolicy)cachePolicy
                      success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                      failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{
    
    NSString* URL = [NSString stringWithFormat:@"%@%@",HostString,URLString];
    
    return [self requestMethod:MSHTTPClientRequestTypeGET
                     urlString:URL
                        cookie:(BOOL)cookie
                    parameters:parameters
                    appendType:(NSString*)appendType
                   cachePolicy:cachePolicy
                       success:success
                       failure:failure];
}

+ (NSURLSessionDataTask *)POST:(NSString *)URLString
                          host:(NSString *)HostString
                        cookie:(BOOL)cookie
                    parameters:(id)parameters
                    appendType:(NSString*)appendType
                   cachePolicy:(MSHTTPClientRequestCachePolicy)cachePolicy
                       success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{
    
    NSString* URL = [NSString stringWithFormat:@"%@%@",HostString,URLString];
    
    return [self requestMethod:MSHTTPClientRequestTypePOST
                     urlString:URL
                        cookie:(BOOL)cookie
                    parameters:parameters
                    appendType:(NSString*)appendType
                   cachePolicy:cachePolicy
                       success:success
                       failure:failure];
}













#pragma mark - private
/// '/'
+ (NSString *)appendUrl_A:(NSString *)url params:(NSDictionary *)params
{
    NSLog(@"%@", url);
    NSMutableString *newUrl = [NSMutableString stringWithFormat:@"%@",url];
    if (params) {
        [params enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *value, BOOL *stop) {
            
            NSString *str = [NSString stringWithFormat:@"%@/%@/",key,value];
            [newUrl appendString:str];
        }];
    }
    
    newUrl = [[[newUrl copy] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] mutableCopy];
    
    return newUrl;
}
/// '='
+ (NSString *)appendUrl_B:(NSString *)url params:(NSDictionary *)params
{
    NSMutableString *newUrl = [NSMutableString stringWithFormat:@"%@",url];
    if (params) {
        [params enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *value, BOOL *stop) {
            
            NSString *str = [NSString stringWithFormat:@"%@=%@&",key,value];
            [newUrl appendString:str];
        }];
    }
    newUrl = [[[newUrl copy] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] mutableCopy];
    return newUrl;
}

///需要拼接
+ (NSURLSessionDataTask *)requestMethod:(MSHTTPClientRequestType)type
                              urlString:(NSString *)URLString
                                 cookie:(BOOL)cookie
                             parameters:(id)parameters
                             appendType:(NSString*)appendType
                            cachePolicy:(MSHTTPClientRequestCachePolicy)cachePolicy
                                success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                                failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{
    
    if (type == MSHTTPClientRequestTypeGET) {
        if([appendType isEqualToString:@"/"]) {
            URLString = [self appendUrl_A:URLString params:parameters];
            parameters = nil;
        }else if([appendType isEqualToString:@"="]) {
            URLString = [self appendUrl_B:URLString params:parameters];
            parameters = nil;
        }
    }
    
    return [self requestMethod:type
                     urlString:URLString
                        cookie:(BOOL)cookie
                    parameters:parameters
                   cachePolicy:cachePolicy
                       success:success
                       failure:failure];
}

///无需拼接
+ (NSURLSessionDataTask *)requestMethod:(MSHTTPClientRequestType)type
                              urlString:(NSString *)URLString
                                 cookie:(BOOL)cookie
                             parameters:(id)parameters
                            cachePolicy:(MSHTTPClientRequestCachePolicy)cachePolicy
                                success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                                failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure {
    NSString *cacheKey = URLString;
    if (parameters) {
        if (![NSJSONSerialization isValidJSONObject:parameters]) return nil;//参数不是json类型
        NSData *data = [NSJSONSerialization dataWithJSONObject:parameters options:NSJSONWritingPrettyPrinted error:nil];
        NSString *paramStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        cacheKey = [URLString stringByAppendingString:paramStr];
    }
    
    YYCache *cache = [[YYCache alloc] initWithName:MSHTTPClientRequestCache];
    cache.memoryCache.shouldRemoveAllObjectsOnMemoryWarning = YES;
    cache.memoryCache.shouldRemoveAllObjectsWhenEnteringBackground = YES;
    
    id object = [cache objectForKey:cacheKey];
    
    switch (cachePolicy) {
        case MSHTTPClientReturnCacheDataThenLoad: {//先返回缓存，同时请求
            if (object) {
                success(nil,object);
            }
            break;
        }
        case MSHTTPClientReloadIgnoringLocalCacheData: {//忽略本地缓存直接请求
            //不做处理，直接请求
            break;
        }
        case MSHTTPClientReturnCacheDataElseLoad: {//有缓存就返回缓存，没有就请求
            if (object) {//有缓存
                success(nil,object);
                return nil;
            }
            break;
        }
        case MSHTTPClientReturnCacheDataDontLoad: {//有缓存就返回缓存,从不请求（用于没有网络）
            if (object) {//有缓存
                success(nil,object);
            }
            return nil;//退出从不请求
        }
        default: {
            break;
        }
    }
    return [self requestMethod:type
                     urlString:URLString
                        cookie:(BOOL)cookie
                    parameters:parameters
                         cache:cache
                      cacheKey:cacheKey
                       success:success
                       failure:failure];
    
}
+ (NSURLSessionDataTask *)requestMethod:(MSHTTPClientRequestType)type
                              urlString:(NSString *)URLString
                                 cookie:(BOOL)cookie
                             parameters:(id)parameters
                                  cache:(YYCache *)cache
                               cacheKey:(NSString *)cacheKey
                                success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                                failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{
    
    AFHTTPSessionManager* manager = [MSHTTPClient sharedClient];
    
    NSLog(@"Has Sign In:%d  \n%@ \n%@ \n%@",MYUSERINFO.hasSignIn,URLString,parameters,cacheKey);
    
    if (cookie && MYUSERINFO.hasSignIn) {
        NSDictionary *headers = [CommonMethod getCookies];
        [manager.requestSerializer setValue:[headers objectForKey:@"Cookie"] forHTTPHeaderField:@"Cookie"];
        NSLog(@"cookie:%@",headers);
    }
    
    switch (type) {
        case MSHTTPClientRequestTypeGET:{
            return [manager GET:URLString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
                if ([responseObject isKindOfClass:[NSData class]]) {
                    responseObject = [NSJSONSerialization objectWithJSONData:responseObject];
                }
                [cache setObject:responseObject forKey:cacheKey];//YYCache 已经做了responseObject为空处理
                success(task,responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                failure(task, error);
            }];
            break;
        }
        case MSHTTPClientRequestTypePOST:{
            return [manager POST:URLString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
                if ([responseObject isKindOfClass:[NSData class]]) {
                    responseObject = [NSJSONSerialization objectWithJSONData:responseObject];
                }
                [cache setObject:responseObject forKey:cacheKey];//YYCache 已经做了responseObject为空处理
                success(task,responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                failure(task, error);
            }];
            break;
        }
        default:
            break;
    }
}




@end





