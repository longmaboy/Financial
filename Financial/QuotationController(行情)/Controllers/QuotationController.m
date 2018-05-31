//
//  QuotationController.m
//  Financial
//
//  Created by Mac on 2018/1/9.
//  Copyright © 2018年 MLBiMAC. All rights reserved.
//

#import "QuotationController.h"
#import "UIColor+FIColor.h"
#import "FUISearchBar.h"
#import "SDCycleScrollView.h"
#import "Masonry.h"
#import "QuotationButtonView.h"
#import "UIView+Frame.h"
#import "fristViewController.h"
#import "secondViewController.h"
#define SCW [UIScreen mainScreen].bounds.size.width
#define SCH [UIScreen mainScreen].bounds.size.height
@interface QuotationController ()<SDCycleScrollViewDelegate,UIScrollViewDelegate>
{
    
    UIView * _view;
    BOOL isClick;
}

@property (strong, nonatomic) FUISearchBar *searchBar;

@property (nonatomic,assign) BOOL isChangeSearchBarFrame;//是否要改变searchBar的frame
@property (strong, nonatomic) NSArray *imagesURLStrings;;
@property (strong, nonatomic) NSArray *titles;
@property (strong, nonatomic) SDCycleScrollView *cycleScrollView2;
@property (strong, nonatomic) QuotationButtonView *buttonView;


/** 保存所有的标题按钮 */
@property (nonatomic,strong) NSMutableArray *titleBtns;


/**内容视图*/
@property (nonatomic,strong)UIScrollView * contentScrollow;

/** 下滑线 */
@property (nonatomic,strong) UIView *lineView;


/** 保存上一次点击的按钮 */
@property (nonatomic,strong) UIButton *preBtn;

@end

@implementation QuotationController


- (NSMutableArray *)titleBtns
{
    if (!_titleBtns) {
        _titleBtns = [NSMutableArray array];
    }
    return _titleBtns;
}

- (void)viewDidLoad {

    [super viewDidLoad];
    [self setupTitleView];
    
    
    [self customScrollview];
    
    
    //添加子控制器
    [self addChildCustomViewController];

    
    // 默认点击下标为0的标题按钮
    [self titleBtnClick:self.titleBtns[0]];
    
    
    [self createView];
    [self doLayout];
    NSArray *imagesURLStrings = @[
                                  @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                                  @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                                  @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
                                  ];
    _imagesURLStrings = imagesURLStrings;
    
    // 情景三：图片配文字
   _titles = @[@"新建交流QQ群：185534916 ",
                        @"disableScrollGesture可以设置禁止拖动",
                        @"感谢您的支持，如果下载的",
                        @"如果代码在使用过程中出现问题",
                        @"您可以发邮件到gsdios@126.com"
                        ];
    
}
-(void)createView{
    //返回按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"quotation_msg"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 30, 0, 0)] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
//    self.navigationItem
    //搜索框
    _searchBar = [[FUISearchBar alloc] initWithFrame:CGRectMake(10, 8, kScreenW-60, 28)];
    _searchBar.contentInset = UIEdgeInsetsMake(8, 8, 8, 8);
    [self.navigationController.navigationBar addSubview:_searchBar];
    //轮播图
   _cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, 0, 0) delegate:self placeholderImage:[UIImage imageNamed:@"quotation_cycle_placeholder"]];
    _cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    _cycleScrollView2.titlesGroup = _titles;
    _cycleScrollView2.currentPageDotColor = [UIColor yellowColor]; // 自定义分页控件小圆标颜色
    _cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    //         --- 模拟加载延迟
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _cycleScrollView2.imageURLStringsGroup = _imagesURLStrings;
    });
    
    _buttonView = [[QuotationButtonView alloc] init];
    
}
-(void)backAction{
    
}
-(void)doLayout{
    [self.view addSubview:_cycleScrollView2];
    [self.view addSubview:_buttonView];
    [_cycleScrollView2  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.mas_equalTo(161);
    }];
    [_buttonView  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_cycleScrollView2.mas_bottom);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(198);
    }];
}

- (void)setupTitleView{
    
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 400, SCW, 40)];
    _view = view;
//    _view.backgroundCol/or = [UIColor redColor];
//    self.navigationItem.titleView = view;
    
    //添加所有的标题按钮
    [self addAllTitleBtns];
    
    
    //添加下划线
    [self setupUnderLineView];
    
    [self.view addSubview:view];
    
    
    
}


#pragma mark - 添加下滑线
- (void)setupUnderLineView
{
    // 获取下标为0的标题按钮
    UIButton *titleBtn = self.titleBtns[0];
    
    
    UIView *lineView = [[UIView alloc] init];
    self.lineView = lineView;
    lineView.backgroundColor = [UIColor colorWithR:220 G:184 B:141];
    // 下滑线高度
    CGFloat lineViewH = 2;
    CGFloat y = _view.yj_height - lineViewH;
    lineView.yj_height = lineViewH;
    lineView.yj_y = y;
    // 设置下划线的宽度比文本内容宽度大10
    [titleBtn.titleLabel sizeToFit];
    lineView.yj_width = titleBtn.titleLabel.yj_width + 2;
    lineView.yj_centerX = titleBtn.yj_centerX;
    // 添加到titleView里
    [_view addSubview:lineView];
}

- (void)customScrollview{
    
    UIScrollView * contentScrollow = [[UIScrollView alloc]init];
    self.contentScrollow = contentScrollow;
    contentScrollow.frame = CGRectMake(0, 460, SCW, SCH - 64);
    // contentScrollow.contentSize = CGSizeMake(SCW, 0);
    [self.view addSubview:contentScrollow];
    contentScrollow.delegate = self;
    contentScrollow.pagingEnabled = YES;
    contentScrollow.bounces = NO;
    contentScrollow.showsHorizontalScrollIndicator = NO;
    
    
    
}


- (void)addChildCustomViewController{
    
    
    //第一个
    fristViewController * fristVc = [[fristViewController alloc]init];
    [self addChildViewController:fristVc];
    
    //第二个
    secondViewController * secondVc = [[secondViewController alloc]init];
    [self addChildViewController:secondVc];
    
    
    NSInteger count = self.childViewControllers.count;
    self.contentScrollow.contentSize = CGSizeMake(count * SCW, 0);
    
    
}

- (void)addAllTitleBtns{
    
    
    
    NSArray * titles = @[@"最新动态",@"最优策略"];
    
    CGFloat btnW = _view.bounds.size.width/2;
    CGFloat btnH = _view.bounds.size.height;
    
    
    for (int i = 0; i < titles.count; i++) {
        UIButton * titleBtn = [[UIButton alloc]init];
        titleBtn.tag = i;
        titleBtn.frame = CGRectMake(i * btnW, 0, btnW, btnH);
        [titleBtn setTitle:titles[i] forState:UIControlStateNormal];
        //设置文字颜色
        [titleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //设置选中按键的文字颜色
        [titleBtn setTitleColor:[UIColor colorWithR:220 G:184 B:141] forState:UIControlStateSelected];
        
        [_view addSubview:titleBtn];
        
        [self.titleBtns addObject:titleBtn];
        
        
        [titleBtn addTarget:self action:@selector(titleBtnClick:) forControlEvents:UIControlEventTouchDown];
        
    }
    
    
}

- (void)titleBtnClick:(UIButton *)titleBtn{
    
    isClick = YES;
    
    //    // 判断标题按钮是否重复点击
    //    if (titleBtn == self.preBtn) {
    //        // 重复点击标题按钮，发送通知给帖子控制器，告诉它刷新数据
    //        [[NSNotificationCenter defaultCenter] postNotificationName:@"titleBtnRefreshClick" object:nil];
    //    }
    // 1.标题按钮点击三步曲
    self.preBtn.selected = NO;
    titleBtn.selected = YES;
    self.preBtn = titleBtn;
    NSInteger tag = titleBtn.tag;
    // 2.处理下滑线的移动
    [UIView animateWithDuration:0.25 animations:^{
        self.lineView.yj_width = titleBtn.titleLabel.yj_width;
        self.lineView.yj_centerX = titleBtn.yj_centerX;
        
        // 3.修改contentScrollView的便宜量,点击标题按钮的时候显示对应子控制器的view
        self.contentScrollow.contentOffset = CGPointMake(tag * SCW, 0);
    }];
    
    // 添加子控制器的view
    UIViewController *vc = self.childViewControllers[tag];
    // 如果子控制器的view已经添加过了，就不需要再添加了
    if (vc.view.superview) {
        return;
    }
    vc.view.frame = CGRectMake(tag * SCW, 0 , SCW, SCH - 64);
    [self.contentScrollow addSubview:vc.view];
    
    
    
}

#pragma mark -- uscrollviewDelegate
//开始拖动的时候
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    isClick = NO;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    // 计算拖拽的比例
    CGFloat ratio = scrollView.contentOffset.x / scrollView.yj_width;
    // 将整数部分减掉，保留小数部分的比例(控制器比例的范围0~1.0)
    ratio = ratio - self.preBtn.tag;
    NSInteger index = scrollView.contentOffset.x / scrollView.yj_width;
    if (isClick) {
        UIButton * titleBtn = self.titleBtns[index];
        
        self.lineView.yj_x = titleBtn.titleLabel.yj_x;
        self.lineView.yj_width = titleBtn.titleLabel.yj_width;
        self.lineView.yj_centerX = titleBtn.yj_centerX;
        isClick = YES;
    }else{
        
        if (ratio > 0) {
            self.lineView.yj_x = self.preBtn.titleLabel.yj_x;
            self.lineView.yj_width = self.preBtn.yj_centerX + scrollView.contentOffset.x / 2.5 + 15;
            if (scrollView.contentOffset.x > 180) {
                UIButton * btn = self.titleBtns[1];
                self.lineView.yj_x =  scrollView.contentOffset.x / 2.5 + 15 - self.preBtn.yj_centerX;
                self.lineView.yj_width = (btn.yj_centerX + btn.yj_width) - (scrollView.contentOffset.x / 2.5) - 45;
            }
        }else{
            self.lineView.yj_x = 15 + scrollView.contentOffset.x / 5 ;
            self.lineView.yj_width = self.preBtn.yj_centerX - (scrollView.contentOffset.x / 5);
            if (scrollView.contentOffset.x < 180) {
                UIButton * btn = self.titleBtns[0];
                self.lineView.yj_x = btn.titleLabel.yj_x;
                self.lineView.yj_width  = btn.yj_width + (scrollView.contentOffset.x / 5) - 20;
            }
        }
    }
}

//开始减速的时候调用
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    
}


//结束拖动的时候调用
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger index = scrollView.contentOffset.x / scrollView.yj_width;
    UIButton *titleBtn = self.titleBtns[index];
    
    // 调用标题按钮的点击事件
    [self titleBtnClick:titleBtn];
}

@end
