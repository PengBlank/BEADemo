//
//  CacheManager.h
//  BEA_Demo
//
//  Created by Dict on 15/12/8.
//  Copyright © 2015年 Dict. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>


@interface CacheManager : NSObject{
    sqlite3 *connection;
}


@property(nonatomic,strong) NSString *databasePath;
//@property(nonatomic,strong) NSString *databaseName;


-(void)initDataBase;
-(void)initData:(sqlite3 *)database;
@end
