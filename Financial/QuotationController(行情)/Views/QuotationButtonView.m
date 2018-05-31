//
//  QuotationButtonView.m
//  Financial
//
//  Created by Ning on 2018/1/24.
//  Copyright © 2018年 MLBiMAC. All rights reserved.
//

#import "QuotationButtonView.h"
#import "Masonry.h"
#import "UIColor+FIColor.h"
@implementation QuotationButtonView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setData];
        [self doLayout];
        
    }
    return self;
}
-(void)setData{
    
    [self.enquiryButton setImage:[UIImage imageNamed:@"quottation_enquiry"] forState:(UIControlStateNormal)];
    [self.accountButton setImage:[UIImage imageNamed:@"quottation_account"] forState:(UIControlStateNormal)];
    [self.newbieButton setImage:[UIImage imageNamed:@"quottation_newbie"] forState:(UIControlStateNormal)];
    [self.serviceButton setImage:[UIImage imageNamed:@"quottation_service"] forState:(UIControlStateNormal)];
 
    self.textView.backgroundColor = [UIColor colorWithR:241 G:242 B:242];
    self.shangZlabel.text = @"上证指数";
    self.shangZlabel.textColor = [UIColor colorWithR:39 G:40 B:45];
    self.shangZlabel.font = [UIFont systemFontOfSize:15];
    
    self.shangZNum.text = @"3999000";
    self.shangZNum.textColor = [UIColor colorWithR:201 G:31 B:47];
    self.shangZNum.font = [UIFont boldSystemFontOfSize:20];
    
    self.shangZIncreaseNum.text = @"+30.08";
    self.shangZIncreaseNum.textColor = [UIColor colorWithR:201 G:31 B:47];
    self.shangZIncreaseNum.font = [UIFont systemFontOfSize:12];
    self.shangZIncreasePerNum.text = @"+0.87%";
    self.shangZIncreasePerNum.textAlignment = NSTextAlignmentRight;
    self.shangZIncreasePerNum.textColor = [UIColor colorWithR:201 G:31 B:47];
    self.shangZIncreasePerNum.font = [UIFont systemFontOfSize:12];
    
    self.shenZlabel.text = @"深证指数";
    self.shenZlabel.textColor = [UIColor colorWithR:39 G:40 B:45];
    self.shenZlabel.font = [UIFont systemFontOfSize:15];
    
    self.shenZNum.text = @"3999000";
    self.shenZNum.textColor = [UIColor colorWithR:201 G:31 B:47];
    self.shenZNum.font = [UIFont boldSystemFontOfSize:20];
    
    self.shenZIncreaseNum.text = @"+30.08";
    self.shenZIncreaseNum.textColor = [UIColor colorWithR:201 G:31 B:47];
    self.shenZIncreaseNum.font = [UIFont systemFontOfSize:12];
    
    self.shenZIncreasePerNum.text = @"+0.87%";
    self.shenZIncreasePerNum.textAlignment = NSTextAlignmentRight;
    self.shenZIncreasePerNum.textColor = [UIColor colorWithR:201 G:31 B:47];
    self.shenZIncreasePerNum.font = [UIFont systemFontOfSize:12];
    
    self.cylabel.text = @"创业指数";
    self.cylabel.textColor = [UIColor colorWithR:39 G:40 B:45];
    self.cylabel.font = [UIFont systemFontOfSize:15];
    self.cyNum.text = @"3999000";
    self.cyNum.textColor = [UIColor colorWithR:201 G:31 B:47];
    self.cyNum.font = [UIFont boldSystemFontOfSize:20];
    self.cyIncreaseNum.text = @"+30.08";
    self.cyIncreaseNum.textColor = [UIColor colorWithR:201 G:31 B:47];
    self.cyIncreaseNum.font = [UIFont systemFontOfSize:12];
    self.cyIncreasePerNum.text = @"+0.87%";
    self.cyIncreasePerNum.textAlignment = NSTextAlignmentRight;
    self.cyIncreasePerNum.textColor = [UIColor colorWithR:201 G:31 B:47];
    self.cyIncreasePerNum.font = [UIFont systemFontOfSize:12];
}
-(void)doLayout{
    [self addSubview:self.buttonView];
    [self.buttonView addSubview:self.enquiryButton];
    [self.buttonView addSubview:self.accountButton];
    [self.buttonView addSubview:self.newbieButton];
    [self.buttonView addSubview:self.serviceButton];
    
    [self addSubview:self.textView];
    [self.textView addSubview:self.shangZlabel];
    [self.textView addSubview:self.shangZNum];
    [self.textView addSubview:self.shangZIncreaseNum];
    [self.textView addSubview:self.shangZIncreasePerNum];
    [self.textView addSubview:self.firstLine];
    
    [self.textView addSubview:self.shenZlabel];
    [self.textView addSubview:self.shenZNum];
    [self.textView addSubview:self.shenZIncreaseNum];
    [self.textView addSubview:self.shenZIncreasePerNum];
    [self.textView addSubview:self.secondLine];
    
    [self.textView addSubview:self.cylabel];
    [self.textView addSubview:self.cyNum];
    [self.textView addSubview:self.cyIncreaseNum];
    [self.textView addSubview:self.cyIncreasePerNum];
//    [self.textView addSubview:self.secondLine];
    
    [self.buttonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.height.mas_equalTo(98);
    }];
    
    [self.enquiryButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.buttonView).offset(15);
        make.left.equalTo(self.buttonView).offset(18);
        make.height.width.mas_equalTo(44);
    }];
    
    [self.accountButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.enquiryButton);
        make.left.equalTo(self.enquiryButton.mas_right).offset(54);
        make.height.width.mas_equalTo(44);
    }];
    [self.newbieButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.accountButton);
        make.left.equalTo(self.accountButton.mas_right).offset(54);
        make.height.width.mas_equalTo(44);
    }];
    [self.serviceButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.newbieButton);
        make.left.equalTo(self.newbieButton.mas_right).offset(54);
        make.height.width.mas_equalTo(44);
    }];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.buttonView.mas_bottom);
        make.left.right.equalTo(self);
        make.height.mas_equalTo(120);
    }];
   
    [self.shangZlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.textView).offset(13);
        make.left.equalTo(self.textView).offset(32);
//        make.width.mas_equalTo(59);
    }];
    [self.shangZNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.shangZlabel.mas_bottom).offset(18);
        make.left.equalTo(self.textView).offset(26);
    }];
    [self.shangZIncreaseNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.shangZNum.mas_bottom).offset(14);
        make.left.equalTo(self.textView).offset(18);
        make.width.mas_equalTo(47);
    }];
    [self.shangZIncreasePerNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.shangZNum.mas_bottom).offset(14);
        make.left.equalTo(self.shangZIncreaseNum.mas_right);
        make.width.mas_equalTo(47);
    }];
   
    [self.firstLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.shangZlabel);
        make.left.equalTo(self.shangZlabel.mas_right).offset(34);
        make.height.mas_equalTo(100);
        make.width.mas_equalTo(1);
    }];
    
    [self.shenZlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.firstLine);
        make.left.equalTo(self.firstLine.mas_right).offset(34);
    }];
    [self.shenZNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.shenZlabel.mas_bottom).offset(18);
        make.left.equalTo(self.firstLine.mas_right).offset(20);
    }];
    self.firstLine.backgroundColor = [UIColor colorWithR:167 G:169 B:172];
    [self.shenZIncreaseNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.shenZNum.mas_bottom).offset(14);
        make.left.equalTo(self.firstLine.mas_right).offset(14);
        make.width.mas_equalTo(47);
    }];
    [self.shenZIncreasePerNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.shenZIncreaseNum);
        make.left.equalTo(self.shenZIncreaseNum.mas_right);
        make.width.mas_equalTo(47);
    }];

    self.secondLine.backgroundColor = [UIColor colorWithR:167 G:169 B:172];
    [self.secondLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.shenZlabel);
        make.left.equalTo(self.shenZlabel.mas_right).offset(34);
        make.height.mas_equalTo(100);
        make.width.mas_equalTo(1);
    }];
    
    [self.cylabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.secondLine);
        make.left.equalTo(self.secondLine.mas_right).offset(28);
    }];
    [self.cyNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.cylabel.mas_bottom).offset(15);
        make.left.equalTo(self.secondLine.mas_right).offset(17);
    }];
    [self.cyIncreaseNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.cyNum.mas_bottom).offset(14);
        make.left.equalTo(self.secondLine.mas_right).offset(10);
        make.width.mas_equalTo(47);
    }];
    [self.cyIncreasePerNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.cyIncreaseNum);
        make.left.equalTo(self.cyIncreaseNum.mas_right);
        make.width.mas_equalTo(47);
    }];
}
-(UIView *)buttonView{
    if (_buttonView == nil) {
        _buttonView = [[UIButton alloc] init];
        [_buttonView setUserInteractionEnabled:YES];
    }
    return _buttonView;
}

-(UIButton *)enquiryButton{
    if (_enquiryButton == nil) {
        _enquiryButton = [[UIButton alloc] init];
    }
    return _enquiryButton;
}
-(UIButton *)accountButton{
    if (_accountButton == nil) {
        _accountButton = [[UIButton alloc] init];
    }
    return _accountButton;
}
-(UIButton *)newbieButton{
    if (_newbieButton == nil) {
        _newbieButton = [[UIButton alloc] init];
    }
    return _newbieButton;
}
-(UIButton *)serviceButton{
    if (_serviceButton == nil) {
        _serviceButton = [[UIButton alloc] init];
    }
    return _serviceButton;
}
-(UIView *)textView{
    if (_textView == nil) {
        _textView = [[UIView alloc] init];
    }
    return _textView;
}
-(UILabel *)shangZlabel{
    if (_shangZlabel == nil) {
        _shangZlabel = [[UILabel alloc] init];
    }
    return _shangZlabel;
}
-(UILabel *)shangZNum{
    if (_shangZNum == nil) {
        _shangZNum = [[UILabel alloc] init];
    }
    return _shangZNum;
}
-(UILabel *)shangZIncreaseNum{
    if (_shangZIncreaseNum == nil) {
        _shangZIncreaseNum = [[UILabel alloc] init];
    }
    return _shangZIncreaseNum;
}
-(UILabel *)shangZIncreasePerNum{
    if (_shangZIncreasePerNum== nil) {
        _shangZIncreasePerNum = [[UILabel alloc] init];
    }
    return _shangZIncreasePerNum;
}
-(UILabel *)firstLine{
    if (_firstLine == nil) {
        _firstLine = [[UILabel alloc] init];
    }
    return _firstLine;
}
-(UILabel *)shenZlabel{
    if (_shenZlabel== nil) {
        _shenZlabel = [[UILabel alloc] init];
    }
    return _shenZlabel;
}
-(UILabel *)shenZNum{
    if (_shenZNum== nil) {
        _shenZNum = [[UILabel alloc] init];
    }
    return _shenZNum;
}

-(UILabel *)shenZIncreaseNum{
    if (_shenZIncreaseNum== nil) {
        _shenZIncreaseNum = [[UILabel alloc] init];
    }
    return _shenZIncreaseNum;
}
-(UILabel *)shenZIncreasePerNum{
    if (_shenZIncreasePerNum== nil) {
        _shenZIncreasePerNum = [[UILabel alloc] init];
    }
    return _shenZIncreasePerNum;
}
-(UILabel *)secondLine{
    if (_secondLine== nil) {
        _secondLine = [[UILabel alloc] init];
    }
    return _secondLine;
}
-(UILabel *)cylabel{
    if (_cylabel== nil) {
        _cylabel = [[UILabel alloc] init];
    }
    return _cylabel;
}
-(UILabel *)cyNum{
    if (_cyNum== nil) {
        _cyNum = [[UILabel alloc] init];
    }
    return _cyNum;
}
-(UILabel *)cyIncreaseNum{
    if (_cyIncreaseNum== nil) {
        _cyIncreaseNum = [[UILabel alloc] init];
    }
    return _cyIncreaseNum;
}
-(UILabel *)cyIncreasePerNum{
    if (_cyIncreasePerNum== nil) {
        _cyIncreasePerNum = [[UILabel alloc] init];
    }
    return _cyIncreasePerNum;
}
@end
