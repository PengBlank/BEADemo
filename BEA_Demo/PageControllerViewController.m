//
//  PageControllerViewController.m
//  BEA_Demo
//
//  Created by Dict on 15/11/20.
//  Copyright © 2015年 Dict. All rights reserved.
//

#import "PageControllerViewController.h"

@interface PageControllerViewController ()

@end

static PageControllerViewController *pageControl = nil;

@implementation PageControllerViewController

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
        if (!pageControl) {
            pageControl = [[self alloc]initWithNibName:@"PageControllerViewController" bundle:[NSBundle mainBundle]];
        }
        return  pageControl;
    }
    
}
//- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
//    
//}
//
//-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
//    
//}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
