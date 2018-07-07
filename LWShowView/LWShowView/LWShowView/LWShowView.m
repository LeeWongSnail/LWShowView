//
//  LWShowView.m
//  LWShowView
//
//  Created by LeeWong on 2018/7/7.
//  Copyright © 2018年 LeeWong. All rights reserved.
//

#import "LWShowView.h"

static LWShowView *showView = nil;

@implementation LWShowView

+ (LWShowView *)showView
{
    if (showView == nil) {
        showView = [[self alloc]  initWithFrame:[UIScreen mainScreen].bounds];
    }
    return showView;
}


+ (void)show
{
    
}

+ (void)showInView:(UIView *)aView
{
    
}

+ (void)showInViewController:(UIViewController *)aViewController
{
    
}

@end
