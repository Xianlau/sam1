//
//  SamTabbarController.m
//  AoJiao
//
//  Created by Sam on 16/8/13.
//  Copyright © 2016年 Shawn. All rights reserved.
//

#import "SamTabbarController.h"
#import "SamNavigationController.h"
#import "SamTabbar.h"

@interface SamTabbarController ()

@end

@implementation SamTabbarController

#pragma mark - 单利
+(instancetype)shareInstance{
    static dispatch_once_t onceToken;
    static  SamTabbarController *_shareInstance = nil;
    dispatch_once(&onceToken, ^{
        _shareInstance = [[self alloc] init];
    });
    return _shareInstance;
}

+ (void)load{
    
    //UITabBarItem *item = [UITabBarItem appearanceWhenContainedIn:self, nil];
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:self];
    if (@available(iOS 9.0, *)) {
        UITabBarItem *item = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:array];
        // 设置选中状态下颜色
        NSMutableDictionary *attributeSel = [NSMutableDictionary dictionary];
        attributeSel[NSForegroundColorAttributeName] = [UIColor grayColor];
        [item setTitleTextAttributes:attributeSel forState:UIControlStateSelected];
        
        // 设置正常状态下字体
        NSMutableDictionary *attributeNor = [NSMutableDictionary dictionary];
        attributeNor[NSFontAttributeName] = [UIFont systemFontOfSize:10];
        [item setTitleTextAttributes:attributeNor forState:UIControlStateNormal];
    } else {
        // Fallback on earlier versions
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    //设置tabbar的背景颜色
//    self.tabBar.backgroundImage = [UIImage imageWithOriginalRenderingMode:@"tabbar-light"];
    UIView *view = [[UIView alloc]initWithFrame: self.tabBar.bounds];
    view.backgroundColor = [UIColor whiteColor];
    [self.tabBar addSubview:view];
 
}

///添加子控制器的block
+ (instancetype)tabBarControllerWithAddChildVCsBlock:(void (^)(SamTabbarController *))addVCsBlock{
    SamTabbarController *tabbarC = [SamTabbarController shareInstance];
    if (addVCsBlock) {
        addVCsBlock(tabbarC);
    }
    return tabbarC;
}

///添加子控制器
- (void)addChildVC:(UIViewController *)vc normalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName isRequiredNavController:(BOOL)isRequired{
    
    if (isRequired) {
        SamNavigationController *nav = [[SamNavigationController alloc] initWithRootViewController:vc];
        nav.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[self originImageWithName:normalImageName] selectedImage:[self originImageWithName:selectedImageName]];
        [self addChildViewController:nav];
    }else {
        [self addChildViewController:vc];
    }

}

#pragma mark - 返回非渲染image
- (UIImage *)originImageWithName: (NSString *)name {
    
    return [[UIImage imageNamed:name] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
}



-(void)setUpAllChildController{
    
 

}

- (void)setUpAllTabbarBtn {

}


#pragma mark - 添加中间发布按钮
- (void)setupPlusButton
{
    UIButton *plusButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [plusButton setImage:[UIImage imageNamed:@"Release"] forState:UIControlStateNormal];
    [plusButton setImage:[UIImage imageNamed:@"Release"] forState:UIControlStateHighlighted];
    // 自适应,自动根据按钮图片和文字计算按钮尺寸
    [plusButton sizeToFit];
    // 设置发布按钮的frame
    plusButton.frame = CGRectMake(0, 0, self.tabBar.frame.size.width / 5, self.tabBar.frame.size.height);
    // 设置发布按钮的中心点，在tabBar的中心
    plusButton.center = CGPointMake(self.tabBar.frame.size.width * 0.5, self.tabBar.frame.size.height * 0.5);
    [plusButton addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    
    [self.tabBar addSubview:plusButton];
}

#pragma mark - 点击了发布按钮
- (void)clickButton
{
}






@end
