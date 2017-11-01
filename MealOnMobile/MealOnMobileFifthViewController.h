//
//  MealOnMobileFifthViewController.h
//  MealOnMobile
//
//  Created by Howard Yao on 12/11/15.
//  Copyright (c) 2012年 Howard Yao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MealOnMobileFifthViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) NSMutableArray *listData;
@property (strong, nonatomic) NSMutableDictionary *names;
@property (strong, nonatomic) NSMutableArray *keys;
@property (strong, nonatomic) NSMutableArray *detail;
@property (nonatomic, readonly, retain) NSString *uniqueIdentifier;
@end
