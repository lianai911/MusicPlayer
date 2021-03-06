//
//  YSCTabBarController.m
//  音乐播放器
//
//  Created by YangLunlong on 16/5/15.
//  Copyright © 2016年 lianai911. All rights reserved.
//

#import "YSCTabBarController.h"
#import "YSCNavigationController.h"
#import "YSCDiscoveryController.h"
#import "YSCMeController.h"
#import "YSCLoveController.h"
#import "YSCMusicController.h"
#import "YSCTabBar.h"

@interface YSCTabBarController ()

@end

@implementation YSCTabBarController

+ (void)initialize
{
    //通过appearance统一设置所有UITabBarItem的文字属性
    //方法后边带有UI_APPEARANCE_SELECTOR的方法，都可以通过appearance对象来统一设置
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectAttrs = [NSMutableDictionary dictionary];
    selectAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:(UIControlStateNormal)];
    

}

- (void) setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    // 在这里更改颜色会加载全部控制器
    //包装一个导航控制器，添加导航控制器为tabbarcontroller的子控制器
    YSCNavigationController *nav = [[YSCNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setupChildVc:[[YSCDiscoveryController alloc] init] title:@"发  现" image:@"YSCsearch" selectedImage:@"YSCsearchClick"];
    
    [self setupChildVc:[[YSCMusicController alloc] init] title:@"音乐库" image:@"YSCMusic" selectedImage:@"YSCMusicClick"];
    
    [self setupChildVc:[[YSCLoveController alloc] init] title:@"喜  欢" image:@"YSCHeart" selectedImage:@"YSCHeartClick"];
    
    [self setupChildVc:[[YSCMeController alloc] init] title:@"我" image:@"YSCMe" selectedImage:@"YSCMeClick"];

    
    [self setValue:[[YSCTabBar alloc] init] forKey:@"tabBar"];  
    
}


@end
