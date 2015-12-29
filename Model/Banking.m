//
//  Banking.m
//  BEA_Demo
//
//  Created by Dict on 15/12/8.
//  Copyright © 2015年 Dict. All rights reserved.
//

#import "Banking.h"

@implementation Banking



-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.bankingName forKey:@"bankingName"];
    [aCoder encodeObject:self.bankingImage forKey:@"bankingImage"];
    [aCoder encodeInt:self.bankingId forKey:@"bankingId"];
    [aCoder encodeInt:self.preIndex forKey:@"preIndex"];
    [aCoder encodeInt:self.currentIndex forKey:@"currentIndex"];
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self.bankingName = [aDecoder decodeObjectForKey:@"bankingName"];
    self.bankingImage = [aDecoder decodeObjectForKey:@"bankingImage"];
    self.bankingId = [aDecoder decodeInt32ForKey:@"bankingId"];
    self.preIndex = [aDecoder decodeInt32ForKey:@"preIndex"];
    self.currentIndex = [aDecoder decodeInt32ForKey:@"currentIndex"];
    return self;
}

-(id)initBankWithIndex:(int)index{
    if ((self = [super init])) {
        switch (index) {
            case 0:
                self.bankingImage = @"banking_table_mobile_banking";
                self.bankingName = NSLocalizedString(@"MobileBanking_CP", @"");
                self.bankingId = isMobileBanking;
                break;
            case 1:
                _bankingImage = @"banking_table_supermegold";
                _bankingName = NSLocalizedString(@"SupremeGold_CP", @"");
                _bankingId = isSupermegold;
                break;
            case 2:
                _bankingImage = @"banking_table_more_card";
                _bankingName = NSLocalizedString(@"CreditCatd_CP", @"");
                _bankingId = isCreditCatd;
                break;
            case 3:
                _bankingImage = @"banking_table_consumer";
                _bankingName = NSLocalizedString(@"ConsumerLoans_CP", @"");
                _bankingId = isConsumerLoan;
                break;
            case 4:
                _bankingImage = @"banking_table_property";
                _bankingName = NSLocalizedString(@"PropertyLoans_CP", @"");
                _bankingId = isPropertyLoans;
                break;
            case 5:
                _bankingImage = @"banking_table_insurance";
                _bankingName = NSLocalizedString(@"Insurance_CP", @"");
                _bankingId =  isInsurance;
                break;
            case 6:
                _bankingImage = @"banking_table_mpf";
                _bankingName = NSLocalizedString(@"MPF_CP", @"");
                _bankingId =  isMPF;
                break;
            case 7:
                _bankingImage = @"banking_table_privileges";
                _bankingName = NSLocalizedString(@"Privileges_CP", @"");
                _bankingId = isPrivileges;
                break;
            case 8:
                _bankingImage = @"banking_table_stocks";
                _bankingName = NSLocalizedString(@"P2P_CP", @"");
                _bankingId = isP2P;
                break;
            case 9:
                _bankingImage = @"banking_table_atm_branch";
                _bankingName = NSLocalizedString(@"BranchAtm_CP", @"");
                _bankingId = isBranchAtm;
                break;
            case 10:
                _bankingImage = @"banking_table_hotline";
                _bankingName = NSLocalizedString(@"Hotlines_CP", @"");
                _bankingId = isHotlines;
                break;
            case 11:
                _bankingImage = @"banking_table_facebook";
                _bankingName = NSLocalizedString(@"FacebookPages_CP", @"");
                _bankingId = isFacebook;
                break;
            default:
                break;
            }
            self.currentIndex = index + 1;
            self.preIndex = index + 1;
        }
     return  self;
}

@end
