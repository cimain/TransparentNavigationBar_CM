//
//  TabBarViewController.h
//  TransparentNavigationBar
//
//  Created by ChenMan on 2017/6/17.
//  Copyright © 2017年 满 陈. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstViewController.h"
#import "SecondViewController.h"


@interface TabBarViewController : UITabBarController

@property (nonatomic , assign) NSInteger currentTabIndex;

@property (nonatomic, strong) FirstViewController *firstVC;
@property (nonatomic, strong) SecondViewController *secondVC;

@end
