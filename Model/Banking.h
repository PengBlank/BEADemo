//
//  Banking.h
//  BEA_Demo
//
//  Created by Dict on 15/12/8.
//  Copyright © 2015年 Dict. All rights reserved.
//

#import <Foundation/Foundation.h>

#define isMobileBanking 1
#define isSupermegold 2
#define isConsumerLoan 3
#define isPropertyLoans 4
#define isInsurance 5
#define isMPF 6
#define isStocks 7
#define isCreditCatd 8
#define isPrivileges 9
#define isBranchAtm 10
#define isHotlines 11
#define isFacebook 12
#define isP2P 13
#define isHotOfferDefault 14

@interface Banking : NSObject<NSCoding>

@property(nonatomic,strong)NSString *bankingName;
@property(nonatomic,strong)NSString *bankingImage;
@property(nonatomic,assign)int bankingId;
@property(nonatomic,assign)int currentIndex;
@property(nonatomic,assign)int preIndex;

-(id)initBankWithIndex:(int)index;

@end
