//
//  CacheManager.m
//  BEA_Demo
//
//  Created by Dict on 15/12/8.
//  Copyright © 2015年 Dict. All rights reserved.
//

#import "CacheManager.h"
#import <sqlite3.h>


@implementation CacheManager

@synthesize connection;

static CacheManager *cacheManager = nil;

+(id)getInstance{
    @synchronized(self) {
        if (!cacheManager) {
            cacheManager = [[CacheManager alloc]init];
        }
    }
    return cacheManager;
}



-(void)createConnection{
    sqlite3 *tempConnection = nil;
    if (sqlite3_open([_databasePath UTF8String], &tempConnection) == SQLITE_OK) {
        connection = tempConnection;
    }
}


-(void)closeDB{
    sqlite3_close_v2(connection);
}


-(void)initDataBase:(NSString *)databaseName{
    NSArray *documentsPathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [documentsPathArray objectAtIndex:0];
    _databasePath = [cachePath stringByAppendingPathComponent:databaseName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (! [fileManager fileExistsAtPath:_databasePath]) {
        NSString *resourcePath = [[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:databaseName];
        [fileManager copyItemAtPath:resourcePath toPath:_databasePath error:nil];
     }
    
    [self createConnection];
    
    sqlite3_exec(connection, [@"CREATE TABLE IF NOT EXISTS bankingMaster (id INTEGER PRIMARY KEY,bankingMaster BLOB);" UTF8String],nil,nil,nil);
    
    sqlite3_exec(connection, [@"CREATE TABLE IF NOT EXISTS bankings (id INTEGER PRIMARY KEY,banking BLOB,currentIndex INTEGER,originIndex INTEGER);" UTF8String],nil,nil,nil);
    
    sqlite3_exec(connection, [@"CREATE TABLE IF NOT EXISTS lifestyle (id INTEGER PRIMARY KEY,lifestyle BLOB, lifestyleId INTEGER);" UTF8String], nil, nil, nil);

}

//将banking存入数据库
-(void)cacheBanking:(Banking *)banking{
    sqlite3_stmt *stmt;
    if (sqlite3_prepare_v2(connection, [@"insert into bankings(banking,currentIndex,originIndex) values(?,?,?)" UTF8String], -1, &stmt, nil) == SQLITE_OK) {
        NSData *bankingData = [NSKeyedArchiver archivedDataWithRootObject:banking];
        sqlite3_bind_blob(stmt, 1, [bankingData bytes], (int)[bankingData length] , nil);
        sqlite3_bind_int(stmt, 2, (int)banking.currentIndex);
        sqlite3_bind_int(stmt, 3, (int)banking.preIndex);
        if (sqlite3_step(stmt) != SQLITE_DONE) {
            NSLog(@"failed to cache banking, error is %s",sqlite3_errmsg(connection));
            return;
        }
    }else{
        NSLog(@"failed to cache banking, error is %s",sqlite3_errmsg(connection));
        return;
    }
    sqlite3_finalize(stmt);
}


-(void)cacheBankingMaster:(BankingMaster *)master{
    sqlite3_stmt *stmt = nil;
    NSString *sql = @"insert into bankingMaster (bankingMaster) values(?)";
    
    if (sqlite3_prepare_v2(connection, [sql UTF8String], -1, &stmt, nil) == SQLITE_OK) {
        NSData *masterData = [NSKeyedArchiver archivedDataWithRootObject:master];
        sqlite3_bind_blob(stmt, 1, [masterData bytes], (int)[masterData length], nil);
        if (sqlite3_step(stmt) != SQLITE_DONE) {
            NSLog(@"Cache bankingMaster has error, error is %s",sqlite3_errmsg(connection));
            return;
        }
    } else {
        NSLog(@"Cache bankingMaster has error, error is %s",sqlite3_errmsg(connection));
        return;
    }
    sqlite3_finalize(stmt);
}

-(BankingMaster *)getBankingMaster{
    BankingMaster *master = nil;
    sqlite3_stmt *stmt;
    NSString *sql = @"select id, bankingMaster from bankingMaster order by id desc";
    if(sqlite3_prepare_v2(connection, [sql UTF8String], -1, &stmt, nil) == SQLITE_OK){
        if(sqlite3_step(stmt) == SQLITE_ROW){
            int tempId = sqlite3_column_int(stmt, 0);
            NSLog(@"Banking Master id is %d",tempId);
            const void *tempValue = sqlite3_column_blob(stmt, 1);
            int tempValueSize = sqlite3_column_bytes(stmt, 1);
            NSData *masterData = [NSData dataWithBytes:tempValue length:tempValueSize];
            master = [NSKeyedUnarchiver unarchiveObjectWithData:masterData];
        };
    }else{
        NSLog(@"Failed to get Banking Master, error message is %s",sqlite3_errmsg(connection));
        return nil;
    }
    return master;
}


@end
