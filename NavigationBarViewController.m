//
//  NavigationBarViewController.m
//  BEA_Demo
//
//  Created by Dict on 15/11/19.
//  Copyright © 2015年 Dict. All rights reserved.
//

#import "NavigationBarViewController.h"

@interface NavigationBarViewController ()

@end

static  NavigationBarViewController *beaNavigationBar = nil;

@implementation NavigationBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+(id)getInstance{

    @synchronized(self) {
        if (!beaNavigationBar) {
            beaNavigationBar = [[NavigationBarViewController alloc]initWithNibName:@"NavigationBarViewController" bundle:[NSBundle mainBundle]];
        }
    }
    return  beaNavigationBar;
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
