//
//  ESLoadingView.h
//  ESH_OA
//
//  Created by 黄志武 on 2017/9/6.
//  Copyright © 2017年 ESH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ESLoadingView : UIView
@property (nonatomic, assign) BOOL isShowDismissBtn;

+ (instancetype)showInView:(UIView *)view;

- (void)dismiss;
@end
