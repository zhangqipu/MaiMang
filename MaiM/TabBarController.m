//
//  TabBarController.m
//  MaiM
//
//  Created by zhangqipu on 16/12/27.
//  Copyright © 2016年 zhangqipu. All rights reserved.
//

#import "TabBarController.h"
#import "Common.h"

#import "MMTabBarTransition.h"
#import "MMMenuView.h"

@interface TabBarController ()

@property (nonatomic, strong) MMTabBarTransition *tabBarTransition;

@end

@implementation TabBarController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    MMMenuView *menuView = [[[NSBundle mainBundle] loadNibNamed:@"MenuView" owner:nil options:nil] firstObject];
    menuView.tabBarController = self;
    UIWindow *wnd = [[UIApplication sharedApplication] windows][0];
    [wnd addSubview:menuView];
    
    [menuView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [wnd addConstraint:[NSLayoutConstraint constraintWithItem:menuView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:wnd attribute:NSLayoutAttributeWidth multiplier:1 constant:0]];
    [wnd addConstraint:[NSLayoutConstraint constraintWithItem:menuView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:wnd attribute:NSLayoutAttributeHeight multiplier:1 constant:0]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
