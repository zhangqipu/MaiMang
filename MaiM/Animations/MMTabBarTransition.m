//
//  TabBarTransition.m
//  MaiM
//
//  Created by zhangqipu on 16/12/27.
//  Copyright © 2016年 zhangqipu. All rights reserved.
//

#import "MMTabBarTransition.h"
#import "Common.h"

@implementation MMTabBarTransition

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *fromView = fromController.view;
    UIView *toView = toController.view;
    [[transitionContext containerView] addSubview:toView];

    fromView.alpha = 0;
    toView.frame = CGRectMake(CGRectGetWidth(toView.bounds) - TabViewHiddingOutSideWidth, 0, CGRectGetWidth(toView.bounds), CGRectGetHeight(toView.bounds));
    [UIView animateWithDuration:0.5 animations:^{
        toView.frame = CGRectMake(0, 0, CGRectGetWidth(toView.bounds), CGRectGetHeight(toView.bounds));
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
        fromView.alpha = 1;
    }];

    QPLog(fromController);
    QPLog(toController);
}

@end
