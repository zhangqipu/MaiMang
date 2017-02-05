//
//  MenuView.m
//  MaiM
//
//  Created by zhangqipu on 16/12/27.
//  Copyright © 2016年 zhangqipu. All rights reserved.
//

/**
 每次选中时候重置控制器的顺序
 
 如果点击了index5，将5的控制器与4做替换
 将选中动作设置为选中4
 
 如果点击了index6，将6的控制器与4做替换
 将选中动作设置为选中4
 */


#import "MMMenuView.h"
#import "Constants.h"

@interface MMMenuView ()
{
    NSUInteger index1;
    NSUInteger index2;
}
@end

@implementation MMMenuView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.backgroundColor = [UIColor clearColor];
    }
    
    cell.textLabel.text = @"MaiM";
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 重置tab controller 顺序
    [self setRightViewControllersOrder];
    
    switch (indexPath.row) {

        case 0:
        case 1:
        case 2:
        case 3: {
            [self.tabBarController setSelectedIndex:indexPath.row];
            break;
        }
        case 4: {
            [self echangeViewControllerOrder:3 withAnother:4];
            [self.tabBarController setSelectedIndex:3];
            break;
        }
        case 5: {
            [self echangeViewControllerOrder:3 withAnother:5];
            [self.tabBarController setSelectedIndex:3];
            break;
        }
    }
    
    [self tabViewXBackToZero];
}

- (void)tabViewXBackToZero {
    UIView *tabView = self.tabBarController.view;

    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    
    tabView.frame = CGRectMake(0, 0, CGRectGetWidth(tabView.bounds),CGRectGetHeight(tabView.bounds));
    
    [UIView commitAnimations];

}

- (void)setRightViewControllersOrder {
    if (index1 > 0 && index2 > 0) {
        [self echangeViewControllerOrder:index1 withAnother:index2];
        index1 = 0; index2 = 0;
    }
}

- (void)echangeViewControllerOrder:(NSUInteger)index withAnother:(NSUInteger)anotherIndex {
    NSMutableArray *viewControllers = [NSMutableArray arrayWithArray:self.tabBarController.viewControllers];
    [viewControllers exchangeObjectAtIndex:index withObjectAtIndex:anotherIndex];
    [self.tabBarController setViewControllers:viewControllers];
    
    index1 = index;
    index2 = anotherIndex;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
