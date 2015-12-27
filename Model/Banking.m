//
//  Banking.m
//  BEA_Demo
//
//  Created by Dict on 15/12/8.
//  Copyright © 2015年 Dict. All rights reserved.
//

#import "Banking.h"

@implementation Banking

@synthesize bankingImage,bankingName,bankingId;



-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.bankingName forKey:@"bankingName"];
    [aCoder encodeObject:self.bankingImage forKey:@"bankingImage"];
    [aCoder encodeObject:[NSNumber numberWithInt:self.currentIndex] forKey:@"currentIndex"];
    [aCoder encodeObject:[NSNumber numberWithInt:self.preIndex] forKey:@"preIndex"];
    
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self.preIndex = [aDecoder decodeIntForKey:@"preIndex"];
    self.currentIndex = [aDecoder decodeIntForKey:@"currentIndex"];
    self.bankingImage = [aDecoder decodeObjectForKey:@"bankingImage"];
    self.bankingName = [aDecoder decodeObjectForKey:@"bankingName"];
    return self;
}

-(id)initBankWithIndex:(NSUInteger)index{
    if ((self = [super init])) {
        switch (index) {
            case 0:
                bankingImage = @"banking_table_mobile_banking";
                bankingName = NSLocalizedString(@"MobileBanking_CP", @"");
                bankingId = isMobileBanking;
                break;
            case 1:
                bankingImage = @"banking_table_supermegold";
                bankingName = NSLocalizedString(@"SupremeGold_CP", @"");
                bankingId = isSupermegold;
                break;
            case 2:
                bankingImage = @"banking_table_more_card";
                bankingName = NSLocalizedString(@"CreditCatd_CP", @"");
                bankingId = isCreditCatd;
                break;
            case 3:
                bankingImage = @"banking_table_consumer";
                bankingName = NSLocalizedString(@"ConsumerLoans_CP", @"");
                bankingId = isConsumerLoan;
                break;
            case 4:
                bankingImage = @"banking_table_property";
                bankingName = NSLocalizedString(@"PropertyLoans_CP", @"");
                bankingId = isPropertyLoans;
                break;
            case 5:
                bankingImage = @"banking_table_insurance";
                bankingName = NSLocalizedString(@"Insurance_CP", @"");
                bankingId =  isInsurance;
                break;
            case 6:
                bankingImage = @"banking_table_mpf";
                bankingName = NSLocalizedString(@"MPF_CP", @"");
                bankingId =  isMPF;
                break;
            case 7:
                bankingImage = @"banking_table_privileges";
                bankingName = NSLocalizedString(@"Privileges_CP", @"");
                bankingId = isPrivileges;
                break;
            case 8:
                bankingImage = @"banking_table_stocks";
                bankingName = NSLocalizedString(@"P2P_CP", @"");
                bankingId = isP2P;
                break;
            case 9:
                bankingImage = @"banking_table_atm_branch";
                bankingName = NSLocalizedString(@"BranchAtm_CP", @"");
                bankingId = isBranchAtm;
                break;
            case 10:
                bankingImage = @"banking_table_hotline";
                bankingName = NSLocalizedString(@"Hotlines_CP", @"");
                bankingId = isHotlines;
                break;
            case 11:
                bankingImage = @"banking_table_facebook";
                bankingName = NSLocalizedString(@"FacebookPages_CP", @"");
                bankingId = isFacebook;
                break;
            default:
                break;
        }
        return  self;
    }
    return  nil;
}

@end
