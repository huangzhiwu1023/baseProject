//
//  UIImage+Extension.m
//  jsyf_user
//
//  Created by 吕祥 on 2017/12/4.
//  Copyright © 2017年 YF. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)
+ (UIImage *)resizableImageWithName:(NSString *)imageName size:(CGSize )size
{// 加载原有图片
    UIImage *norImage = [UIImage imageNamed:imageName];
    
    //开启图形上下文 YES是不透明 0.0
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    
    //图片宽度 图片高度
    CGFloat width = size.width;
    CGFloat height = size.height;
    
    
    //将下载完的image对象绘制到图形上下文
    [norImage drawInRect:CGRectMake(0, 0, width, height)];
    
    
    //获得图片
    norImage = UIGraphicsGetImageFromCurrentImageContext();
    //结束图形上下文
    UIGraphicsEndImageContext();
    // 获取原有图片的宽高的一半
    CGFloat w = norImage.size.width * 0.5;
    CGFloat h = norImage.size.height * 0.5;
    // 生成可以拉伸指定位置的图片
    UIImage *newImage = [norImage resizableImageWithCapInsets:UIEdgeInsetsMake(h, w, h, w) resizingMode:UIImageResizingModeStretch];
    
    return newImage;
}

- (UIImage *)clipImageWithRadius:(CGFloat)radius{
    CGFloat w = self.size.width;
    CGFloat h = self.size.height;
    
    if(radius<0){radius = 0;}
    if (radius>MIN(w, h)) {
        radius = MIN(w, h);
        
    }
    CGRect imgFrame = CGRectMake(0, 0, w, h);
    UIGraphicsBeginImageContextWithOptions(imgFrame.size, NO, 0);
    UIBezierPath  *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, w, h) cornerRadius:radius];
    [path addClip];
    [self drawInRect:imgFrame];
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}


- (UIImage *)createImageWithColor:(UIColor *)color{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    [color setFill];
    CGRect bounds = (CGRect){CGPointZero, self.size};
    UIRectFill(bounds);
    
    [self drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:1.0f];
    
    UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return tintedImage;
    
}
+ (UIImage *)getNewImageWithName:(NSString *)imageName size:(CGSize )size
{ // 加载原有图片
    UIImage *norImage = [UIImage imageNamed:imageName];
    //开启图形上下文 YES是不透明 0.0
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    //图片宽度 图片高度
    CGFloat width = size.width;
    CGFloat height = size.height;
    
    //将下载完的image对象绘制到图形上下文
    [norImage drawInRect:CGRectMake(0, 0, width, height)];
    
    //获得图片
    norImage = UIGraphicsGetImageFromCurrentImageContext();
    //结束图形上下文
    UIGraphicsEndImageContext();
    
    
    return norImage;
}



+ (UIImage *)resizableRightImageWithName:(NSString *)imageName size:(CGSize )size
{ // 加载原有图片
    
    UIImage *norImage = [UIImage imageNamed:imageName];
    //开启图形上下文 YES是不透明 0.0
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    
    //图片宽度 图片高度
    CGFloat width = size.width;
    CGFloat height = size.height;
    
    //将下载完的image对象绘制到图形上下文
    [norImage drawInRect:CGRectMake(0, 0, width, height)];
    
    //获得图片
    norImage = UIGraphicsGetImageFromCurrentImageContext();
    //结束图形上下文
    UIGraphicsEndImageContext();
    // 获取原有图片的宽高的一半
    CGFloat w = norImage.size.width;
    CGFloat h = norImage.size.height;
    // 生成可以拉伸指定位置的图片
    UIImage *newImage = [norImage resizableImageWithCapInsets:UIEdgeInsetsMake(1, w-2, h-2, 1) resizingMode:UIImageResizingModeStretch];
    
    return newImage;
}



+ (UIImage *)fixOrientation:(UIImage *)aImage {
    
    // No-op if the orientation is already correct
    if (aImage.imageOrientation == UIImageOrientationUp)
        return aImage;
    
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    switch (aImage.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, aImage.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, aImage.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
    }
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        default:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, aImage.size.width, aImage.size.height,
                                             CGImageGetBitsPerComponent(aImage.CGImage), 0,
                                             CGImageGetColorSpace(aImage.CGImage),
                                             CGImageGetBitmapInfo(aImage.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (aImage.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.height,aImage.size.width), aImage.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.width,aImage.size.height), aImage.CGImage);
            break;
    }
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}

+ (UIImage *)resizableImageWithString:(NSString *)imageStr size:(CGSize )size {
    // 加载原有图片
    UIImage * norImage;
    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageStr]];
    norImage = [UIImage imageWithData:data];
    //开启图形上下文 YES是不透明 0.0
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    
    //图片宽度 图片高度
    CGFloat width = size.width;
    CGFloat height = size.height;
    
    //将下载完的image对象绘制到图形上下文
    [norImage drawInRect:CGRectMake(0, 0, width, height)];
    
    //获得图片
    norImage = UIGraphicsGetImageFromCurrentImageContext();
    //结束图形上下文
    UIGraphicsEndImageContext();
    // 获取原有图片的宽高的一半
    CGFloat w = norImage.size.width;
    CGFloat h = norImage.size.height;
    // 生成可以拉伸指定位置的图片  UIEdgeInsetsMake(1, w-2, h-2, 1) UIEdgeInsetsMake(h, w, h, w)
    UIImage *newImage = [norImage resizableImageWithCapInsets:UIEdgeInsetsMake(0, 40, 0, 0) resizingMode:UIImageResizingModeStretch];
    
    return newImage;

}

+ (UIImage *)getImageWithUrlStr:(NSString *)str {
    UIImage * resultImage;
    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:str]];
    resultImage = [UIImage imageWithData:data];
    return resultImage;
}
@end
