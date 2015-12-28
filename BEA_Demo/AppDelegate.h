//
//  AppDelegate.h
//  BEA_Demo
//
//  Created by Dict on 15/11/18.
//  Copyright © 2015年 Dict. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CacheManager.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) CacheManager *cacheManager;

@end

