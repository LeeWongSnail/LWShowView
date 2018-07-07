//
//  LWShowViewManager.h
//  LWShowView
//
//  Created by LeeWong on 2018/7/7.
//  Copyright © 2018年 LeeWong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface LWShowViewManager : NSObject

+ (void)showViewController:(UIViewController *)viewController dismiss:(void(^)(void))dismiss;
+ (void)showViewController:(UIViewController *)viewController size:(CGSize)size dismiss:(void(^)(void))dismiss;
+ (void)showViewController:(UIViewController *)viewController cornerRadius:(CGFloat)cornerRadius size:(CGSize)size dismiss:(void(^)(void))dismiss;

+ (void)showView:(UIView *)view dismiss:(void(^)(void))dismiss;
+ (void)dismiss;

+ (BOOL)isHaveShowView;

@end
