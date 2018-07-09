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


/**
 将一个创建好的view弹出

 @param view 要弹出的view
 @param dismiss 背景蒙层被点击之后的回调
 */
+ (void)showView:(UIView *)view dismiss:(void(^)(void))dismiss;


/**
 将一个创建好的控制器弹出

 @param viewController 将要被弹出的控制器
 @param size 控制器的Size
 @param dismiss 背景蒙层被点击之后的回调
 */
+ (void)showViewController:(UIViewController *)viewController size:(CGSize)size dismiss:(void(^)(void))dismiss;



/**
 移除上一次添加的view或者viewController
 */
+ (void)dismiss;



/**
 设置 背景蒙层点击是否移除显示的view或者viewcontroller

 @param aEnable YES 点击移除 NO 点击不移除
 */
+ (void)showViewTapDismissEnable:(BOOL)aEnable;


/**
 当前是否有弹出的view或者viewcontroller

 @return YES 目前有在弹出的view NO 当前没有view或者viewController被弹出
 */
+ (BOOL)isHaveShowView;

@end
