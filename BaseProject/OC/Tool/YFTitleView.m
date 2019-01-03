//
//  YFTitleView.m
//  jsyf_user
//
//  Created by 吕祥 on 2018/1/4.
//  Copyright © 2018年 YF. All rights reserved.
//

#import "YFTitleView.h"

@implementation YFTitleView
- (CGSize)intrinsicContentSize {
    return CGSizeMake(mScreenWidth * 0.4, 44);
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.clipsToBounds = YES;
    }
    return self;
}
@end
