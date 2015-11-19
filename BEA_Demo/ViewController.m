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
    
    self.beaNavigationBar = [NavigationBarViewController getInstance];
    self.navigationController.navigationBar.hidden = YES;
    [self.view addSubview:_beaNavigationBar.view];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewDidLayoutSubviews{
     self.beaNavigationBar.view.frame = CGRectMake(0, 0, self.view.frame.size.width, 45);
}
@end
