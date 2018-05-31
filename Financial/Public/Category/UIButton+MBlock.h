//
//  UIButton+MBlock.h
//
//
//  Created by MLBiMac on 2017/7/4.
//  Copyright © 2017年 MLB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

typedef void(^TapBlock)(UIButton *sender);
@interface UIButton (MBlock)

- (void)tapWithEvent:(UIControlEvents)controlEvent withBlock:(TapBlock)tapBlock;

@end
