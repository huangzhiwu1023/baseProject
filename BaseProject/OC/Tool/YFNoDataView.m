//
//  YFNoDataView.m
//  jsyf_user
//
//  Created by 黄志武 on 2017/10/23.
//  Copyright © 2017年 YF. All rights reserved.
//

#import "YFNoDataView.h"
#import "Masonry.h"

@interface YFNoDataView ()



@property (nonatomic, strong) UILabel *detailTextLabel;


@end

@implementation YFNoDataView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];//mHexColor(0xf1f2f6);
        [self addSubviews];
        [self refreshBtn];
    }
    return self;
}

- (void)addSubviews
{
    self.noDataIV = ({
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView;
    });
    self.noDataIV.clipsToBounds = YES;
    [self addSubview:self.noDataIV];
    
    self.titleLabel = ({
        UILabel *label = [[UILabel alloc] init];
        label.textColor = mHexColor(0xA5B8BE);
        label.font = [UIFont systemFontOfSize:14];
        label.textAlignment = NSTextAlignmentCenter;
        label.numberOfLines = 0;
        label;
    });
    [self addSubview:self.titleLabel];
    
    self.detailTextLabel = ({
        UILabel *label = [[UILabel alloc] init];
        label.textColor = mHexColor(0xa5b8be);
        label.font = [UIFont systemFontOfSize:12];
        label.numberOfLines = 0;
        label;
    });
    [self addSubview:self.detailTextLabel];
    
    self.bottomButton = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        button.layer.cornerRadius = 22;
        button.layer.masksToBounds = YES;
        [button setBackgroundImage:[UIImage imageNamed:@"ws_nodata_btn_orange_n"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"ws_nodata_btn_orange_p"] forState:UIControlStateHighlighted];
        [button setTitle:@"" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button;
    });
    [self addSubview:self.bottomButton];
    
    [self confignConstraints];
    
    [self confignViewByType:YFNoDataViewTypeNone];
}

- (void)confignConstraints
{
    mWeakSelf
    [self.noDataIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(0);
        make.centerY.equalTo(-44);
        make.width.equalTo(mScreenWidth);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.noDataIV.mas_bottom).offset(17);
        make.centerX.equalTo(weakSelf.noDataIV);
    }];
    
    [self.detailTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.titleLabel.mas_bottom).offset(17);
        make.centerX.equalTo(weakSelf.noDataIV);
    }];
    
    [self.bottomButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.titleLabel.mas_bottom).offset(30);
        make.centerX.equalTo(weakSelf.noDataIV);
        make.size.mas_equalTo(CGSizeMake(200, 44));
    }];
}

- (void)confignViewByType:(YFNoDataViewType)viewType
{
    switch (viewType) {
        case YFNoDataViewTypeNone:
            self.titleLabel.text = @"未查到相关数据";
            [self.titleLabel setTextColor:mRGB(21, 56, 90)];
            self.noDataIV.image = [UIImage imageNamed:@"蜜獾"];
            break;
            
        case YFNoDataViewTypeSearch:
            self.titleLabel.text = @"未搜索到相关数据";
            [self.titleLabel setTextColor:mRGB(21, 56, 90)];
            self.noDataIV.image = [UIImage imageNamed:@"蜜獾"];
            break;
      
        default:
            break;
    }
    
    if (self.bottomButton.titleLabel.text.length <= 0) {
        self.bottomButton.hidden = YES;
    } else {
        self.bottomButton.hidden = NO;
        mWeakSelf
        [self.noDataIV mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(weakSelf);
            make.centerY.equalTo(weakSelf.mas_centerY).offset(- 84);
        }];
        
    }
    
}

- (void)setViewType:(YFNoDataViewType)viewType
{
    _viewType = viewType;
    [self confignViewByType:viewType];
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    self.titleLabel.text = title;
}

- (void)setNoDataImage:(UIImage *)noDataImage
{
    _noDataImage = noDataImage;
    self.noDataIV.image = noDataImage;
}

- (void)setDetailText:(NSString *)detailText
{
    _detailText = detailText;
    self.detailTextLabel.text = detailText;
}

- (UIButton *)refreshBtn {
    if (!_refreshBtn) {
        _refreshBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_refreshBtn];
        [_refreshBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.top.equalTo(self.titleLabel.mas_bottom).equalTo(25);
            make.width.equalTo(150);
            make.height.equalTo(30);
        }];
        [_refreshBtn setTitle:@"重新加载" forState:UIControlStateNormal];
        _refreshBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_refreshBtn setTitleColor:kBlackWordColor forState:UIControlStateNormal];
        _refreshBtn.hidden = YES;
    }
    return _refreshBtn;
}

@end
