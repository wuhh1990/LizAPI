//
//  UIView+HudHelper.h
//  Zhuangpin
//
//  Created by wuhh on 16/2/18.
//  Copyright © 2016年 ZhuangPin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HudHelper)

- (void)HudShowWithText:(NSString*)text;

- (void)HudShowWithTag:(NSInteger)tag;

- (void)HudHideWithTag:(NSInteger)tag;

@end
