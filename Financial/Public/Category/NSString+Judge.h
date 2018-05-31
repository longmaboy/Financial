//
//  NSString+Judge.h
//
//
//  Created by Mac on 2017/9/6.
//  Copyright © 2017年 MLB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Judge)

#pragma mark -- 日期相关
/** 获取当前时间 yyyy-MM-dd HH:mm:ss(时间格式可变) */
+ (NSString *)timeOfNow;

/** 获取当前时间 十位时间戳 */
+ (NSString *)getTimestamp;

/** 给定时间转为十位时间戳 */
+ (NSString *)timestampWithDate:(NSString *)date;

/** 十位时间戳转化为时间格式yyyy-MM-dd HH:mm:ss */
+ (NSString *)getTimeWith:(NSString *)time;

/** 开始到结束的时间差 */
+ (NSString *)timeDifferenceSTime:(NSString *)startTime ETime:(NSString *)endTime;

/** 传入年月获取月份天数 */
+ (NSString *)numberWithMouth:(NSString *)mouth andYear:(NSString *)year;

/** 两个日期比大小 */
+ (NSInteger)compareDate:(NSString*)aDate withDate:(NSString*)bDate;

#pragma mark -- 正则表达式相关

/** 邮箱验证 */
- (BOOL)isValidEmail;

/** 手机号码验证 */
- (BOOL)isValidPhoneNum;

/** 有效的手机号码 */
+ (BOOL)mlb_isValidMobile:(NSString *)str;

//判断手机号类型
+ (NSString *)phoneNumberType:(NSString *)number;

/** 车牌号验证 */
- (BOOL)isValidCarNo;

/** 网址验证 */
- (BOOL)isValidUrl;

/** 邮政编码 */
- (BOOL)isValidPostalcode;

/** 纯汉字 */
- (BOOL)isValidChinese;

/** 四位随机数 */
+ (NSString *)getMyCode;

/**
 @brief 是否符合IP格式，xxx.xxx.xxx.xxx
 */
- (BOOL)isValidIP;

/** 身份证验证 */
- (BOOL)isValidIdCardNum;

/**
 @brief     是否符合最小长度、最长长度，是否包含中文,首字母是否可以为数字
 @param     minLenth 账号最小长度
 @param     maxLenth 账号最长长度
 @param     containChinese 是否包含中文
 @param     firstCannotBeDigtal 首字母不能为数字
 @return    正则验证成功返回YES, 否则返回NO
 */
- (BOOL)isValidWithMinLenth:(NSInteger)minLenth
                   maxLenth:(NSInteger)maxLenth
             containChinese:(BOOL)containChinese
        firstCannotBeDigtal:(BOOL)firstCannotBeDigtal;

/**
 @brief     是否符合最小长度、最长长度，是否包含中文,数字，字母，其他字符，首字母是否可以为数字
 @param     minLenth 账号最小长度
 @param     maxLenth 账号最长长度
 @param     containChinese 是否包含中文
 @param     containDigtal   包含数字
 @param     containLetter   包含字母
 @param     containOtherCharacter   其他字符
 @param     firstCannotBeDigtal 首字母不能为数字
 @return    正则验证成功返回YES, 否则返回NO
 */
- (BOOL)isValidWithMinLenth:(NSInteger)minLenth
                   maxLenth:(NSInteger)maxLenth
             containChinese:(BOOL)containChinese
              containDigtal:(BOOL)containDigtal
              containLetter:(BOOL)containLetter
      containOtherCharacter:(NSString *)containOtherCharacter
        firstCannotBeDigtal:(BOOL)firstCannotBeDigtal;

/** 去掉两端空格和换行符 */
- (NSString *)stringByTrimmingBlank;

/** 去掉html格式 */
- (NSString *)removeHtmlFormat;

/** 工商税号 */
- (BOOL)isValidTaxNo;

#pragma mark -- 加密算法需要

/** MD5签名算法 */
+ (NSString *)md5:(NSString *) str;

/** 16位随机数(字母大小写加数字) */
+ (NSString *)fuckNonceStr;

/** 签名 */
+ (NSString *)getSha1String:(NSString *)srcString;

/** 升序签名 */
+ (NSString *)getThesiginBySha1Timestamp:(NSString *)timeStr andNonce:(NSString *)nonce andKey:(NSString *)key;

@end
