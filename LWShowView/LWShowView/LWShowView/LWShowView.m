//
//  LWShowView.m
//  LWShowView
//
//  Created by LeeWong on 2018/7/7.
//  Copyright © 2018年 LeeWong. All rights reserved.
//

#import "LWShowView.h"
#import <Masonry.h>
#import "LWShowViewManager.h"

static LWShowView *showView = nil;

@interface LWShowView()
@property (nonatomic, strong) LWShowViewManager *manager;
@end


static LWShowViewManager *manager;

@implementation LWShowView

+ (void)initialize
{
    [self shareManager];
}

+ (LWShowViewManager *)shareManager
{
    if (manager == nil) {
        manager = [[LWShowViewManager alloc] init];
    }
    return manager;
}

//跟对象方法对应的类方法
+ (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
    if (!signature) {
        if ([LWShowViewManager respondsToSelector:aSelector]) {
            signature = [LWShowViewManager methodSignatureForSelector:aSelector];
        }
    }
    return signature;
}

//跟对象方法对应的类方法
+ (void)forwardInvocation:(NSInvocation *)anInvocation
{
    NSString *selName = NSStringFromSelector(anInvocation.selector);
    Class cls = anInvocation.target;
    UIView *showV = (UIView *)[[cls alloc] init];
    if ([selName isEqualToString:@"show"]) {
        //类方法是通过类名进行调用的
        [LWShowViewManager showView:showV dismiss:nil];
        [anInvocation invokeWithTarget:manager];
    } else if ([selName isEqualToString:@"showInView:"]) {
        [LWShowViewManager showView:showV dismiss:nil];
        [anInvocation invokeWithTarget:manager];
    } else if ([selName isEqualToString:@"showInViewController:"]) {
//        [LWShowViewManager show]
        [anInvocation invokeWithTarget:manager];
    }
    
}

- (LWShowViewManager *)manager
{
    if (_manager == nil) {
        _manager = [[LWShowViewManager alloc] init];
    }
    return _manager;
}

@end
