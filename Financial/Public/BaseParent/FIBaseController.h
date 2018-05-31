//
//  FIBaseController.h
//  Financial
//
//  Created by Mac on 2018/1/9.
//  Copyright © 2018年 MLBiMAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FIBaseController : UIViewController
/** 键盘遮挡的控件 让键盘出现在他的下面 */
@property (nonatomic, strong) UIView *popView;
/** 要展示空白部分的tableView */
@property (nonatomic, strong) UITableView *base_tableView;
/** 空白部分要显示的文字 默认为 “暂无数据！” */
@property (nonatomic,   copy) NSString *bg_title;


@end
