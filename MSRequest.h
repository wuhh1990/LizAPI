//
//  MSRequest.h
//  Zhuangpin
//
//  Created by wuhh on 16/1/5.
//  Copyright © 2016年 ZhuangPin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, APICODE){
    APICODE_SUCCESS_ARR,
    APICODE_SUCCESS_DIC,
    APICODE_SUCCESS_STR,
    APICODE_SUCCESS,
    APICODE_WRONG_SPECIAL_BIND,
    APICODE_WRONG,
    APICODE_OTHER,
    APICODE_FAIL
};

typedef void (^API_BLOCK)(id data, NSInteger errCode, NSString *wrongTip);

@interface MSRequest : NSObject

//简化网络请求的-扩展


#pragma mark - public   Get
+ (NSURLSessionDataTask *)GET:(UIViewController*)vc
                         host:(NSString*)host
                          url:(NSString*)url
                        param:(id)param
                          tag:(NSInteger)tag
                        block:(API_BLOCK)block;

+ (NSURLSessionDataTask *)GETCookie:(UIViewController*)vc
                               host:(NSString*)host
                                url:(NSString*)url
                              param:(id)param
                                tag:(NSInteger)tag
                              block:(API_BLOCK)block;





#pragma mark - public      Post
+ (NSURLSessionDataTask *)POST:(UIViewController*)vc
                          host:(NSString*)host
                           url:(NSString*)url
                         param:(id)param
                           tag:(NSInteger)tag
                         block:(API_BLOCK)block;

+ (NSURLSessionDataTask *)POSTCookie:(UIViewController*)vc
                                host:(NSString*)host
                                 url:(NSString*)url
                               param:(id)param
                                 tag:(NSInteger)tag
                               block:(API_BLOCK)block;


//#pragma mark private
//+ (NSURLSessionDataTask *)GET:(UIViewController*)vc
//                         host:(NSString*)host
//                          url:(NSString*)url
//                        param:(id)param
//                       cookie:(BOOL)cookie
//                          tag:(NSInteger)tag
//                        block:(API_BLOCK)block;
//
//
//+ (NSURLSessionDataTask *)POST:(UIViewController*)vc
//                          host:(NSString*)host
//                           url:(NSString*)url
//                         param:(id)param
//                        cookie:(BOOL)cookie
//                           tag:(NSInteger)tag
//                         block:(API_BLOCK)block;


@end
