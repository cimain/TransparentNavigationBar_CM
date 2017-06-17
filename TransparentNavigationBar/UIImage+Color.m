//
//  UIImage+Color.m
//  TransparentNavigationBar
//
//  Created by ChenMan on 2017/6/17.
//  Copyright © 2017年 满 陈. All rights reserved.
//

#import "UIImage+Color.h"

@implementation UIImage (Color)

#pragma mark - 图片颜色渐变效果
+ (UIImage *)bgImageFromColors:(NSArray *)colors withFrame:(CGRect)frame
{
    NSMutableArray *gradientColors = [NSMutableArray array];
    
    for(UIColor *c in colors) {
        [gradientColors addObject:(id)c.CGColor];
    }
    
    //    UIGraphicsBeginImageContextWithOptions(frame.size, NO, 1);
    UIGraphicsBeginImageContextWithOptions(frame.size, NO, 0.0f);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //    CGContextSaveGState(context);
    
    //    CGColorSpaceRef colorSpace = CGColorGetColorSpace([[colors lastObject] CGColor]);
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    //设定颜色分割点
    CGFloat lacations[2] = {0.0, 1.0};
    //    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)ar, NULL);
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)gradientColors, lacations);
    
    CGPoint start = CGPointMake(0.0, 0.0);
    
    CGPoint end = CGPointMake(0.0, frame.size.height);
    
    CGContextDrawLinearGradient(context, gradient, start, end,kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    CGGradientRelease(gradient);
    
    CGColorSpaceRelease(colorSpace);
    
    UIGraphicsEndImageContext();
    
    return image;
}

@end
