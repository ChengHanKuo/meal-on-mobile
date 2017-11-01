//
//  MealOnMobileDataClass.m
//  MealOnMobile
//
//  Created by Howard Yao on 12/11/16.
//  Copyright (c) 2012年 Howard Yao. All rights reserved.
//

#import "MealOnMobileDataClass.h"

@interface MealOnMobileDataClass ()
@end
@implementation MealOnMobileDataClass

+ (id) dataRequestToServer:(NSString *) dataRequest: (NSString *)requestType
{
    NSString *url= @"http://140.127.220.48/webApplication/mealOnMobile/dataInterface.php";
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    NSURL *connection = [[NSURL alloc] initWithString:url];
    NSString *httpBodyString=[NSString stringWithFormat:@"data=%@&requestType=%@",dataRequest,requestType];
    [request setURL:connection];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[httpBodyString dataUsingEncoding:NSUTF8StringEncoding]];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *result= [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@",result);
    //return result;
    return data;

}

+ (BOOL)createDB
{
    NSArray *path= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory= [path objectAtIndex:0];
    NSString *dbPath= [documentDirectory stringByAppendingPathComponent:@"localData.db"];
    NSString *string;
    FMDatabase *db= [FMDatabase databaseWithPath:dbPath];
    string= dbPath;
    if (![db open])
    {
        NSLog(@"DB open failed");
        return NO;
    }
    
    else
    {
        NSLog(@"Open DB OK!");
        return YES;
    }
    [db close];
}

+ (BOOL)createTable
{
    NSArray *path= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory= [path objectAtIndex:0];
    NSString *dbPath= [documentDirectory stringByAppendingPathComponent:@"localData.db"];
    NSString *string;
    FMDatabase *db= [FMDatabase databaseWithPath:dbPath];
    string= dbPath;
    [db open];
    [db executeUpdate:@"create table userInfo(appUid varchar(50), email varchar(128), PRIMARY KEY(appUid));"];
    [db executeUpdate:@"create table storeInfo(InfoNo varchar(50), InfoName varchar(10), PRIMARY KEY(InfoNo));"];
    [db executeUpdate:@"create table userRecord(appUid varchar(50), InfoNo varchar(10), time timestamp, PRIMARY KEY(appUid,InfoNo));"];
    NSLog(@"Create table OK!");
    [db close];
    return YES;
}

+ (id)dbQuery:(NSString *)query: (NSString *) type
{
    NSArray *path= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory= [path objectAtIndex:0];
    NSString *dbPath= [documentDirectory stringByAppendingPathComponent:@"localData.db"];
    FMDatabase *db= [FMDatabase databaseWithPath:dbPath];
    [db open];
    NSString *check= @"select name from sqlite_master where type='table' and name='userInfo'";
    FMResultSet *result= [db executeQuery:check];
    [result next];
    if ([result stringForColumn:@"name"]==nil)
        [self createTable];
    
    if (type==@"write")
    {
        [db beginTransaction];
        [db executeUpdate:query];
        [db commit];
        return @"true";
    }
    else if (type==@"read")
    {
        FMResultSet *result= [db executeQuery:query];
        return result;
    }
    return @"false";
}

+ (NSString *)newUUID
{
    CFUUIDRef theUUID = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, theUUID);
    CFRelease(theUUID);
    return (__bridge_transfer NSString *)string;
}

+ (NSString *)checkLocalInfo
{
    NSString *appIdString = [MealOnMobileDataClass newUUID];
    FMResultSet *rs= [MealOnMobileDataClass dbQuery:@"select appUid from userInfo" :@"read"];
    [rs next];
    if ([rs stringForColumn:@"appUid"]==nil)
    {
        NSString *query=[NSString stringWithFormat:@"insert into userInfo values('%@','');",appIdString];
        [MealOnMobileDataClass dbQuery:query :@"write"];
        [MealOnMobileDataClass dataRequestToServer:appIdString :@"userCheck"];
        return appIdString;
    }
    else
        return [rs stringForColumn:@"appUid"];
}

+ (void)locationLocator: (CLLocationCoordinate2D) currentLocation: (NSString *)appId
{
    NSData *dataReply= [MealOnMobileDataClass dataRequestToServer:@"all":@"getLocationAll"];
    NSDictionary *locationData= [NSJSONSerialization JSONObjectWithData:dataReply options:kNilOptions error:nil];
    CLLocationCoordinate2D storeLocation;
    //storeLocation.latitude=22.6178800; storeLocation.longitude=120.3137630;
    CLLocation *current = [[CLLocation alloc] initWithCoordinate: currentLocation altitude:1 horizontalAccuracy:1 verticalAccuracy:-1 timestamp:nil];
    CLLocationDistance dist;
    id key, value;
    for (key in [locationData allKeys])
    {
        value = [locationData objectForKey:key];
        storeLocation.latitude= [[value objectForKey:@"latitude"] doubleValue];
        storeLocation.longitude= [[value objectForKey:@"longitude"] doubleValue];
        CLLocation *store= [[CLLocation alloc] initWithCoordinate: storeLocation altitude:1 horizontalAccuracy:1 verticalAccuracy:-1 timestamp:nil];
        dist= [current distanceFromLocation:store];
        if (dist<=50.0)
        {
            // 只要計算出與店家與現在的距離在50m內，就認定你到這家店
            NSLog(@"%@",[value objectForKey:@"InfoName"]);
            NSString *query=[NSString stringWithFormat:@"insert into userInfo values('%@','');",appId];
            [MealOnMobileDataClass dbQuery:query :@"write"];
        }
        
    }
}

@end
