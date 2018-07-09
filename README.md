# LWShowView



这个类适用于 外部不需要持有当前要弹出弹窗
注意: 这里通过在内部创建子类对象的方式 对于一些与控制器逻辑关系不多的情况 可以直接通过类方法展示
      
在添加到外部传入的view或者viewController或者默认添加到window时默认都是和父类的frame一样大 因此如果弹窗比较小 子类需要添加一个蒙版来控制显示区域的大小
      
每个方法都有一个对应的返回被创建子类的方法,这里是因为某些情况下 需要在控制器里根据业务逻辑 需要展示不同的view样式
      
如果 外部的控制器需要引用这个被创建的子类 那么也可以对在block中返回的参数进行引用



import <UIKit/UIKit.h>


@interface LWShowView : UIView 

```objc
/**
 直接展示子类的view 默认在keyWindow上展示 默认frame为整个屏幕大小 被展示的子类的frame自行在子类设置布局
 */
+ (void)show;

```

```objc
/**
 直接展示子类 默认在keyWindow上展示 默认frame为整个屏幕大小

 @param aCompletion 返回被创建的子类 这里可以通过返回的子类去做一些基本的设置
 */
+ (void)show:(void (^)(UIView * showView))aCompletion;
```


```objc
/**
 在 某个view上展示 子类的view

 @param aView 子类view要展示在哪个view上
 */
+ (void)showInView:(UIView *)aView;
```

```objc
/**
 在某个view上展示子类的view

 @param aView 在哪个view上展示子类View
 @param aCompletion 通过block返回被创建的子类view
 */
+ (void)showInView:(UIView *)aView completion:(void (^)(UIView * showView))aCompletion;
```

```objc
/**
 在某个控制器上添加子类view 默认添加在控制器的view上 大小为控制器大小的frame

 @param aViewController 要展示到哪个控制器上
 */
+ (void)showInViewController:(UIViewController *)aViewController;
```

```objc
/**
 在某个控制器上添加子类view 默认添加在控制器的view上 大小为控制器大小的frame

 @param aViewController 要展示在哪个控制器上
 @param aCompletion 展示完成之后返回被创建的子类view
 */
+ (void)showInViewController:(UIViewController *)aViewController completion:(void (^)(UIView * showView))aCompletion;

```

```objc
/**
 将弹窗view移除
 */
+ (void)dismiss;
```


