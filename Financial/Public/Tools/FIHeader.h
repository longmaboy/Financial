//
//  FIHeader.h
//  Financial
//
//  Created by Mac on 2018/1/9.
//  Copyright © 2018年 MLBiMAC. All rights reserved.
//

#ifndef FIHeader_h
#define FIHeader_h

/** 一些少量简单的配置，不用导入，直接就可以使用 */

/** 屏幕宽高 */
#define kScreenW    [UIScreen mainScreen].bounds.size.width
#define kScreenH    [UIScreen mainScreen].bounds.size.height

/** 导航栏高度和导航栏、tab变化值 */
#define Navi_increase   (kScreenH == 812 ? 24 : 0)
#define Tabbar_increase (kScreenH == 812 ? 34 : 0)
#define NaviHeight      (Navi_increase+64)

/** 字体、图片、RGB值(取sRGB值会和原型更接近) */
#define SRGB(r,g,b)         [UIColor colorWithR:r G:g B:b]
#define FIFont(flot)        [UIFont systemFontOfSize:flot]
#define FImgName(imgName)   [UIImage imageNamed:imgName]

#import "UIView+FExtension.h"

#endif /* FIHeader_h */
