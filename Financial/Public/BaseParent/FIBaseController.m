//
//  FIBaseController.m
//  Financial
//
//  Created by Mac on 2018/1/9.
//  Copyright © 2018年 MLBiMAC. All rights reserved.
//

#import "FIBaseController.h"
#import "UIScrollView+EmptyDataSet.h"//空白集

@interface FIBaseController ()
<
    DZNEmptyDataSetSource,
    DZNEmptyDataSetDelegate
>
@property (nonatomic, getter=isLoading) BOOL loading;

@end

@implementation FIBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.view.backgroundColor = [UIColor whiteColor];
    _bg_title = @"暂无数据！";
    [self cancelKeyboard];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - 取消键盘
-(void)cancelKeyboard
{
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    tap1.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tap1];
}

-(void)viewTapped:(UITapGestureRecognizer*)tap1
{
    [self.view endEditing:YES];
}

#pragma mark - 空白页部分
- (void)setBase_tableView:(UITableView *)base_tableView
{
    if (_base_tableView != base_tableView) {
        _base_tableView = base_tableView;
    }
    base_tableView.emptyDataSetSource = self;
    base_tableView.emptyDataSetDelegate = self;
}

- (void)setBg_title:(NSString *)bg_title
{
    if (_bg_title != bg_title) {
        _bg_title = bg_title;
    }
}

//返回标题
-(NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView
{
    NSString *text = _bg_title;
    return [[NSAttributedString alloc]initWithString:text attributes:nil ];
}
//返回详情
/*
 - (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView{
 NSString *text =@"请尝试下拉刷新";
 NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
 paragraph.lineBreakMode =NSLineBreakByWordWrapping;
 paragraph.alignment =NSTextAlignmentCenter;
 NSDictionary *attributes =@{NSFontAttributeName:MYF(15.f),NSForegroundColorAttributeName: [UIColor lightGrayColor],NSParagraphStyleAttributeName: paragraph};
 return [[NSAttributedString alloc]initWithString:text attributes:attributes];
 }
 */
//返回可以点击的按钮上面带文字
//- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state{
//    NSDictionary *attributes =@{NSFontAttributeName: MYF(17.f)};
//    return [[NSAttributedString alloc]initWithString:@"点击刷新"attributes:attributes];
//}
/*
 //返回可以点击的按钮上面带图片
 - (UIImage *)buttonImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state{
 return [UIImage imageNamed:@"search_icon"];
 }
 */
//返回空白区域的颜色自定义
//- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView{
//    return [UIColor orangeColor];
//}
//- (void)emptyDataSetDidTapButton:(UIScrollView *)scrollView{
//    // 空白页面被点击时开启动画，reloadEmptyDataSet
//    self.loading =YES;
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 *NSEC_PER_SEC)),dispatch_get_main_queue(), ^{
//        // 关闭动画，reloadEmptyDataSet
//        self.loading =NO;
//    });
//}

//图像视图动画:旋转
- (CAAnimation *)imageAnimationForEmptyDataSet:(UIScrollView *)scrollView
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_2,0.0,0.0, 1.0)];
    
    animation.duration = 0.25;
    animation.cumulative = YES;
    animation.repeatCount = MAXFLOAT;
    
    return animation;
}
/*
 //图像视图动画
 - (CAAnimation *)imageAnimationForEmptyDataSet:(UIScrollView *)scrollView
 {
 CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"bounds"];
 animation.duration = 1.25;
 animation.cumulative = NO;
 animation.repeatCount = MAXFLOAT;
 animation.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 45, 45)];
 
 return animation;
 }
 // 向代理请求图像视图动画权限。默认值为NO。
 // 确保从 imageAnimationForEmptyDataSet返回有效的CAAnimation对象：
 -(BOOL)emptyDataSetShouldAnimateImageView:(UIScrollView *)scrollView{
 return YES;
 }
 */
#pragma mark - DZNEmptyDataSetDelegate Methods
- (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView
{
    return YES;
}

- (BOOL)emptyDataSetShouldAllowTouch:(UIScrollView *)scrollView
{
    return YES;
}

- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView
{
    return YES;
}
//是否开启动画
- (BOOL)emptyDataSetShouldAnimateImageView:(UIScrollView *)scrollView {
    return self.isLoading;
}

//为该属性设置 setter方法，重新加载空数据集视图：
- (void)setLoading:(BOOL)loading
{
    if (self.isLoading == loading) {
        return;
    }
    
    _loading = loading;
    
    [_base_tableView reloadEmptyDataSet];
}


#pragma mark - 键盘处理部分
- (void)setPopView:(UIView *)popView
{
    if (_popView != popView) {
        _popView = popView;
    }
    [self addKeyboardNote];
}
#pragma mark 监听系统发出的键盘通知
- (void)addKeyboardNote
{
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    
    // 1.显示键盘
    [center addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    // 2.隐藏键盘
    [center addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

#pragma mark 显示一个新的键盘就会调用
- (void)keyboardWillShow:(NSNotification *)note
{
    // 1.取得当前聚焦文本框最下面的Y值
    CGFloat loginBtnMaxY = CGRectGetMaxY(_popView.frame);
    // 2.取出键盘的高度
    CGFloat keyboardH = [note.userInfo [UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
    // 3.控制器view的高度 - 键盘的高度
    CGFloat keyboardY = self.view.frame.size.height - keyboardH;
    // 4.比较登录按钮最大Y 跟 键盘Y
    CGFloat duration = [note.userInfo [UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    if (duration <= 0.0) {
        duration = 0.25;
    }
    
    [UIView animateWithDuration:duration animations:^{
        if (loginBtnMaxY > keyboardY) { // 键盘挡住了登录按钮
            self.view.transform = CGAffineTransformMakeTranslation(0, keyboardY - loginBtnMaxY - 8);
        } else { // 没有挡住登录按钮
            self.view.transform = CGAffineTransformIdentity;
        }
    }];
}

#pragma mark 隐藏键盘就会调用
- (void)keyboardWillHide:(NSNotification *)note
{
    CGFloat duration = [note.userInfo [UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    [UIView animateWithDuration:duration animations:^{
        self.view.transform = CGAffineTransformIdentity;
    }];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
