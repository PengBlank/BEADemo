//
//  Language.h
//  BEA_Demo
//
//  Created by Dict on 15/12/29.
//  Copyright © 2015年 Dict. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Language : NSObject



+(id)getInstance;

-(NSString *)getCurrentLanguage;


//-(void)localizedStringForKey:(NSString *)key andCommon:(NSString *)common;

@end
