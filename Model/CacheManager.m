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



-(void)createConnection{
    sqlite3 *tempConnection = nil;
    if (sqlite3_open([_databasePath UTF8String], &tempConnection) == SQLITE_OK) {
        connection = tempConnection;
    }
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
    
    sqlite3_exec(connection, [@"CREATE TABLE IF NOT EXISTS bankings (id INTEGER PRIMARY KEY,banking BLOB,currentIndex INTEGER,originIndex INTEGER);" UTF8String],nil,nil,nil);
    
    sqlite3_exec(connection, [@"CREATE TABLE IF NOT EXISTS lifestyle (id INTEGER PRIMARY KEY,lifestyle BLOB, lifestyleId INTEGER);" UTF8String], nil, nil, nil);
    
}

//将banking存入数据库
-(void)cacheBanking:(Banking *)banking{
    [self createConnection];
    sqlite3_stmt *stmt;
    if (sqlite3_prepare_v2(connection, [@"insert into bankings(banking,currentIndex,originIndex) values(?,?,?)" UTF8String], -1, &stmt, nil) == SQLITE_OK) {
        NSData *bankingData = [NSKeyedArchiver archivedDataWithRootObject:banking];
        sqlite3_bind_blob(stmt, 1, [bankingData bytes], (int)[bankingData length] , nil);
        sqlite3_bind_int(stmt, 2, (int)banking.currentIndex);
        sqlite3_bind_int(stmt, 3, (int)banking.preIndex);
        if (sqlite3_step(stmt) == SQLITE_DONE) {
            
        }
    }
    
}





@end
