//
//  YFHookUtility.h
//  jsyf_user
//
//  Created by pro on 2017/10/12.
//  Copyright © 2017年 com.yingfeng365. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YFHookUtility : NSObject
+ (void)swizzlingInClass:(Class)cls originalSelector:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector;
@end
