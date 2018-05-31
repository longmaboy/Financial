//
//  FUISearchBar.h
//  Financial
//
//  Created by Ning on 2018/1/24.
//  Copyright © 2018年 MLBiMAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FUISearchBar : UISearchBar

@property(nonatomic)  UIEdgeInsets contentInset;

@property(nonatomic,assign) BOOL isChangeFrame;//是否要改变searchBar的frame

@end
