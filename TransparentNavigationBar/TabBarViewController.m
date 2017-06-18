//
//  TabBarViewController.m
//  TransparentNavigationBar
//
//  Created by ChenMan on 2017/6/17.
//  Copyright © 2017年 满 陈. All rights reserved.
//

#import "TabBarViewController.h"


@interface TabBarViewController ()<UITabBarDelegate>

@end

@implementation TabBarViewController

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    // 开启返回
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpViewControllers];
    // Do any additional setup after loading the view from its nib.
}


- (void)setUpViewControllers
{
    FirstViewController *firstVC = [[FirstViewController alloc] initWithNibName:NSStringFromClass([FirstViewController class]) bundle:nil];
    [self addOneChildVC:firstVC title:@"首页" imageName:@"home_normal" selectedImageName:@"home_highlight"];
    _firstVC = firstVC;
    self.firstVC.tabBarItem.tag = 0;
    
    SecondViewController *secondVC = [[SecondViewController alloc] initWithNibName:NSStringFromClass([SecondViewController class]) bundle:nil];
    [self addOneChildVC:secondVC title:@"新页" imageName:@"account_normal" selectedImageName:@"account_highlight"];
    _secondVC = secondVC;
    self.secondVC.tabBarItem.tag = 1;
    
}

- (void)addOneChildVC:(UIViewController *)childVC title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    // 添加导航控制器
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childVC];
    // 设置标题
    nav.title = title;
    
    // 设置图标
    nav.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 设置选中图标
    UIImage *selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    nav.tabBarItem.selectedImage = selectedImage;
    
    //    // 添加导航控制器
    //    BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:childVC];
    [self addChildViewController:nav];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    switch (item.tag) {
        case 0:
        {
            self.currentTabIndex = 0;
        }
            break;
        case 1:
        {
            self.currentTabIndex = 1;
        }
            break;
            
        default:
            break;
    }
    NSLog(@"didSelectItem: %ld tag: %ld", (long)tabBar.tag, (long)item.tag);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
