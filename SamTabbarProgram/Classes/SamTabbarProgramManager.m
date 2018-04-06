//
//  SamTabbarProgramManager.m
//  Pods-SamTabbarProgram_Example
//
//  Created by Sam on 2018/4/6.
//

#import "SamTabbarProgramManager.h"
#import "SamTabbarController.h"
#import "SamNavigationController.h"
#import "SamNavigationBar.h"

@implementation SamTabbarProgramManager

+ (UITabBarController *)rootTabBarCcontroller{
  
    return [SamTabbarController shareInstance];
}

+ (void)addChildVC:(UIViewController *)vc normalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName isRequiredNavController:(BOOL)isRequired{
    
    [[SamTabbarController shareInstance] addChildVC:vc normalImageName:normalImageName selectedImageName:selectedImageName isRequiredNavController:isRequired];
    
}

+ (void)setNavBarGlobalBackGroundImage:(UIImage *)globalImg{
    
    [SamNavigationBar setGlobalBackGroundImage:globalImg];
    
}

+ (void)setNavBarGlobalTextColor:(UIColor *)globalTextColor andFontSize:(CGFloat)fontSize{
    
    [SamNavigationBar setGlobalTextColor:globalTextColor andFontSize:fontSize];
}

@end
