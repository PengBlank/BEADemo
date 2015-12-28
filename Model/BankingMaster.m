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
    if (self = [super init]) {
        self.bankingArray = [[NSArray alloc]init];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:_bankingArray forKey:@"bankingArray"];
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self.bankingArray = [aDecoder decodeObjectForKey:@"bankingArray"];
    return  self;
}

@end
