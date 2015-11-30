//
//  ViewController.m
//  BEA_Demo
//
//  Created by Dict on 15/11/18.
//  Copyright © 2015年 Dict. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setNeedsStatusBarAppearanceUpdate];
    self.beaNavigationBar = [NavigationBarViewController getInstance];
    self.pageControl = [PageControllerViewController getInstance];
    self.bankDashBoard = [BankDashBoardViewController getInstance];
    self.navigationController.navigationBar.hidden = YES;
    UIView *statusBarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,20)];
    
    [statusBarView setBackgroundColor:[UIColor blackColor]];
    
    [self.view addSubview:statusBarView];
 
    [self.view addSubview:_beaNavigationBar.view];
    [self.view addSubview:_pageControl.view];
    [self.view addSubview:_bankDashBoard.view];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewDidLayoutSubviews{
    self.beaNavigationBar.view.frame = CGRectMake(0, 20, self.view.frame.size.width, self.beaNavigationBar.view.frame.size.height);
    self.pageControl.view.frame = CGRectMake(0, 65, self.view.frame.size.width, self.pageControl.view.frame.size.height);
    self.bankDashBoard.view.frame = CGRectMake(0,110, self.view.frame.size.width, self.view.frame.size.height-110);
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    
    return UIStatusBarStyleLightContent;
    
}
@end
