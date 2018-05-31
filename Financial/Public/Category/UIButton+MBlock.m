//
//  UIButton+MBlock.h
//
//
//  Created by MLBiMac on 2017/7/4.
//  Copyright © 2017年 MLB. All rights reserved.
//

#import "UIButton+MBlock.h"

static const void *ButtonKey = &ButtonKey;

@implementation UIButton (MBlock)
-(void)tapWithEvent:(UIControlEvents)controlEvent withBlock:(TapBlock)tapBlock
{
    objc_setAssociatedObject(self, ButtonKey, tapBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(btnClick:) forControlEvents:controlEvent];
}

-(void)btnClick:(UIButton *)sender
{
    TapBlock tapBlock = objc_getAssociatedObject(sender, ButtonKey);
    if (tapBlock) {
        tapBlock(sender);
    }
}

@end
