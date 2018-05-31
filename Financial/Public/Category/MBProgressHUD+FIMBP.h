//
//  MBProgressHUD+FIMBP.h
//
//
//  Created by Mac on 2017/9/6.
//  Copyright © 2017年 MLB. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>
//正方形、长方形、转圈 快捷调用宏
#define FIMBSquareMsg(str)    [MBProgressHUD showSquareMsg:str]
#define FIMBRectangleMsg(str) [MBProgressHUD showRectangleMsg:str]
#define FIMBChrysanthMsg(str) [MBProgressHUD showChrysanthMsg:str]

@interface MBProgressHUD (FIMBP)
/** 正方形的提示语 */
+ (MBProgressHUD *)showSquareMsg:(NSString *)message;
/** 长方形的提示语 */
+ (MBProgressHUD *)showRectangleMsg:(NSString *)message;
/** 菊花 转圈 */
+ (MBProgressHUD *)showChrysanthMsg:(NSString *)message;
/** 转圈隐藏方法 */
+ (void)hiddenHud;


@end
