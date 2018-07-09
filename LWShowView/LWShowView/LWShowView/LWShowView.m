//
//  LWShowView.m
//  LWShowView
//
//  Created by LeeWong on 2018/7/7.
//  Copyright © 2018年 LeeWong. All rights reserved.
//

#import "LWShowView.h"
#import <objc/runtime.h>
#import <Masonry.h>

static LWShowView *shareView = nil;

@implementation LWShowView

+ (LWShowView *)shareView
{
    if (shareView == nil) {
        shareView = [[self alloc] initWithFrame:[UIScreen mainScreen].bounds];
    }
    return shareView;
}
#pragma mark - Method

+ (void)show
{
    [self show:nil];
}

+ (void)show:(void (^)(UIView * showView))completion
{
    [self shareView];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:shareView];
    [shareView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(window);
    }];
    if (completion) {
        completion(shareView);
    }
}


+ (void)showInView:(UIView *)aView
{
    [self showInView:aView completion:nil];
}

+ (void)showInView:(UIView *)aView completion:(void (^)(UIView * showView))aCompletion
{
    NSAssert(aView, @"aView参数不可以为空");
    [self shareView];
    [aView addSubview:shareView];
    [shareView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(aView);
    }];
    
    if (aCompletion) {
        aCompletion(shareView);
    }
}


+ (void)showInViewController:(UIViewController *)aViewController
{
    NSAssert(aViewController, @"aViewController参数不可以为空");
    [self shareView];
    [aViewController.view addSubview:shareView];
    [shareView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(aViewController.view);
    }];
}

+ (void)showInViewController:(UIViewController *)aViewController completion:(void (^)(UIView * showView))aCompletion
{
    NSAssert(aViewController, @"aViewController参数不可以为空");
    [self shareView];
    [aViewController.view addSubview:shareView];
    [shareView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(aViewController.view);
    }];
    
    if (aCompletion) {
        aCompletion(shareView);
    }
}

+ (void)dismiss
{
    [shareView removeFromSuperview];
    shareView = nil;
}

- (void)dealloc
{
    NSLog(@"%s",__func__);
}

+ (void)testMethod
{
    NSLog(@"%@",self);
}

@end
