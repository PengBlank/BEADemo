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
    [aCoder encodeObject:[NSNumber numberWithInt:(int)self.currentIndex] forKey:@"currentIndex"];
    [aCoder encodeObject:[NSNumber numberWithInt:(int)self.preIndex] forKey:@"preIndex"];
    
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
                _bankingImage = @"banking_table_mobile_banking";
                _bankingName = NSLocalizedString(@"MobileBanking_CP", @"");
                _bankingId = isMobileBanking;
                _currentIndex = index;
                _preIndex = index;
                break;
            case 1:
                _bankingImage = @"banking_table_supermegold";
                _bankingName = NSLocalizedString(@"SupremeGold_CP", @"");
                _bankingId = isSupermegold;
                _currentIndex = index;
                _preIndex = index;
                break;
            case 2:
                _bankingImage = @"banking_table_more_card";
                _bankingName = NSLocalizedString(@"CreditCatd_CP", @"");
                _bankingId = isCreditCatd;
                _currentIndex = index;
                _preIndex = index;
                break;
            case 3:
                _bankingImage = @"banking_table_consumer";
                _bankingName = NSLocalizedString(@"ConsumerLoans_CP", @"");
                _bankingId = isConsumerLoan;
                _currentIndex = index;
                _preIndex = index;
                break;
            case 4:
                _bankingImage = @"banking_table_property";
                _bankingName = NSLocalizedString(@"PropertyLoans_CP", @"");
                _bankingId = isPropertyLoans;
                _currentIndex = index;
                _preIndex = index;
                break;
            case 5:
                _bankingImage = @"banking_table_insurance";
                _bankingName = NSLocalizedString(@"Insurance_CP", @"");
                _bankingId =  isInsurance;
                _currentIndex = index;
                _preIndex = index;
                break;
            case 6:
                _bankingImage = @"banking_table_mpf";
                _bankingName = NSLocalizedString(@"MPF_CP", @"");
                _bankingId =  isMPF;
                _currentIndex = index;
                _preIndex = index;
                break;
            case 7:
                _bankingImage = @"banking_table_privileges";
                _bankingName = NSLocalizedString(@"Privileges_CP", @"");
                _bankingId = isPrivileges;
                _currentIndex = index;
                _preIndex = index;
                break;
            case 8:
                _bankingImage = @"banking_table_stocks";
                _bankingName = NSLocalizedString(@"P2P_CP", @"");
                _bankingId = isP2P;
                _currentIndex = index;
                _preIndex = index;
                break;
            case 9:
                _bankingImage = @"banking_table_atm_branch";
                _bankingName = NSLocalizedString(@"BranchAtm_CP", @"");
                _bankingId = isBranchAtm;
                _currentIndex = index;
                _preIndex = index;
                break;
            case 10:
                _bankingImage = @"banking_table_hotline";
                _bankingName = NSLocalizedString(@"Hotlines_CP", @"");
                _bankingId = isHotlines;
                _currentIndex = index;
                _preIndex = index;
                break;
            case 11:
                _bankingImage = @"banking_table_facebook";
                _bankingName = NSLocalizedString(@"FacebookPages_CP", @"");
                _bankingId = isFacebook;
                _currentIndex = index;
                _preIndex = index;
                break;
            default:
                break;
        }
        return  self;
    }
    return  nil;
}

@end
