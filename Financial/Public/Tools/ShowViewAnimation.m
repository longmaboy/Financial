//
//  ShowViewAnimation.m
//
//
//  Created by MLBiMac on 2017/7/4.
//  Copyright © 2017年 MLB. All rights reserved.
//

#import "ShowViewAnimation.h"

@interface ShowViewAnimation ()
@property (nonatomic, strong) UIView *BGView;
@property (nonatomic, strong) UIView *showView;
@property (nonatomic, assign) CGFloat viewHeight;

@end

@implementation ShowViewAnimation

+ (instancetype)share
{
    static ShowViewAnimation *shareSin = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        shareSin = [[ShowViewAnimation alloc] init];
        
    });
    
    return shareSin;
}

- (void)showWithView:(UIView *)view andHeight:(CGFloat)height
{
    self.showView = view;
    self.viewHeight = height;
    // ------全屏遮罩
    self.BGView                 = [[UIView alloc] init];
    self.BGView.frame           = CGRectMake(0, 0, kScreenW, kScreenH);
    self.BGView.alpha           = 1.f;
    self.BGView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
    self.BGView.opaque = NO;
    //--UIWindow的优先级最高，Window包含了所有视图，在这之上添加视图，可以保证添加在最上面
    UIWindow *appWindow = [[UIApplication sharedApplication] keyWindow];
    [appWindow addSubview:self.BGView];
    //------给全屏遮罩添加的点击事件
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(exitClick)];
    gesture.numberOfTapsRequired = 1;
    gesture.cancelsTouchesInView = NO;
    [self.BGView addGestureRecognizer:gesture];
    
    [UIView animateWithDuration:0.3 animations:^{
        self.BGView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
    }];
    [appWindow addSubview:self.showView];
    
    // ------View出现动画
    [UIView animateWithDuration:0.3 animations:^{
        self.showView.transform = CGAffineTransformMakeTranslation(0, -height);
    }];
    
}

#pragma mark -- 功能： View退出
- (void)exitClick
{
    [UIView animateWithDuration:0.1 animations:^{
        self.showView.transform = CGAffineTransformMakeTranslation(0, self.viewHeight);
        self.BGView.alpha = 0;
    } completion:^(BOOL finished) {
        [self.BGView removeFromSuperview];
        [_showView removeFromSuperview];
        _showView = nil;
    }];
}

@end
