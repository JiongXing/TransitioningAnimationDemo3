# TransitioningAnimationDemo3
参考文章《iOS自定义转场动画实战讲解》[传送门](http://www.jianshu.com/p/ea0132738057)
好吧，转场动画的水有点深，想达到灵活自如运用的境界还是要花上一些时间的。
# Custom动画
Custom模式可以改变presentedViewController的基视图大小，只支持iOS8以上。
依据苹果官方的转场动画Demo，大概讲讲思路。

首先是指定转场动画为Custom：
```objc
presentedViewController.modalPresentationStyle = UIModalPresentationCustom;
```
苹果提供了一个类`UIPresentationController`，它定义了转场动画的生命周期方法，我们创建它的子类`MyPresentationController`以重写这些方法。
同时这个子类也可以承担动画代理的作用，即实现`<UIViewControllerTransitioningDelegate>`协议：
```objc
@interface MyPresentationController : UIPresentationController <UIViewControllerTransitioningDelegate>
```
重写有四个重要的生命周期方法，分别是present开始、完成，dismiss开始、完成：
```objc
- (void)presentationTransitionWillBegin;
- (void)presentationTransitionDidEnd:(BOOL)completed;
- (void)dismissalTransitionWillBegin;
- (void)dismissalTransitionDidEnd:(BOOL)completed;
```
还有一个很重要的功能，计算并返回视图大小，重写以下方法：
```objc
- (CGRect)frameOfPresentedViewInContainerView;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id <UIContentContainer>)container NS_AVAILABLE_IOS(8_0);
- (CGSize)sizeForChildContentContainer:(id <UIContentContainer>)container withParentContainerSize:(CGSize)parentSize NS_AVAILABLE_IOS(8_0);
```
然后就是与其它一般转场动画那样，实现协议方法：
```objc
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext;
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext;
```
![TransitioningAnimationDemo3](https://github.com/JiongXing/TransitioningAnimationDemo3/raw/master/screenshots/TransitioningAnimationDemo3.gif)
