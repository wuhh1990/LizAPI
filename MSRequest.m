//
//  MSRequest.m
//  Zhuangpin
//
//  Created by wuhh on 16/1/5.
//  Copyright © 2016年 ZhuangPin. All rights reserved.
//

#import "MSRequest.h"
#import "MSHTTPClient+Cookie.h"


@implementation MSRequest

#pragma mark - public   Get
+ (NSURLSessionDataTask *)GET:(UIViewController*)vc
                         host:(NSString*)host
                          url:(NSString*)url
                        param:(id)param
                          tag:(NSInteger)tag
                        block:(API_BLOCK)block
{
    return [[self class] GET:vc
                        host:host
                         url:url
                       param:param
                      cookie:NO
                         tag:tag
                       block:block];
}

+ (NSURLSessionDataTask *)GETCookie:(UIViewController*)vc
                               host:(NSString*)host
                                url:(NSString*)url
                              param:(id)param
                                tag:(NSInteger)tag
                              block:(API_BLOCK)block
{
    return [[self class] GET:vc
                        host:host
                         url:url
                       param:param
                      cookie:YES
                         tag:tag
                       block:block];
}





#pragma mark - public      Post
+ (NSURLSessionDataTask *)POST:(UIViewController*)vc
                          host:(NSString*)host
                           url:(NSString*)url
                         param:(id)param
                           tag:(NSInteger)tag
                         block:(API_BLOCK)block
{
    return [[self class] POST:vc
                         host:host
                          url:url
                        param:param
                       cookie:NO
                          tag:tag
                        block:block];
}

+ (NSURLSessionDataTask *)POSTCookie:(UIViewController*)vc
                                host:(NSString*)host
                                 url:(NSString*)url
                               param:(id)param
                                 tag:(NSInteger)tag
                               block:(API_BLOCK)block
{
    return [[self class] POST:vc
                         host:host
                          url:url
                        param:param
                       cookie:YES
                          tag:tag
                        block:block];
}



#pragma mark - private
+ (NSURLSessionDataTask *)GET:(UIViewController*)vc
                         host:(NSString*)host
                          url:(NSString*)url
                        param:(id)param
                       cookie:(BOOL)cookie
                          tag:(NSInteger)tag
                        block:(API_BLOCK)block {
    
    if (!(APP_DELEGATE).isReachable) {
        [CAQIRequest HUDWithStr:NOT_CONNECT_STR View:vc.view];
        return nil;
    }
    
    if (tag>0) {
        [CAQIRequest showHudInView:vc.view tag:tag];
    }
    
    return [MSHTTPClient GET:url
                        host:host
                      cookie:cookie
                  parameters:param
                  appendType:@"/"
                 cachePolicy:MSHTTPClientReloadIgnoringLocalCacheData
                     success:^(NSURLSessionDataTask *task, id responseObject){
                         
                         if (tag>0) {
                             [CAQIRequest hideHudInView:vc.view mtag:tag];
                         }
                         
                         NSString* errmsg = nil;
                         NSInteger code = APICODE_OTHER;
                         
                         int status = [[responseObject objectForKey:@"errno"] intValue];
                         id data = [responseObject objectForKey:@"data"];
                         
                         if(status==0){
                             
                             code = APICODE_SUCCESS;
                             
                             if ([data isKindOfClass:[NSArray class]]) {
                                 code = APICODE_SUCCESS_ARR;
                             }
                             if ([data isKindOfClass:[NSDictionary class]]) {
                                 code = APICODE_SUCCESS_DIC;
                             }
                             if ([data isKindOfClass:[NSString class]]) {
                                 code = APICODE_SUCCESS_STR;
                             }
                             
                         }else if(status == 120101){
                             code = APICODE_WRONG_SPECIAL_BIND;  //绑定时候，出现该错误,说明存在授权缓存.要取消授权.
                         }else{
                             code   = APICODE_WRONG;
                             errmsg = [responseObject objectForKey:@"errmsg"];
                             [CommonMethod MBProgressText:vc.view text:errmsg];
                             
                             NSLog(@"URL_MSG:%@  %@",url,errmsg);
                         }
                         
                         if (block) {
                             block(data,code,errmsg);
                         }
                     }
                     failure:^(NSURLSessionDataTask *task, NSError *error){
                         
                         if (tag>0) {
                             [CAQIRequest hideHudInView:vc.view mtag:tag];
                         }
                         
                         if (block) {
                             block(nil,APICODE_FAIL,nil);
                         }
                     }];
}



+ (NSURLSessionDataTask *)POST:(UIViewController*)vc
                          host:(NSString*)host
                           url:(NSString*)url
                         param:(id)param
                        cookie:(BOOL)cookie
                           tag:(NSInteger)tag
                         block:(API_BLOCK)block {
    
    if (!(APP_DELEGATE).isReachable) {
        [CAQIRequest HUDWithStr:NOT_CONNECT_STR View:vc.view];
        return nil;
    }
    
    if (tag>0) {
        [CAQIRequest showHudInView:vc.view tag:tag];
    }
    
    return [MSHTTPClient POST:url
                         host:host
                       cookie:cookie
                   parameters:param
                   appendType:@"/"
                  cachePolicy:MSHTTPClientReloadIgnoringLocalCacheData
                      success:^(NSURLSessionDataTask *task, id responseObject){
                         
                         if (tag>0) {
                             [CAQIRequest hideHudInView:vc.view mtag:tag];
                         }
                         
                         NSString* errmsg = nil;
                         NSInteger code = APICODE_OTHER;
                         
                         int status = [[responseObject objectForKey:@"errno"] intValue];
                         id data = [responseObject objectForKey:@"data"];
                         
                         if(status==0){
                             
                             code = APICODE_SUCCESS;
                             
                             if ([data isKindOfClass:[NSArray class]]) {
                                 code = APICODE_SUCCESS_ARR;
                             }
                             else if ([data isKindOfClass:[NSDictionary class]]) {
                                 code = APICODE_SUCCESS_DIC;
                             }
                             else if ([data isKindOfClass:[NSString class]]) {
                                 code = APICODE_SUCCESS_STR;
                             }
                             
                         }else if(status == 120101){
                             code = APICODE_WRONG_SPECIAL_BIND;  //绑定时候，出现该错误,说明存在授权缓存.要取消授权.
                         }else{
                             code   = APICODE_WRONG;
                             errmsg = [responseObject objectForKey:@"errmsg"];
                             [CommonMethod MBProgressText:vc.view text:errmsg];
                         }
                         
                         if (block) {
                             block(data,code,errmsg);
                         }
                     }failure:^(NSURLSessionDataTask *task, NSError *error){
                         
                         if (tag>0) {
                             [CAQIRequest hideHudInView:vc.view mtag:tag];
                         }
                         
                         if (block) {
                             block(nil,APICODE_FAIL,nil);
                         }
                     }];
}




@end
