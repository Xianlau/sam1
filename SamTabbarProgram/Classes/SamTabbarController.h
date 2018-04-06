//
//  SamTabbarController.h
//  AoJiao
//
//  Created by Sam on 16/8/13.
//  Copyright © 2016年 Shawn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SamTabbarController : UITabBarController

#pragma mark - 单利
+(instancetype)shareInstance;

/**
 添加子控制器的block
 
 @param addVCsBlock 添加代码块
 
 @return samTabbarController
 */
+ (instancetype)tabBarControllerWithAddChildVCsBlock: (void(^)(SamTabbarController * samTabbarController))addVCsBlock;

/**
 添加子控制器
 
 @param vc                子控制器
 @param normalImageName   普通状态下图片
 @param selectedImageName 选中图片
 @param isRequired        是否需要包装导航控制器
 */
- (void)addChildVC: (UIViewController *)vc normalImageName: (NSString *)normalImageName selectedImageName:(NSString *)selectedImageName isRequiredNavController: (BOOL)isRequired;

@end
