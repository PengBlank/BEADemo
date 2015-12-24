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
    
    sqlite3_exec(connection, [@"CREATE TABLE IF NOT EXISTS bankings (id INTEGER PRIMARY KEY,banking BLOB,current_index INTEGER,origin_index INTEGER);" UTF8String],nil,nil,nil);
    
    sqlite3_exec(connection, [@"CREATE TABLE IF NOT EXISTS lifestyle (id INTEGER PRIMARY KEY,lifestyle BLOB, lifestyle_id INTEGER);" UTF8String], nil, nil, nil);
    
}



-(void)initBanking:{
    
}





@end
