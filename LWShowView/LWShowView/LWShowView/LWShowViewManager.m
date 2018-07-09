//
//  LWShowViewManager.m
//  LWShowView
//
//  Created by LeeWong on 2018/7/7.
//  Copyright © 2018年 LeeWong. All rights reserved.
//

#import "LWShowViewManager.h"
#import <Masonry.h>
// 为多层级服务
static NSMutableArray<NSArray *> *showViewArray;

static BOOL tapDismiss = NO;

@interface LWShowViewManager()
@property (nonatomic, copy) void (^dismissBlock)(void);
@end


@implementation LWShowViewManager


+ (void)showViewController:(UIViewController *)viewController size:(CGSize)size dismiss:(void(^)(void))dismiss {
    
    UIViewController *rootViewController = [self getRootViewController];
    UIView *backView = [[UIView alloc] init];
    backView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    [rootViewController.view addSubview:backView];
    
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(rootViewController.view);
    }];
    
    if (tapDismiss) {
        [backView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)]];
    }
    
    viewController.view.clipsToBounds = YES;
    [rootViewController.view addSubview:viewController.view];
    [rootViewController addChildViewController:viewController];
    [viewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(rootViewController.view);
        make.size.mas_equalTo(size);
    }];
    [self alertViewAddArray:@[backView,viewController]];
}



+ (void)showView:(UIView *)view dismiss:(void(^)(void))dismiss {
    
    UIView *rootView = [self getRootViewController].view;
    
    UIView *backView = [[UIView alloc] init];
    backView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    [rootView addSubview:backView];
    
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(rootView);
    }];
    
    if (tapDismiss) {
        [backView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)]];
    }
    
    [rootView addSubview:view];
    view.center = rootView.center;
    [self alertViewAddArray:@[backView,view]];
}


+ (void)showViewTapDismissEnable:(BOOL)aEnable
{
    tapDismiss = aEnable;
}

+ (UIViewController *)getRootViewController {
    
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    if (rootViewController.presentedViewController) {
        return rootViewController.presentedViewController;
    }
    return rootViewController;
}


+ (void)alertViewAddArray:(NSArray *)array {
    if (showViewArray == nil) {
        showViewArray = [[NSMutableArray alloc] init];
    }
    [showViewArray addObject:array];
}

+ (void)dismiss {
    NSArray *array = [showViewArray lastObject];
    [array enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[UIViewController class]]) {
            UIViewController *vc = (UIViewController *)obj;
            vc.view.hidden = YES;
            [vc.view removeFromSuperview];
            [vc removeFromParentViewController];
        }else if ([obj isKindOfClass:[UIView class]]) {
            UIView *view = (UIView *)obj;
            view.hidden = YES;
            [view removeFromSuperview];
        }
    }];
    [showViewArray removeLastObject];
    if (showViewArray.count == 0) {
        showViewArray = nil;
    }
}

+ (BOOL)isHaveShowView {
    return showViewArray != nil;
}

- (void)dealloc
{
    NSLog(@"%s",__func__);
}
@end
