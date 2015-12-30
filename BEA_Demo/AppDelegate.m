//
//  AppDelegate.m
//  BEA_Demo
//
//  Created by Dict on 15/11/18.
//  Copyright © 2015年 Dict. All rights reserved.
//

#import "AppDelegate.h"
#import "Banking.h"
#import "BankingMaster.h"
#import "CacheManager.h"
#import "Language.h"

@interface AppDelegate ()

@end

@implementation AppDelegate




-(void)createAllBanking{
    BankingMaster *master = [[BankingMaster alloc]init];
    NSMutableArray *bankings = [[NSMutableArray alloc]init];
    [bankings addObject:[[Banking alloc]initBankWithIndex:0]];
    [bankings addObject:[[Banking alloc]initBankWithIndex:1]];
    [bankings addObject:[[Banking alloc]initBankWithIndex:2]];
    [bankings addObject:[[Banking alloc]initBankWithIndex:3]];
    [bankings addObject:[[Banking alloc]initBankWithIndex:4]];
    [bankings addObject:[[Banking alloc]initBankWithIndex:5]];
    [bankings addObject:[[Banking alloc]initBankWithIndex:6]];
    [bankings addObject:[[Banking alloc]initBankWithIndex:7]];
    [bankings addObject:[[Banking alloc]initBankWithIndex:8]];
    [bankings addObject:[[Banking alloc]initBankWithIndex:9]];
    [bankings addObject:[[Banking alloc]initBankWithIndex:10]];
    [bankings addObject:[[Banking alloc]initBankWithIndex:11]];
    master.bankingArray = bankings;
    self.cacheManager = [CacheManager getInstance];//remember to assign a value!!!
    [self.cacheManager initDataBase:@"BEA"];
    [self.cacheManager cacheBankingMaster:master];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
 
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    [self createAllBanking];
    
    Language *language = [Language getInstance];
    NSString *currentLan = [language getCurrentLanguage];
    NSLog(@"Current Lan is %@",currentLan);
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [self.cacheManager closeDB];
}

@end
