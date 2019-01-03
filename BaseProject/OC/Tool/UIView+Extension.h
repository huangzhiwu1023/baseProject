//
//  UIView+Extension.h
//  jsyf_user
//
//  Created by pro on 2017/10/24.
//  Copyright © 2017年 YF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)
- (UIViewController *)viewController;
@property(nonatomic, assign) CGSize size;
@property(nonatomic, assign) CGFloat width;
@property(nonatomic, assign) CGFloat height;
@property(nonatomic, assign) CGFloat x;
@property(nonatomic, assign) CGFloat y;
@property(nonatomic, assign) CGFloat centerX;
@property(nonatomic, assign) CGFloat centerY;

//判读视图是不是真正显示在窗口上
- (BOOL)isShowingOnKeyWindow;

//在window中的y坐标
-(CGFloat)yForKeyWindow;

//在window中的x坐标
-(CGFloat)xForKeyWindow;


@end
