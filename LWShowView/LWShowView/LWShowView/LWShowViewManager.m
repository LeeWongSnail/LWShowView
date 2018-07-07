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

@interface LWShowViewManager()
@property (nonatomic, strong) UIView *showView;
@end


@implementation LWShowViewManager

- (void)show
{
    if (self.showView == nil) {
        return;
    }
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self.showView];
    [self.showView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(window);
    }];
}

//如果view为空
- (void)showInView:(UIView *)aView
{
    if (self.showView == nil) {
        return;
    }
    
    if (aView == nil) {
        UIViewController *rootVC = [LWShowViewManager getRootViewController];
        aView = rootVC.view;
    }
    
    [aView addSubview:self.showView];
    [self.showView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(aView);
    }];
    NSLog(@"%@",aView);
}

//若传递的控制器为空
- (void)showInViewController:(UIViewController *)aViewController
{
    if (self.showView == nil) {
        return;
    }
    
    if (aViewController == nil) {
        aViewController = [LWShowViewManager getRootViewController];
    }
    
    [aViewController.view addSubview:self.showView];
    [self.showView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(aViewController.view);
    }];
    NSLog(@"%@",aViewController);
    
}

+ (UIViewController *)getRootViewController {
    
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    if (rootViewController.presentedViewController) {
        return rootViewController.presentedViewController;
    }
    return rootViewController;
}


+ (void)showViewController:(UIViewController *)viewController dismiss:(void(^)(void))dismiss {
    CGSize size = CGSizeMake([UIScreen mainScreen].bounds.size.width / 2, [UIScreen mainScreen].bounds.size.height / 2);
    [self showViewController:viewController size:size dismiss:dismiss];
}

+ (void)showViewController:(UIViewController *)viewController size:(CGSize)size dismiss:(void(^)(void))dismiss {
    
    [self showViewController:viewController cornerRadius:5. size:size dismiss:dismiss];
}

+ (void)showViewController:(UIViewController *)viewController cornerRadius:(CGFloat)cornerRadius size:(CGSize)size dismiss:(void(^)(void))dismiss{

    UIViewController *rootViewController = [self getRootViewController];
    UIView *backView = [[UIView alloc] init];
    backView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    [rootViewController.view addSubview:backView];
    
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(rootViewController.view);
    }];

    
    viewController.view.layer.cornerRadius = cornerRadius;
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

    [rootView addSubview:view];
    view.center = rootView.center;
    [self alertViewAddArray:@[backView,view]];
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
@end
