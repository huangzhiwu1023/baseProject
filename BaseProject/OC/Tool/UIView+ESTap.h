//
//  UIView+ESTap.h
//  ESH_OA
//
//  Created by 黄志武 on 2017/9/25.
//  Copyright © 2017年 ESH. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NSString * (^TapAction)(void);

@interface UIView (ESTap)

- (void)tapHandle:(TapAction)block;

@end
