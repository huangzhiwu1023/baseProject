//
//  UIImage+Extension.h
//  jsyf_user
//
//  Created by 吕祥 on 2017/12/4.
//  Copyright © 2017年 YF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)
+ (UIImage *)resizableImageWithName:(NSString *)imageName size:(CGSize )size;
- (UIImage *)clipImageWithRadius:(CGFloat)radius;

- (UIImage *)createImageWithColor:(UIColor *)color;
+ (UIImage *)getNewImageWithName:(NSString *)imageName size:(CGSize )size;
+ (UIImage *)resizableRightImageWithName:(NSString *)imageName size:(CGSize )size;
+ (UIImage *)fixOrientation:(UIImage *)aImage;

+ (UIImage *)resizableImageWithString:(NSString *)imageStr size:(CGSize )size;
+ (UIImage *)getImageWithUrlStr:(NSString *)str;
@end
