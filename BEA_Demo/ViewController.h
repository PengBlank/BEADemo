//
//  ViewController.h
//  BEA_Demo
//
//  Created by Dict on 15/11/18.
//  Copyright © 2015年 Dict. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationBarViewController.h"
#import "PageControllerViewController.h"
#import "BankDashBoardViewController.h"

@interface ViewController : UIViewController

@property(nonatomic,strong) NavigationBarViewController *beaNavigationBar;
@property(nonatomic,strong) PageControllerViewController *pageControl;
@property(nonatomic,strong) BankDashBoardViewController *bankDashBoard;

@end

