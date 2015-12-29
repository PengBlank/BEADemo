//
//  BankingMaster.h
//  BEA_Demo
//
//  Created by Dict on 15/12/8.
//  Copyright © 2015年 Dict. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BankingMaster : NSObject<NSCoding>

@property(nonatomic,strong)NSArray *bankingArray;
@property(nonatomic,strong)NSArray *orderArray;

@end
