//
//  UINavigationItem+Custom.m
//  XMMuseum
//
//  Created by 何振东 on 14/7/24.
//  Copyright (c) 2014年 XM. All rights reserved.
//

#import "UINavigationItem+Custom.h"
#import<objc/runtime.h>
@implementation UINavigationItem (Custom)

- (UIBarButtonItem *)backBarButtonItem
{
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:NULL];
    [backItem setBackgroundImage:nil forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    return backItem;
}

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method originalMethodImp = class_getInstanceMethod(self, @selector(backBarButtonItem));
        Method destMethodImp = class_getInstanceMethod(self, @selector(myCustomBackButton_backBarbuttonItem));
        method_exchangeImplementations(originalMethodImp, destMethodImp);
    });
}

static char kCustomBackButtonKey;
-(UIBarButtonItem *)myCustomBackButton_backBarbuttonItem{
    UIBarButtonItem *item = [self myCustomBackButton_backBarbuttonItem];
    if (item) {
        return item;
    }
    item = objc_getAssociatedObject(self, &kCustomBackButtonKey);
    if (!item) {
        item = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:NULL];
        objc_setAssociatedObject(self, &kCustomBackButtonKey, item, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return item;
}

- (void)dealloc
{
    objc_removeAssociatedObjects(self);
}

@end
