//
//  CacheManager.h
//  BEA_Demo
//
//  Created by Dict on 15/12/8.
//  Copyright © 2015年 Dict. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Banking.h"
#import "BankingMaster.h"



@interface CacheManager : NSObject


@property(nonatomic,assign) sqlite3 *connection;
@property(nonatomic,strong) NSString *databasePath;
//@property(nonatomic,strong) NSString *databaseName;

+(id)getInstance;
-(void)initDataBase:(NSString *)databaseName;
-(void)closeDB;
-(void)cacheBanking:(Banking *)banking;
-(void)cacheBankingMaster:(BankingMaster *)master;
-(BankingMaster *)getBankingMaster;



@end
