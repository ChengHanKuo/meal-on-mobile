//
//  MealOnMobileFifthViewController.m
//  MealOnMobile
//
//  Created by Howard Yao on 12/11/15.
//  Copyright (c) 2012年 Howard Yao. All rights reserved.
//

#import "MealOnMobileFifthViewController.h"
#import "MealOnMobileDataClass.h"

@interface MealOnMobileFifthViewController ()
@end

@implementation MealOnMobileFifthViewController
@synthesize listData= _listData;
@synthesize names= _names;
@synthesize keys= _keys;
@synthesize uniqueIdentifier= _uniqueIdentifier;
@synthesize detail= _detail;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //id appIdObject = [NSUUID UUID];
    //NSString *appIdString = [appIdObject UUIDString];
    //NSLog(@"%@",[MealOnMobileDataClass checkLocalInfo]);
    //NSString *uid= @"AppTest01"; // Here fetch the appID stored in coreData
    //NSString *uid= [MealOnMobileDataClass checkLocalInfo];
    //NSData *recordData= [MealOnMobileDataClass dataRequestToServer:uid :@"personalRecord"];
    NSData *dataReply= [MealOnMobileDataClass dataRequestToServer:@"all":@"getLocationAll"];
    NSDictionary *locationData= [NSJSONSerialization JSONObjectWithData:dataReply options:kNilOptions error:nil];
    //NSArray *recordList= [NSJSONSerialization JSONObjectWithData:recordData options:kNilOptions error:nil];
    self.keys= [[NSMutableArray alloc] init];
    self.listData= [[NSMutableArray alloc] init];
    self.detail= [[NSMutableArray alloc] init];
    
    id key, value;
    for (key in [locationData allKeys])
    {
        value = [locationData objectForKey:key];
        NSString *title= [value objectForKey:@"InfoName"];
        NSString *money= [value objectForKey:@"InfoMoney"];
        NSString *seat= [value objectForKey:@"InfoSeat"];
        NSString *address= [value objectForKey:@"InfoRoad"];
        NSString *detailMesage= [NSString stringWithFormat:@"價位:%@\n座位多寡:%@",money,seat];
        [self.listData addObject:title];
        [self.keys addObject:address];
        [self.detail addObject:detailMesage];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //return [self.keys count];
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.keys count];
    //NSString *key= [self.keys objectAtIndex:section];
    //NSArray *nameSection= [self.names objectForKey:key];
    //return [nameSection count];
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSUInteger row= [indexPath row];
    return indexPath;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row= [indexPath row];
    NSString *rowValue= [self.listData objectAtIndex:row];
    NSString *message= [self.detail objectAtIndex:row];
    
    UIAlertView *alert= [[UIAlertView alloc] initWithTitle:rowValue message:message delegate:self cancelButtonTitle:@"Yes" otherButtonTitles:nil];
    [alert show];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell==nil)
        cell= [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    
    NSUInteger row= [indexPath row];
    cell.textLabel.text= [self.listData objectAtIndex:row];
    cell.detailTextLabel.text= [self.keys objectAtIndex:row];

    
    return cell;
}

#pragma mark - Table view delegate


@end
