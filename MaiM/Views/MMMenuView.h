//
//  MenuView.h
//  MaiM
//
//  Created by zhangqipu on 16/12/27.
//  Copyright © 2016年 zhangqipu. All rights reserved.
//

#import "MMBaseView.h"
#import "TabBarController.h"

@interface MMMenuView : MMBaseView <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, assign) TabBarController *tabBarController;

@end
