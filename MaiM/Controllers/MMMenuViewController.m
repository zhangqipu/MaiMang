//
//  MenuViewController.m
//  MaiM
//
//  Created by zhangqipu on 16/12/28.
//  Copyright © 2016年 zhangqipu. All rights reserved.
//

#import "MMMenuViewController.h"
#import "Common.h"
#import "MMMenuView.h"

@implementation MMMenuViewController

#pragma mark - LiftCycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *menuBtn = [UIButton new];
    menuBtn.frame = CGRectMake(0, 0, 44, 44);
    [menuBtn setTitle:@"菜单" forState:UIControlStateNormal];
    [menuBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [menuBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [menuBtn addTarget:self action:@selector(menuItemAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.navigationBar addSubview:menuBtn];
}

#pragma mark - Events

- (void)menuItemAction
{
    // 将当前tab view 推至屏幕右侧
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    
    CGRect tabViewFrame = self.tabBarController.view.frame;
    if (CGRectGetMinX(tabViewFrame) > 0)
    {
        self.tabBarController.view.frame  =
        CGRectMake(0,
                   0,
                   CGRectGetWidth(tabViewFrame),
                   CGRectGetHeight(tabViewFrame));
    }
    else
    {
        self.tabBarController.view.frame =
        CGRectMake(CGRectGetWidth(tabViewFrame) - TabViewHiddingOutSideWidth,
                   0,
                   CGRectGetWidth(tabViewFrame),
                   CGRectGetHeight(tabViewFrame));
    }
    
    [UIView commitAnimations];
}

@end
