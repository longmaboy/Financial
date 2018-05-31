//
//  ShowViewAnimation.h
//
//
//  Created by MLBiMac on 2017/7/4.
//  Copyright © 2017年 MLB. All rights reserved.
//

#import <Foundation/Foundation.h>

/********************** 弹出动画 **********************/

@interface ShowViewAnimation : NSObject
/** 单例 */
+ (instancetype)share;
/** 传要弹出来的view和高度 从底部往上弹 */
- (void)showWithView:(UIView *)view andHeight:(CGFloat)height;
/** 退出 */
- (void)exitClick;

@end
