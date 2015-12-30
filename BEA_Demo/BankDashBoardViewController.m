//
//  BankDashBoardViewController.m
//  BEA_Demo
//
//  Created by Dict on 15/11/26.
//  Copyright © 2015年 Dict. All rights reserved.
//

#import "BankDashBoardViewController.h"

@interface BankDashBoardViewController ()

@property(nonatomic, strong)NSArray *bankingForCollectionArray;
@property(nonatomic, strong)CacheManager *cacheManager;
@property(nonatomic, strong)BankingMaster *master;

@end

static  BankDashBoardViewController *bankDashBoard = nil;

@implementation BankDashBoardViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.collectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cellID"];
    
    
    
    _cacheManager = [CacheManager getInstance];
    _master = [_cacheManager getBankingMaster];
    self.bankingForCollectionArray = _master.bankingArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


+(BankDashBoardViewController *)getInstance{
    if (!bankDashBoard) {
        bankDashBoard = [[BankDashBoardViewController alloc]initWithNibName:@"BankDashBoardViewController" bundle:nil];
    }
    return bankDashBoard;

}

#pragma mark: Collection View  DataSource

-(CollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    Banking *banking =[self.bankingForCollectionArray objectAtIndex:indexPath.row];
    
 
    
    [cell.cellImageView setImage:[UIImage imageNamed: [NSString  stringWithFormat:@"%@_gird" ,banking.bankingImage]]];

//    [cell.cellLabel setTextColor:[UIColor  alpha:1]] ;

    [cell.cellLabel setText:banking.bankingName];
    
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 12;
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"widthis %f",collectionView.frame.size.width);
    return CGSizeMake((collectionView.frame.size.width  )/ 3, 125);
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
