//
//  UIView+HudHelper.m
//  Zhuangpin
//
//  Created by wuhh on 16/2/18.
//  Copyright © 2016年 ZhuangPin. All rights reserved.
//

#import "UIView+HudHelper.h"
#import "WSProgressHUD.h"

static const NSTimeInterval kTimeoutInterval = 30.0;

#define UIColorFromRGBWithAlpha(rgbValue,a) [UIColor                                                                                 \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0                                                                            \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0                                                                                      \
blue:((float)(rgbValue & 0xFF))/255.0                                                                                                alpha:a]

@implementation UIView (HudHelper)

-(void)test
{
    
}

///
- (void)HudShowInWindow {
    [WSProgressHUD show];
}
- (void)HudHideInWindow {
    [WSProgressHUD dismiss];
}

///
- (void)HudShowWithText:(NSString*)text
{
    WSProgressHUD* hud = [[WSProgressHUD alloc] initWithView:self];
    [hud showShimmeringString:[NSString stringWithFormat:@" %@ ",text] maskType:WSProgressHUDMaskTypeDefault];
    hud.hudView.backgroundColor = UIColorFromRGBWithAlpha(0xff4666,0.7);
    [self addSubview:hud];
    //[hud showWithString:text maskType:WSProgressHUDMaskTypeDefault];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [hud dismiss];
    });
}

///
- (void)HudShowWithTag:(NSInteger)tag
{
    WSProgressHUD* hud = (WSProgressHUD *)[self viewWithTag:tag];
    if (!hud) {
        hud = [[WSProgressHUD alloc] initWithView:self];
        [hud setProgressHUDIndicatorStyle:WSProgressHUDIndicatorMMSpinner];
        [hud showWithString:@"正在加载中..." maskType:WSProgressHUDMaskTypeDefault];
        hud.hudView.backgroundColor = UIColorFromRGBWithAlpha(0xff4666,0.7);
        hud.tag = tag;
        [self addSubview:hud];
    }
    
    //hud.userInteractionEnabled = YES;
    //[hud bk_whenTapped:^{
    //    [hud dismiss];
    //}];
    
    if (hud != nil && (!hud.hidden)) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(kTimeoutInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [hud dismiss];
        });
    }
}

- (void)HudHideWithTag:(NSInteger)tag
{
    WSProgressHUD* hud = (WSProgressHUD *)[self viewWithTag:tag];
    if (hud && [hud isKindOfClass:[WSProgressHUD class]]) {
        [hud dismiss];
        [hud removeFromSuperview];
    }
}


@end
