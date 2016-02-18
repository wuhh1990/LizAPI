//
//  LizHudHelper.m
//  Zhuangpin
//
//  Created by wuhh on 16/2/17.
//  Copyright © 2016年 ZhuangPin. All rights reserved.
//

#import "LizHudHelper.h"

static const NSTimeInterval kTimeoutInterval = 30.0;

@implementation LizHudHelper

+ (void)HudInView:(UIView*)view Text:(NSString*)text
{
    WSProgressHUD* hud = [[WSProgressHUD alloc] initWithView:view];
    [view addSubview:hud];
    //show
    [hud showWithString:text maskType:WSProgressHUDMaskTypeBlack];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [hud dismiss];
    });
}

+ (void)HudShowInView:(UIView*)view Tag:(NSInteger)tag
{
    WSProgressHUD* hud = (WSProgressHUD *)[view viewWithTag:tag];
    if (!hud) {
        hud = [[WSProgressHUD alloc] initWithView:view];
    }
    [hud show];
    if (hud != nil && (!hud.hidden)) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(kTimeoutInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [hud dismiss];
        });
    }
}

+ (void)HudHideInView:(UIView*)view Tag:(NSInteger)tag
{
    WSProgressHUD* hud = (WSProgressHUD *)[view viewWithTag:tag];
    if (hud && [hud isKindOfClass:[WSProgressHUD class]]) {
        [hud dismiss];
        [hud removeFromSuperview];
    }
}

@end
