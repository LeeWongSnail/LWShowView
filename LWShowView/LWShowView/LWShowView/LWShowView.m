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
    [self showView];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:showView];
}

+ (void)showInView:(UIView *)aView
{
    
}

+ (void)showInViewController:(UIViewController *)aViewController
{
    
}

#pragma mark - Build UI

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUpSubview];
    }
    return self;
}

- (void)setUpSubview
{}

@end
