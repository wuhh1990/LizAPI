//
//  NSJSONSerialization+LYJSON.h
//  LYHttpClient
//
//  Created by wuhh on 15/12/29.
//  Copyright © 2015年 wuhh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSJSONSerialization (LYJSON)
+ (nullable NSString *)stringWithJSONObject:(nonnull id)JSONObject;
+ (nullable id)objectWithJSONString:(nonnull NSString *)JSONString;
+ (nullable id)objectWithJSONData:(nonnull NSData *)JSONData;
@end
