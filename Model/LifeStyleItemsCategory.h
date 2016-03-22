//
//  Category.h
//  BEA_Demo
//
//  Created by Luca on 16/3/21.
//  Copyright © 2016年 Dict. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LifeStyleItemsCategory : NSObject

@property(nonatomic, assign) NSUInteger itemId;
@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSURL *iconNormalURL;
@property(nonatomic, strong) NSURL *iconSelectedURL;
@property(nonatomic, strong) NSURL *iconAccessibilityURL;
@property(nonatomic, strong) UIColor *color1;
@property(nonatomic, strong) UIColor *color2;

+(instancetype)initWithDictionary:(NSDictionary *)categories;

@end
