//
//  UIView+Extension.m
//  jsyf_user
//
//  Created by pro on 2017/10/24.
//  Copyright © 2017年 YF. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)


- (UIViewController*)viewController {
    
    for (UIView* next = [self superview]; next; next = next.superview) {
        
        UIResponder* nextResponder = [next nextResponder];
        
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            
            return (UIViewController*)nextResponder;
            
        }
        
    }
    return nil;
}


/***    实现属性的setter 和 getter方法  ***/
- (void)setSize:(CGSize)size{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
- (void)setWidth:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
- (void)setHeight:(CGFloat)height{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
- (void)setX:(CGFloat)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
- (void)setY:(CGFloat)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
- (void)setCenterX:(CGFloat)centerX{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}
- (void)setCenterY:(CGFloat)centerY{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}


- (CGSize)size{
    return self.frame.size;
}
- (CGFloat)height{
    return self.frame.size.height;
}
- (CGFloat)width{
    return self.frame.size.width;
}
- (CGFloat)x{
    return self.frame.origin.x;
}
- (CGFloat)y{
    return self.frame.origin.y;
}
- (CGFloat)centerX{
    return self.center.x;
}
- (CGFloat)centerY{
    return self.center.y;
}

-(BOOL)isShowingOnKeyWindow {
    //主窗口
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    //以主窗口左上角为坐标原点,计算self的矩形框
    CGRect newFrame = [keyWindow convertRect:self.frame fromView:self.superview];
    
    CGRect winBounds = keyWindow.bounds;
    //主窗口的bounds和self矩形框的是否有重叠
    BOOL intersects = CGRectIntersectsRect(newFrame, winBounds);
    
    
    return !self.isHidden && self.alpha > 0.0 && self.window == keyWindow && intersects;
}

-(CGFloat)yForKeyWindow {
    //主窗口
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    //以主窗口左上角为坐标原点,计算self的矩形框
    CGRect newFrame = [keyWindow convertRect:self.frame fromView:self.superview];
    return newFrame.origin.y;
}
-(CGFloat)xForKeyWindow {
    //主窗口
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    //以主窗口左上角为坐标原点,计算self的矩形框
    CGRect newFrame = [keyWindow convertRect:self.frame fromView:self.superview];
    return newFrame.origin.x;
}

@end
