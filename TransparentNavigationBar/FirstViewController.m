//
//  FirstViewController.m
//  TransparentNavigationBar
//
//  Created by ChenMan on 2017/6/17.
//  Copyright © 2017年 满 陈. All rights reserved.
//

#import "FirstViewController.h"
#import "UIImage+Color.h"
#import "MacroDefinition.h"

@interface FirstViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *groupView;
@property (weak, nonatomic) IBOutlet UIView *headView;
@property (weak, nonatomic) IBOutlet UIView *downView;

//头部缩放视图图片
@property (nonatomic, strong) UIImageView *headerImageView;

//头部缩放视图图片高度
@property (nonatomic, assign) CGFloat headerScaleImageHeight;

@end

@implementation FirstViewController


- (UIImageView *)headerImageView
{
    if (_headerImageView == nil) {
        
        _headerImageView = [[UIImageView alloc] init];
        _headerImageView.clipsToBounds = YES;
        _headerImageView.contentMode = UIViewContentModeScaleAspectFill;
        
        [self.groupView insertSubview:self.headerImageView atIndex:0];
    }
    return _headerImageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _scrollView.delegate = self;
    //顶部视图背景透明
    self.headView.backgroundColor = [UIColor clearColor];
    
    self.downView.layer.masksToBounds = YES;
    self.downView.layer.cornerRadius = 6;
    
    UIImage *bgImage = [UIImage bgImageFromColors:@[(id)UIColorFromRGB(0xff7f50), (id)UIColorFromRGB(0xFF8DAC)] withFrame:CGRectMake(0, 0, CGRectGetWidth(_headView.frame), CGRectGetHeight(_headView.frame))];
    
    self.headerScaleImageHeight = 177;
    
    self.headerImageView.frame = CGRectMake(0 , 0, kWidth, self.headerScaleImageHeight);
    
    self.headerImageView.image = bgImage;
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    //导航栏设置透明
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Transparent_BG_Title-High"] forBarMetrics:UIBarMetricsDefault];
    //设置导航栏分割线:透明
    if ([self.navigationController.navigationBar respondsToSelector:@selector(shadowImage)]) {
        [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    }
    //显示导航栏
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    // 设置navigationBar的背景颜色
    CGRect frame = CGRectMake(0, 0, kWidth, kStatusBarAndNavigationBarHeight);
    NSLog(@"frame: %@", NSStringFromCGRect(frame));
    
    //导航栏设置不透明
    [self.navigationController.navigationBar setBackgroundImage:[UIImage bgImageFromColors:@[(id)UIColorFromRGB(0x9ebd3a), (id)UIColorFromRGB(0x0075b6)] withFrame:frame] forBarMetrics:UIBarMetricsDefault];
    
    //设置导航栏分割线
    [self.navigationController.navigationBar setTranslucent:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 获取当前偏移量
    CGFloat offsetY = scrollView.contentOffset.y;
    
    if (offsetY < 0) {
        
        self.headerImageView.frame = CGRectMake(offsetY, offsetY, self.view.bounds.size.width - offsetY * 2, self.headerScaleImageHeight - offsetY);
        
    } else {
        
        self.headerImageView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.headerScaleImageHeight);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
