//
//  TabBarController.m
//  JudicialBureau
//
//  Created by yuwangiMac on 17/2/24.
//  Copyright © 2017年 yuwangiMac. All rights reserved.
//

#import "FITabBarController.h"
#import "FINaviController.h"
#import "TransactionController.h"
#import "QuotationController.h"
#import "PersonalController.h"
#import "UIColor+FIColor.h"

@interface FITabBarController ()

@end

@implementation FITabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    //背景颜色
    UIView *bgView = [[UIView alloc] initWithFrame:self.tabBar.bounds];
    bgView.backgroundColor = [UIColor mainBlackColor];
    [self.tabBar insertSubview:bgView atIndex:0];
    
    UIView *tbgView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 49+Tabbar_increase)];//这是整个tabbar的颜色
    [tbgView setBackgroundColor:[UIColor mainBlackColor]];
    [self.tabBar insertSubview:tbgView atIndex:1];
//    tbgView.alpha=0.8;
    
    //初始化所有的自控制器
    [self setUpAllChildController];


}

#pragma mark ========= 初始化所有的子控制器 =========
/**
 *  初始化所有的子控制器
 */
- (void)setUpAllChildController
{
    NSArray *imageArr = @[@"tab_home", @"tab_shop", @"tab_cool", @"tab_person"];
    NSArray *selImageArr = @[@"tab_home", @"tab_shop", @"tab_cool", @"tab_person"];
    
    // 添加子控制器
    [self addChildVc:[[QuotationController alloc] init] title:@"行情" image:imageArr[2] selectedImage:selImageArr[0]];
    
    [self addChildVc:[[TransactionController alloc] init] title:@"交易" image:imageArr[1] selectedImage:selImageArr[1]];

    [self addChildVc:[[PersonalController alloc] init] title:@"我的" image:imageArr[3] selectedImage:selImageArr[2]];
    
    
}

- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置子控制器的文字(可以设置tabBar和navigationBar的文字)
    childVc.title = title;
    
    // 设置子控制器的tabBarItem图片
    childVc.tabBarItem.image = FImgName(image);
    childVc.tabBarItem.selectedImage = FImgName(selectedImage);
    //childVc.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 禁用图片渲染
    //childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 设置文字的样式
    [childVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor grayColor]} forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor auxiliaryColor]} forState:UIControlStateSelected];
//    childVc.view.backgroundColor = RandomColor; // 这句代码会自动加载主页，消息，发现，我四个控制器的view，但是view要在我们用的时候去提前加载
    
    // 为子控制器包装导航控制器
    FINaviController *navigationVc = [[FINaviController alloc] initWithRootViewController:childVc];
    // 添加子控制器
    [self addChildViewController:navigationVc];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
