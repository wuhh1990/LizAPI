//
//  LizHudHelper.h
//  Zhuangpin
//
//  Created by wuhh on 16/2/17.
//  Copyright © 2016年 ZhuangPin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WSProgressHUD.h"

@interface LizHudHelper : NSObject

+ (void)HudInView:(UIView*)view Text:(NSString*)text;
+ (void)HudShowInView:(UIView*)view Tag:(NSInteger)tag;
+ (void)HudHideInView:(UIView*)view Tag:(NSInteger)tag;

@end
