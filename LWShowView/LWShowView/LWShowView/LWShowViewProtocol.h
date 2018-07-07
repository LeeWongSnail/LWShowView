//
//  LWShowViewProtocol.h
//  LWShowView
//
//  Created by LeeWong on 2018/7/7.
//  Copyright © 2018年 LeeWong. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LWShowViewProtocol

+ (void)show;

+ (void)showInView:(UIView *)aView;

+ (void)showInViewController:(UIViewController *)aViewController;


@end
