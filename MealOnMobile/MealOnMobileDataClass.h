//
//  MealOnMobileDataClass.h
//  MealOnMobile
//
//  Created by Howard Yao on 12/11/16.
//  Copyright (c) 2012年 Howard Yao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"
#import "FMDatabasePool.h"
#import "FMDatabaseQueue.h"
#import <CoreLocation/CoreLocation.h>

@interface MealOnMobileDataClass : NSObject

+ (id) dataRequestToServer: (NSString *) dataSend: (NSString *) requestType;
+ (id) dbQuery: (NSString *) query: (NSString *) type;
+ (BOOL)createDB;
+ (NSString *)checkLocalInfo;
+ (void)locationLocator: (CLLocationCoordinate2D) currentLocation: (NSString *)appId;
+ (NSString *)newUUID;

@end
