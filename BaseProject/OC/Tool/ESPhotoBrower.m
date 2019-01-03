//
//  ESPhotoBrower.m
//  ESH_OA
//
//  Created by 吕祥 on 2017/9/26.
//  Copyright © 2017年 ESH. All rights reserved.
//

#import "ESPhotoBrower.h"
#import "KSPhotoBrowser.h"
//#import <KSPhotoBrowser/KSPhotoBrowser.h>

@interface ESPhotoBrower()

@end

@implementation ESPhotoBrower
- (void)showWithImageList:(NSArray *)list parentViews:(NSArray<UIImageView *> *)views onVC:(UIViewController *)vc index:(NSInteger)index{
    NSMutableArray *items = @[].mutableCopy;
    for (int i = 0; i < list.count; i++) {
        // Get the large image url
//        NSString *url = [list[i] stringByReplacingOccurrencesOfString:@"bmiddle" withString:@"large"];
        NSString *url = list[i];
        UIImageView *imageView;
        if (views.count <= i) {
            imageView = views.firstObject;
        }
        else {
            imageView = views[i];
        }
        KSPhotoItem *item = [KSPhotoItem itemWithSourceView:imageView imageUrl:[NSURL URLWithString:url]];
        [items addObject:item];
    }
    KSPhotoBrowser *browser = [KSPhotoBrowser browserWithPhotoItems:items selectedIndex:index];
    browser.dismissalStyle = KSPhotoBrowserInteractiveDismissalStyleRotation;
    browser.backgroundStyle = KSPhotoBrowserBackgroundStyleBlack;
    browser.loadingStyle = KSPhotoBrowserImageLoadingStyleIndeterminate;
    browser.pageindicatorStyle = KSPhotoBrowserPageIndicatorStyleDot; //dot/text(1/10)
    browser.bounces = NO;
    [browser showFromViewController:vc];
}


@end
