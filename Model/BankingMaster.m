//
//  BankingMaster.m
//  BEA_Demo
//
//  Created by Dict on 15/12/8.
//  Copyright © 2015年 Dict. All rights reserved.
//

#import "BankingMaster.h"

@implementation BankingMaster

-(instancetype)init{
    self = [super init];
    if (self) {
        self.bankingArray = [[NSArray alloc]init];
    }
    return self;
}

@end
