//
//  MBProgressHUD+FIMBP.m
//
//
//  Created by Mac on 2017/9/6.
//  Copyright © 2017年 MLB. All rights reserved.
//

#import "MBProgressHUD+FIMBP.h"

#define kDefaultView [[UIApplication sharedApplication].windows lastObject]

@implementation MBProgressHUD (FIMBP)
#pragma mark - 正方形提示语
+ (MBProgressHUD *)showSquareMsg:(NSString *)message;
{
    return [self showMessage:message toView:nil];
}
#pragma mark - 长方形提示语
+ (MBProgressHUD *)showRectangleMsg:(NSString *)message
{
    return [self showBriefAlert:message inView:nil];
}
#pragma mark - 菊花 转圈
+ (MBProgressHUD *)showChrysanthMsg:(NSString *)message
{
    return [self showChrysanthemumMessage:message toView:nil];
}
+ (MBProgressHUD *)showBriefAlert:(NSString *) message inView:(UIView *) view
{
    if (view == nil) view = kDefaultView;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view ?:kDefaultView animated:YES];
    hud.label.text = message;
    hud.animationType = MBProgressHUDAnimationZoom;
    hud.mode = MBProgressHUDModeText;
    hud.margin = 10.f;
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.color = [UIColor blackColor];
    //HUD.yOffset = 200;
    hud.removeFromSuperViewOnHide = YES;
    hud.label.textColor = [UIColor whiteColor];
    [hud hideAnimated:YES afterDelay:2];
    return hud;
}
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view
{
    if (view == nil) view = kDefaultView;
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = message;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    hud.mode = MBProgressHUDModeText;
    // YES代表需要蒙版效果
    //hud.dimBackground = YES;
    
    hud.bezelView.color = [UIColor blackColor];
    //消失
    [hud hideAnimated:YES afterDelay:2];
    return hud;
}
+ (MBProgressHUD *)showChrysanthemumMessage:(NSString *)message toView:(UIView *)view
{
    if (view == nil) view = kDefaultView;
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = NSLocalizedString(message, message);
    //隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    hud.mode = MBProgressHUDModeIndeterminate;
    // YES代表需要蒙版效果
    //hud.dimBackground = YES;
    
    hud.bezelView.color = [UIColor colorWithRed:91/255.0 green:91/255.0 blue:91/255.0 alpha:1];
    //消失
    hud.label.textColor = [UIColor whiteColor];
    return hud;
}
+ (void)hiddenHud
{
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *hud = [self HUDForView:kDefaultView];
        [UIView animateWithDuration:0.5 animations:^{
            [hud hideAnimated:YES];
        } completion:^(BOOL finished) {
            [hud removeFromSuperview];
        }];
    });
}

@end
