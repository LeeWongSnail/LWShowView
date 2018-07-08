//
//  LWShowView.h
//  LWShowView
//
//  Created by LeeWong on 2018/7/7.
//  Copyright © 2018年 LeeWong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LWShowViewProtocol.h"
//这个类适用于 外部不需要持有当前要弹出弹窗
@interface LWShowView : UIView <LWShowViewProtocol>

+ (void)show;

+ (void)showInView:(UIView *)aView;

+ (void)showInViewController:(UIViewController *)aViewController;

@end
