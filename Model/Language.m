//
//  Language.m
//  BEA_Demo
//
//  Created by Dict on 15/12/29.
//  Copyright © 2015年 Dict. All rights reserved.
//

#import "Language.h"


//#define NSLocalizedString(key,common) [[Language getInstance] localizedStringForKey:key andCommon:common]

static Language *language;
@implementation Language


+(id)getInstance{
    @synchronized(self) {
        if (!language) {
            language = [[Language alloc]init];
        }
    }
    return language;
}

-(NSString *)getCurrentLanguage{
    NSArray *languages = [NSLocale preferredLanguages];
    NSString *curruntLanguage = [languages objectAtIndex:0];
    return curruntLanguage;
}

//-(void)localizedStringForKey:(NSString *)key andCommon:(NSString *)common{
//     NSLocale
//}

@end
