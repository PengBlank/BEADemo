//
//  WebService.m
//  BEA_Demo
//
//  Created by Luca on 16/3/21.
//  Copyright © 2016年 Dict. All rights reserved.
//

#import "WebService.h"
#import <AFNetworking.h>
#import <XMLDictionary.h>

@implementation WebService

-(void)getLifeStyleCategoriesWithSuccess:(void (^)(NSMutableArray *))success failure:(void (^)(BOOL, NSInteger, NSString *))failure{
    
    NSString *urlString = @"http://hkbea.mtel.ws/java/bea/lifestyle/getcategory.api";
  //  NSURL *urlForCategories = [[NSURL alloc]initWithString:urlString];
   // NSURLRequest *requstForItem = [[NSURLRequest alloc]initWithURL:urlForCategories];
    NSDictionary *params = @{@"lang":@"en"};
//    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithBaseURL:nil];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    
    [manager POST:urlString parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *requestData =[NSDictionary dictionaryWithXMLParser:responseObject];
        NSLog(@"%@",requestData);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error!!!");
    }];
}

@end
