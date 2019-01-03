//
//  UIViewController+userStastistics.m
//  jsyf_user
//
//  Created by pro on 2017/10/12.
//  Copyright © 2017年 com.yingfeng365. All rights reserved.
//

#import "UIViewController+userStastistics.h"
#import "YFUserStatistics.h"
#import "YFHookUtility.h"
#import "UMMobClick/MobClick.h"
#import "publicMacro.h"
#import <objc/runtime.h>
#import "YFTabBarControllerConfig.h"
@implementation UIViewController (userStastistics)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
//        SEL originalSelector = @selector(viewWillAppear:);
//        SEL swizzledSelector = @selector(swiz_viewWillAppear:);
//        [YFHookUtility swizzlingInClass:[self class] originalSelector:originalSelector swizzledSelector:swizzledSelector];
        
        SEL originalSelector2 = @selector(viewWillDisappear:);
        SEL swizzledSelector2 = @selector(swiz_viewWillDisappear:);
        [YFHookUtility swizzlingInClass:[self class] originalSelector:originalSelector2 swizzledSelector:swizzledSelector2];

        SEL originalSelector3 = @selector(viewDidAppear:);
        SEL swizzledSelector3 = @selector(swiz_viewDidAppear:);
        [YFHookUtility swizzlingInClass:[self class] originalSelector:originalSelector3 swizzledSelector:swizzledSelector3];

    });
}

#pragma mark - Method Swizzling

- (void)swiz_viewWillAppear:(BOOL)animated
{
    //插入需要执行的代码
    [self inject_viewWillAppear];
    [self swiz_viewWillAppear:animated];
    if (self.title.length) {
        SpeLog(@"路径开始%@==%@  %s",NSStringFromClass(self.class),self.title,__func__);
        SpeLog(@"pinyin=%@",[NSString transformPinYinWithString:self.title]);
        [MobClick beginLogPageView:[NSString stringWithFormat:@"%@==%@  ",NSStringFromClass(self.class),[NSString transformPinYinWithString:self.title]]];
        NSString * username = [KeychainTool readKeychainValue:USERNAME];
        if (username!=nil&&![username isEqualToString:@""]) {
            [MobClick beginLogPageView:[NSString stringWithFormat:@"%@==%@==%@",username,NSStringFromClass(self.class),[NSString transformPinYinWithString:self.title]]];
        }
        else
        {
            [MobClick beginLogPageView:[NSString stringWithFormat:@"%@==%@",NSStringFromClass(self.class),[NSString transformPinYinWithString:self.title]]];
        }
        
    }
}

- (void)swiz_viewDidAppear:(BOOL)animated
{
    [self swiz_viewDidAppear:animated];
    if ([self.class isKindOfClass:[YFBaseNavigationController class]]) {
        return;
    }
    if (self.title.length) {
        SpeLog(@"路径开始%@==%@  %s",NSStringFromClass(self.class),self.title,__func__);
        SpeLog(@"pinyin=%@",[NSString transformPinYinWithString:self.title]);
        [MobClick beginLogPageView:[NSString stringWithFormat:@"%@==%@  ",NSStringFromClass(self.class),[NSString transformPinYinWithString:self.title]]];
        NSString * username = [KeychainTool readKeychainValue:USERNAME];
        if (username!=nil&&![username isEqualToString:@""]) {
            [MobClick beginLogPageView:[NSString stringWithFormat:@"%@==%@==%@",username,NSStringFromClass(self.class),[NSString transformPinYinWithString:self.title]]];
        }
        else
        {
            [MobClick beginLogPageView:[NSString stringWithFormat:@"%@==%@",NSStringFromClass(self.class),[NSString transformPinYinWithString:self.title]]];
        }
    }
}


- (void)swiz_viewWillDisappear:(BOOL)animated
{

    [self inject_viewWillDisappear];
    [self swiz_viewWillDisappear:animated];
    if ([self.class isKindOfClass:[YFBaseNavigationController class]]) {
        return;
    }
    if (self.title.length) {
        //离开控制器时 获取保存数据的字典 发送友盟
//        id classObject = objc_getClass([NSStringFromClass(self.class) UTF8String]);
//        unsigned int count = 0;
//        unsigned int icount = 0;
//        objc_property_t * properties = class_copyPropertyList(classObject, &count);
//        Ivar * ivars = class_copyIvarList(classObject, &icount);
//        for (int i =0; i<count; i++) {
//            objc_property_t property = properties[i];
//            NSString * propertName =  [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
//            SpeLog(@"propertName=%@",propertName);
//        }
        NSString * username = [KeychainTool readKeychainValue:USERNAME];
        if (username!=nil&&![username isEqualToString:@""]) {
            [MobClick endLogPageView:[NSString stringWithFormat:@"%@==%@==%@",username,NSStringFromClass(self.class),[NSString transformPinYinWithString:self.title]]];
        }
        else
        {
            [MobClick endLogPageView:[NSString stringWithFormat:@"%@==%@",NSStringFromClass(self.class),[NSString transformPinYinWithString:self.title]]];
        }
        SpeLog(@"路径结束%@==%@ == %s",NSStringFromClass(self.class),self.title,__func__);
//        [MobClick endLogPageView:[NSString stringWithFormat:@"%@==%@",NSStringFromClass(self.class),[NSString transformPinYinWithString:self.title]]];
    }
    
}

//利用hook 统计所有页面的停留时长
- (void)inject_viewWillAppear
{
    NSString *pageID = [self pageEventID:YES];
    if (pageID) {
        [YFUserStatistics sendEventToServer:pageID];
    }
}

- (void)inject_viewWillDisappear
{
    NSString *pageID = [self pageEventID:NO];
    if (pageID) {
        [YFUserStatistics sendEventToServer:pageID];
    }
}

- (NSString *)pageEventID:(BOOL)bEnterPage
{
    NSDictionary *configDict = [self dictionaryFromUserStatisticsConfigPlist];
    NSString *selfClassName = NSStringFromClass([self class]);
    return configDict[selfClassName][@"PageEventIDs"][bEnterPage ? @"Enter" : @"Leave"];
}

- (NSDictionary *)dictionaryFromUserStatisticsConfigPlist
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"WGlobalUserStatisticsConfig" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:filePath];
    return dic;
}



    
@end
