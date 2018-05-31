//
//  NSString+MString.h
//
//
//  Created by Mac on 2017/9/6.
//  Copyright © 2017年 MLB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MString)
/**
 *  设置段落样式
 *  @param lineSpacing 行高
 *  @param textcolor   字体颜色
 *  @param font        字体
 *  @返回 富文本
 */
- (NSAttributedString *)stringWithParagraphlineSpeace:(CGFloat)lineSpacing
                                           textColor:(UIColor *)textcolor
                                            textFont:(UIFont *)font;

/**
 *  计算富文本字体高度
 *  @param lineSpeace 行高
 *  @param font       字体
 *  @param width      字体所占宽度
 *  @返回 富文本高度
 */
- (CGFloat)getSpaceLabelHeightwithSpeace:(CGFloat)lineSpeace withFont:(UIFont*)font withWidth:(CGFloat)width;

/**
 *  返回包含关键字的富文本编辑
 *  @param lineSpacing 行高
 *  @param textcolor   字体颜色
 *  @param font        字体
 *  @param KeyColor    关键字字体颜色
 *  @param KeyFont     关键字字体
 *  @param KeyWords    关键字数组
 */
- (NSAttributedString *)stringWithParagraphlineSpeace:(CGFloat)lineSpacing
                                           textColor:(UIColor *)textcolor
                                            textFont:(UIFont *)font
                                    withKeyTextColor:(UIColor *)KeyColor
                                             keyFont:(UIFont *)KeyFont
                                            keyWords:(NSArray *)KeyWords;

/**
 *  基本校验方法
 *  @param lineSpacing 行高
 *  @param textcolor   字体颜色
 *  @param font        字体
 */
- (NSAttributedString *)stringWithParagraphlineSpeace:(CGFloat)lineSpacing
                                            textColor:(UIColor *)textcolor
                                             textFont:(UIFont *)font
                                             compated:(void(^)(NSMutableAttributedString * attriStr))compalted;

/* 计算字体的宽度 */
+ (CGFloat )widthForLabel:(NSString *)text fontSize:(CGFloat)fontSize;

/* 计算字体的高度 */
+ (CGFloat )heightForLabel:(NSString *)text fontSize:(CGFloat)fontSize;


@end
