//
//  UIControl+userStastistics.m
//  jsyf_user
//
//  Created by pro on 2017/10/12.
//  Copyright © 2017年 com.yingfeng365. All rights reserved.
//

#import "UIControl+userStastistics.h"
#import "YFHookUtility.h"
#import "YFUserStatistics.h"
#import "UMMobClick/MobClick.h"
@implementation UIControl (userStastistics)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL originalSelector = @selector(sendAction:to:forEvent:);
        SEL swizzledSelector = @selector(swiz_sendAction:to:forEvent:);
        [YFHookUtility swizzlingInClass:[self class] originalSelector:originalSelector swizzledSelector:swizzledSelector];
    });
}


#pragma mark - Method Swizzling

- (void)swiz_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event;
{
    //插入埋点代码
    [self performUserStastisticsAction:action to:target forEvent:event];
    [self swiz_sendAction:action to:target forEvent:event];
}

- (void)performUserStastisticsAction:(SEL)action to:(id)target forEvent:(UIEvent *)event;
{
    NSString *eventID = nil;
    //只统计触摸结束时
    if ([[[event allTouches] anyObject] phase] == UITouchPhaseEnded) {
        NSString *actionString = NSStringFromSelector(action);//方法名
        NSString *targetName = NSStringFromClass([target class]);//控制器名
        SpeLog(@"用户行为:控制器:%@,方法名:%@",targetName,actionString);
        NSDictionary *configDict = [self dictionaryFromUserStatisticsConfigPlist];
        eventID = configDict[targetName][@"ControlEventIDs"][actionString];
        NSString * username = [KeychainTool readKeychainValue:USERNAME];
        if (username!=nil&&![username isEqualToString:@""]) {
            [MobClick event:[NSString stringWithFormat:@"%@==%@==%@",username,targetName,actionString]];
         }
         else
         {
            [MobClick event:[NSString stringWithFormat:@"%@==%@",targetName,actionString]];
         }
    }
//
//    if (eventID != nil) {
//        [YFUserStatistics sendEventToServer:eventID];
//    }
}

- (NSDictionary *)dictionaryFromUserStatisticsConfigPlist
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"WGlobalUserStatisticsConfig" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:filePath];
    return dic;
}


@end
