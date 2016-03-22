//
//  WebService.h
//  BEA_Demo
//
//  Created by Luca on 16/3/21.
//  Copyright © 2016年 Dict. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebService : NSObject

//-(void)getLifeStyleItemsSuccess:(^(void))success fail:(^(void))fail;

- (void)getLifeStyleCategoriesWithSuccess:(void (^)(NSMutableArray *))success
                                  failure:(void (^)(BOOL, NSInteger, NSString *))failure;

@end
