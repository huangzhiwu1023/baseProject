//
//  ESPhotoBrower.h
//  ESH_OA
//
//  Created by 吕祥 on 2017/9/26.
//  Copyright © 2017年 ESH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ESPhotoBrower : NSObject
- (void)showWithImageList:(NSArray *)list parentViews:(NSArray<UIImageView *> *)views onVC:(UIViewController *)vc index:(NSInteger)index;
@end
