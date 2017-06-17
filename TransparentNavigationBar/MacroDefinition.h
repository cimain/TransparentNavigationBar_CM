//
//  MacroDefinition.h
//  TransparentNavigationBar
//
//  Created by ChenMan on 2017/6/17.
//  Copyright © 2017年 满 陈. All rights reserved.
//

#ifndef MacroDefinition_h
#define MacroDefinition_h

// 状态栏高度
#define kStatusBarAndNavigationBarHeight (20.f + 44.f)

// rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

// 屏幕尺寸相关
#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height

#endif /* MacroDefinition_h */
