//
//  MSHTTPClient.m
//  MSHTTPClient
//
//  Created by wuhh on 15/12/28.
//  Copyright © 2015年 wuhh. All rights reserved.
//

#import "MSHTTPClient.h"


@implementation MSHTTPClient


#pragma mark - public With Cookie




#pragma mark - public 默认 优先缓存
//优先使用缓存
+ (NSURLSessionDataTask *)GET:(NSString *)URLString
                         host:(NSString *)HostString
                   parameters:(id)parameters
                      success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                      failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{
    
    NSString* URL = [NSString stringWithFormat:@"%@%@",HostString,URLString];
    
    return [self requestMethod:MSHTTPClientRequestTypeGET
                     urlString:URL
                    parameters:parameters
                   cachePolicy:MSHTTPClientReturnCacheDataThenLoad
                       success:success
                       failure:failure];
}

+ (NSURLSessionDataTask *)POST:(NSString *)URLString
                          host:(NSString *)HostString
                    parameters:(id)parameters
                       success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{
    
    NSString* URL = [NSString stringWithFormat:@"%@%@",HostString,URLString];
    
    return [self requestMethod:MSHTTPClientRequestTypePOST
                     urlString:URL
                    parameters:parameters
                   cachePolicy:MSHTTPClientReturnCacheDataThenLoad
                       success:success
                       failure:failure];
}

#pragma mark - Public 自定义缓存方式
+ (NSURLSessionDataTask *)GET:(NSString *)URLString
                         host:(NSString *)HostString
                   parameters:(id)parameters
                  cachePolicy:(MSHTTPClientRequestCachePolicy)cachePolicy
                      success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                      failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{
    
    NSString* URL = [NSString stringWithFormat:@"%@%@",HostString,URLString];
    
    return [self requestMethod:MSHTTPClientRequestTypeGET
                     urlString:URL
                    parameters:parameters
                   cachePolicy:cachePolicy
                       success:success
                       failure:failure];
}

+ (NSURLSessionDataTask *)POST:(NSString *)URLString
                          host:(NSString *)HostString
                    parameters:(id)parameters
                   cachePolicy:(MSHTTPClientRequestCachePolicy)cachePolicy
                       success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{
    
    NSString* URL = [NSString stringWithFormat:@"%@%@",HostString,URLString];
    
    return [self requestMethod:MSHTTPClientRequestTypePOST
                     urlString:URL
                    parameters:parameters
                   cachePolicy:cachePolicy
                       success:success
                       failure:failure];
}


#pragma mark - Public 自定义拼接方式
+ (NSURLSessionDataTask *)GET:(NSString *)URLString
                         host:(NSString *)HostString
                   parameters:(id)parameters
                   appendType:(NSString*)appendType
                  cachePolicy:(MSHTTPClientRequestCachePolicy)cachePolicy
                      success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                      failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{
    
    NSString* URL = [NSString stringWithFormat:@"%@%@",HostString,URLString];
    
    return [self requestMethod:MSHTTPClientRequestTypeGET
                     urlString:URL
                    parameters:parameters
                    appendType:(NSString*)appendType
                   cachePolicy:cachePolicy
                       success:success
                       failure:failure];
}

+ (NSURLSessionDataTask *)POST:(NSString *)URLString
                          host:(NSString *)HostString
                    parameters:(id)parameters
                    appendType:(NSString*)appendType
                   cachePolicy:(MSHTTPClientRequestCachePolicy)cachePolicy
                       success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{
    
    NSString* URL = [NSString stringWithFormat:@"%@%@",HostString,URLString];
    
    return [self requestMethod:MSHTTPClientRequestTypePOST
                     urlString:URL
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
                             parameters:(id)parameters
                             appendType:(NSString*)appendType
                            cachePolicy:(MSHTTPClientRequestCachePolicy)cachePolicy
                                success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                                failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{
    
    if (type == MSHTTPClientRequestTypeGET) {
        if([appendType isEqualToString:@"/"]){
            URLString = [[self class] appendUrl_A:URLString params:parameters];
            parameters = nil;
        }else if([appendType isEqualToString:@"="]){
            URLString = [[self class] appendUrl_B:URLString params:parameters];
            parameters = nil;
        }
    }
    
    return [self requestMethod:type
                     urlString:URLString
                    parameters:parameters
                   cachePolicy:cachePolicy
                       success:success
                       failure:failure];
}

///无需拼接
+ (NSURLSessionDataTask *)requestMethod:(MSHTTPClientRequestType)type
                              urlString:(NSString *)URLString
                             parameters:(id)parameters
                            cachePolicy:(MSHTTPClientRequestCachePolicy)cachePolicy
                                success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                      failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{
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
                    parameters:parameters
                         cache:cache
                      cacheKey:cacheKey
                       success:success
                       failure:failure];
    
}
+ (NSURLSessionDataTask *)requestMethod:(MSHTTPClientRequestType)type
                              urlString:(NSString *)URLString
                             parameters:(id)parameters
                                  cache:(YYCache *)cache
                               cacheKey:(NSString *)cacheKey
                                success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                                failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{
    
    AFHTTPSessionManager* manager = [MSHTTPClient sharedClient];
    
    switch (type) {
        case MSHTTPClientRequestTypeGET:{
            return [manager GET:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
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
            return [manager POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
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
/// URLString 应该是全url 上传单个文件
+ (NSURLSessionUploadTask *)upload:(NSString *)URLString filePath:(NSString *)filePath parameters:(id)parameters{
    NSURL *URL = [NSURL URLWithString:URLString];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    NSURL *fileUrl = [NSURL fileURLWithPath:filePath];
    NSURLSessionUploadTask *uploadTask = [[MSHTTPClient client] uploadTaskWithRequest:request
                                                                             fromFile:fileUrl
                                                                             progress:nil
                                                                    completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            NSLog(@"Success: %@ %@", response, responseObject);
        }
    }];
    [uploadTask resume];
    return uploadTask;
}

+ (instancetype)sharedClient{
    static MSHTTPClient *sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      sharedClient = [MSHTTPClient client];
    });
    return sharedClient;
}

+ (instancetype)client{
    
    MSHTTPClient* HTTPClient = [MSHTTPClient manager];
    HTTPClient.requestSerializer.timeoutInterval = MSHTTPClientTimeoutInterval;  //超时 时间设置
    
    return HTTPClient;
}

+ (void)cancelAllRequests {
    
    AFHTTPSessionManager* manager = [MSHTTPClient sharedClient];
    [manager.dataTasks enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL * stop) {
        NSURLSessionDataTask *task = obj;
        [task cancel];
    }];
}

@end
