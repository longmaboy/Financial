//
//  UIColor+FIColor.h
//
//
//  Created by Mac on 2017/9/6.
//  Copyright © 2017年 MLB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (FIColor)

/** RGB */
+ (UIColor *)colorWithR:(CGFloat)r G:(CGFloat)g B:(CGFloat)b;

/** 颜色转换：（以#开头）十六进制的颜色转换为UIColor(RGB) */
+ (UIColor *)colorWithHexString:(NSString *)color;

/** 项目主黑色 */
+ (UIColor *)mainBlackColor;

/** 项目主辅助淡黄色 */
+ (UIColor *)auxiliaryColor;

@end
