//
//  UIView+HUD.m
//  TRProject
//
//  Created by tarena on 16/2/26.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "UIView+HUD.h"
#import "UIImage+GIF.h"
//超时
#define kTimeOut  10
//弹出提示时长
#define kDuration  1.5
@implementation UIView (HUD)
- (void)showBusyHUD{
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideAllHUDsForView:self animated:YES];
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
        hud.graceTime = 0.5;
        hud.hudContentStyle(NHHUDContentBlackStyle);
        hud.userInteractionEnabled = YES;
        [hud hideAnimated:YES afterDelay:kTimeOut];
    });
}
//- (void)showBusyHUD{
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [MBProgressHUD hideAllHUDsForView:self animated:YES];
//        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
//        hud.mode = MBProgressHUDModeCustomView;
//        hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
//        hud.bezelView.color = [UIColor clearColor];
//        //        hud.hudContentStyle(NHHUDContentBlackStyle);
//        NSString *path = [[NSBundle mainBundle] pathForResource:@"YFLoading" ofType:@"gif"];
//        NSData *data = [NSData dataWithContentsOfFile:path];
//        UIImageView *gifImageView = [[UIImageView alloc] initWithImage:[UIImage sd_animatedGIFWithData:data]];
////        gifImageView.contentMode = UIViewContentModeScaleAspectFit;
//        gifImageView.backgroundColor = [UIColor clearColor];
//        [gifImageView mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.width.equalTo(126);
//            make.height.equalTo(102);
//        }];
//        hud.customView = gifImageView;
//        hud.userInteractionEnabled = YES;
//        [hud hideAnimated:YES afterDelay:kTimeOut];
//        //        [hud hide:YES afterDelay:kTimeOut];
//    });
//}


- (void)showBusyHudWithText:(NSString *)text {
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideAllHUDsForView:self animated:YES];
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
        hud.hudContentStyle(NHHUDContentBlackStyle);
        hud.userInteractionEnabled = YES;
        hud.mode = MBProgressHUDModeIndeterminate;
        hud.label.text = text;
        [hud hideAnimated:YES afterDelay:kTimeOut];
    });
}

- (void)showWarning:(NSString *)warning{
    if (warning.length == 0) {
        return;
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideAllHUDsForView:self animated:YES];
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
        hud.hudContentStyle(NHHUDContentBlackStyle);
        hud.mode = MBProgressHUDModeText;
        hud.label.text = warning;
        hud.label.numberOfLines = 0;
        [hud hideAnimated:YES afterDelay:kDuration];
    });
}


- (void)showMsgWithTitle:(NSString *)title
{
    if (title.length == 0) {
        return;
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideAllHUDsForView:self animated:YES];
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
        hud.hudContentStyle(NHHUDContentBlackStyle);
        hud.mode = MBProgressHUDModeText;
        hud.label.text = title;
        hud.label.numberOfLines = 0;
    });
}

- (void)hideBusyHUD{
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:self animated:YES];
    });
}

- (void)showBusyHUDWithYoffSet:(CGFloat)offSet {
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideAllHUDsForView:self animated:YES];
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
        hud.userInteractionEnabled = YES;
        //        [hud hide:YES afterDelay:kTimeOut];
//        hud.yOffset = offSet;
        [hud setOffset:CGPointMake(0, offSet)];
    });

}
@end










