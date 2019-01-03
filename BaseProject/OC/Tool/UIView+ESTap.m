//
//  UIView+ESTap.m
//  ESH_OA
//
//  Created by 黄志武 on 2017/9/25.
//  Copyright © 2017年 ESH. All rights reserved.
//

#import "UIView+ESTap.h"
#import <objc/runtime.h>
static char tapKey;
@implementation UIView (ESTap)
#pragma mark - 添加单击手势
- (void)tapHandle:(TapAction)block {
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self addGestureRecognizer:tap];
    objc_setAssociatedObject(self, &tapKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)tapAction:(UITapGestureRecognizer *)tap {
    TapAction blcok = objc_getAssociatedObject(self, &tapKey);
    if (blcok) {
         NSLog(@"当前事件：%@",blcok());
    }
    
    
    
}

@end
