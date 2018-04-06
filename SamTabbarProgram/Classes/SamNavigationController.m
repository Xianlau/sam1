//
//  SamNavigationController.m
//  AoJiao
//
//  Created by Sam on 16/8/13.
//  Copyright © 2016年 Shawn. All rights reserved.
//

#import "SamNavigationController.h"
#import "SamNavigationBar.h"


@interface SamNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation SamNavigationController

#pragma mark - 设置title文字和背景图片
-(instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    if (self = [super initWithRootViewController:rootViewController]) {
        [self setValue:[[SamNavigationBar alloc] init] forKey:@"navigationBar"];
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //设置边缘滑动手势
    [self setPopGestureRecognizer];

}

#pragma mark - push
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.childViewControllers.count > 0) {
//        //button
//        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//        [btn setTitle:@"返回" forState:UIControlStateNormal];
//        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [btn setTitleColor:[UIColor redColor ] forState:UIControlStateHighlighted];
//        [btn setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
//        [btn setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
//        //size
//        [btn sizeToFit];
//        btn.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
//        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
//        //add target
//        [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
//
//        viewController.navigationItem.leftBarButtonItem set
        //隐藏tabbar
        viewController.hidesBottomBarWhenPushed = YES;
        


        
    }
    //跳转
    [super pushViewController:viewController animated:animated];
    
}

//- (void)back {
//    
//    [self popViewControllerAnimated:YES];
//}




-(void)setPopGestureRecognizer{
    //边缘滑动手势
    self.interactivePopGestureRecognizer.enabled = YES;
    //清空滑动手势代理,就恢复了滑动手势功能
    self.interactivePopGestureRecognizer.delegate = self;
    
//    //全屏可滑动
//    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
////    [self.view addGestureRecognizer:pan];
////    pan.delegate = self;
//
}

//#pragma mark -UIPanGestureRecognizer_delegate
//-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
//
//    return self.childViewControllers.count > 1;
//
//}


@end
