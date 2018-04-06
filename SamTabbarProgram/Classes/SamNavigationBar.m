//
//  SamNavigationBar.m
//  Pods-SamTabbarProgram_Example
//
//  Created by Sam on 2018/4/6.
//

#import "SamNavigationBar.h"

@implementation SamNavigationBar

// 设置全局导航条背景图片
+(void)setGlobalBackGroundImage:(UIImage *)globalImg{
    
    if (@available(iOS 9.0, *)) {
        UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[NSClassFromString(@"SamNavigationController")]];
        [navBar setBackgroundImage:globalImg forBarMetrics:UIBarMetricsDefault];
    } else {
        // Fallback on earlier versions
    }
}

//设置全局导航栏标题颜色, 和文字大小
+(void)setGlobalTextColor:(UIColor *)globalTextColor andFontSize:(CGFloat)fontSize{
    
    if (globalTextColor == nil) {
        return;
    }
    if (fontSize < 10 || fontSize > 30) {
        fontSize = 16;
    }
    if (@available(iOS 9.0, *)) {
        UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[NSClassFromString(@"SamNavigationController")]];
        // 设置导航栏颜色和文字
        NSDictionary *titleDic = @{
                                   NSForegroundColorAttributeName: globalTextColor,
                                   NSFontAttributeName: [UIFont systemFontOfSize:fontSize]
                                   };
        [navBar setTitleTextAttributes:titleDic];
    } else {
        // Fallback on earlier versions
    }
}


@end
