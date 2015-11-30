//
//  BankDashBoardViewController.h
//  BEA_Demo
//
//  Created by Dict on 15/11/26.
//  Copyright © 2015年 Dict. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BankDashBoardViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *connectionView;



@end
