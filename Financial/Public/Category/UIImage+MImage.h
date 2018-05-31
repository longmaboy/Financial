//
//  UIImage+MImage.h
//
//
//  Created by Mac on 2017/9/6.
//  Copyright © 2017年 MLB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (MImage)
/** 获取本地图片不放入内存中 */
+ (UIImage *)pathPngFile:(NSString *)image;
/** 取图片某点的坐标 */
- (UIColor *)colorAtPixel:(CGPoint)point;
/** 从图片中按指定的位置大小截取图片的一部分 */
+ (UIImage *)ct_imageFromImage:(UIImage *)image inRect:(CGRect)rect;
/** 大图缩小成小图 */
+ (UIImage *)imageWithImageSimple:(UIImage *)image scaledToSize:(CGSize)newSize;

@end
