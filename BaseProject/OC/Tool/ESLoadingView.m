//
//  ESLoadingView.m
//  ESH_OA
//
//  Created by 黄志武 on 2017/9/6.
//  Copyright © 2017年 ESH. All rights reserved.
//

#import "ESLoadingView.h"


@interface ESLoadingView()

@property (nonatomic, strong) UIImageView *loadingIV;

@property (nonatomic, strong) UIButton *dismissBtn;

@end

@implementation ESLoadingView

+ (instancetype)showInView:(UIView *)view
{
    ESLoadingView *loadingView = [[self alloc] initWithFrame:view.bounds];
    [view addSubview:loadingView];
    return loadingView;
}

- (void)dismiss
{
    [self removeFromSuperview];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _loadingIV = ({
            UIImageView *imageView = [[UIImageView alloc] init];
            imageView.bounds = CGRectMake(0, 0, 126*0.7,102*0.7);
            imageView.center = CGPointMake(frame.size.width/2, frame.size.height/2 - 44);
            imageView;
        });
        [self addSubview:_loadingIV];
        
        UIButton *backBTN = ({
            UIButton *btn = [[UIButton alloc] init];
            btn.frame = CGRectMake(self.frame.size.width -40 , 25, 30, 30);
            //btn.hidden = YES;
            [btn setImage:[UIImage imageNamed:@"nav_cancel_btn_n"] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
            btn;
        });
        [self addSubview:backBTN];
        
        self.dismissBtn = backBTN;
        
        [self animation];
    }
    return self;
}

- (void)dealloc
{
    
}

- (void)animation {
    NSMutableArray  *arrayM=[NSMutableArray array];
    for (int i=1; i<=21; i++) {
        [arrayM addObject:[UIImage imageNamed:[NSString stringWithFormat:@"右－%d",i]]];
    }
    //设置动画数组
    [self.loadingIV setAnimationImages:arrayM];
    //设置动画播放次数
    [self.loadingIV setAnimationRepeatCount:0];
    //设置动画播放时间
    [self.loadingIV setAnimationDuration:2];
    //开始动画
    [self.loadingIV startAnimating];
}

- (void)setIsShowDismissBtn:(BOOL)isShowDismissBtn
{
    _isShowDismissBtn = isShowDismissBtn;
    self.dismissBtn.hidden = !isShowDismissBtn;
}

- (void)setHidden:(BOOL)hidden
{
    if (hidden) {
        self.alpha = 1;
        [UIView animateWithDuration:0.5 animations:^{
            self.alpha = 0;
        } completion:^(BOOL finished) {
            [super setHidden:hidden];
        }];
    } else {
        self.alpha = 1;
        [super setHidden:hidden];
    }
}

@end
