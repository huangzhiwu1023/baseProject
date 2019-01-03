//
//  YFCostomButton.h
//  jsyf_user
//
//  Created by pro on 2017/10/30.
//  Copyright © 2017年 YF. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum : NSUInteger {
    YFCustomButtonImagePositionLeft,//图片在左
    YFCustomButtonImagePositionRight,//图片在右
    YFCustomButtonImagePositionTop,//图片在上
    YFCustomButtonImagePositionBottom,//图片在下
} YFCustomButtonImagePosition;


@interface YFCostomButton : UIButton

/**
 图片位置
 */
@property (nonatomic, assign) YFCustomButtonImagePosition buttonImagePosition;

/**
 文字颜色自动跟随tintColor调整,default NO
 */
@property(nonatomic, assign) BOOL adjustsTitleTintColorAutomatically;

/**
 图片颜色自动跟随tintColor调整,default NO
 */
@property(nonatomic, assign) BOOL adjustsImageTintColorAutomatically;

/**
 default YES;相当于系统的adjustsImageWhenHighlighted
 */
@property(nonatomic, assign) BOOL adjustsButtonWhenHighlighted;

/**
 default YES,相当于系统的adjustsImageWhenDisabled
 */
@property(nonatomic, assign) BOOL adjustsButtonWhenDisabled;

/**
 高亮状态button背景色，default nil，设置此属性后默认adjustsButtonWhenHighlighted=NO
 */
@property(nonatomic, strong) UIColor *highlightedBackgroundColor;

/**
 高亮状态边框颜色，default nil，设置此属性后默认adjustsButtonWhenHighlighted=NO
 */
@property(nonatomic, strong) UIColor *highlightedBorderColor;



@end
