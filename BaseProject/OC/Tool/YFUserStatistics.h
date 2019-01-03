//
//  YFUserStatistics.h
//  jsyf_user
//
//  Created by pro on 2017/10/12.
//  Copyright © 2017年 com.yingfeng365. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YFUserStatistics : NSObject
/**
 *  初始化配置，一般在launchWithOption中调用
 */
+ (void)configure;

+ (void)enterPageViewWithPageID:(NSString *)pageID;

+ (void)leavePageViewWithPageID:(NSString *)pageID;

+ (void)sendEventToServer:(NSString *)eventId;
@end
