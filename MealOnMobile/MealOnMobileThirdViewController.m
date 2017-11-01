//
//  MealOnMobileThirdViewController.m
//  MealOnMobile
//
//  Created by Howard Yao on 12/11/2.
//  Copyright (c) 2012年 Howard Yao. All rights reserved.
//

#import "MealOnMobileThirdViewController.h"
#import "MealOnMobileDataClass.h"
#define NSStringFromBOOL(boolValue) boolValue ? @"YES" : @"NO"

@interface MealOnMobileThirdViewController ()
@end

@implementation MealOnMobileThirdViewController
@synthesize name= _name;
@synthesize moneyRange= _moneyRange;
@synthesize seatRange= _seatRange;
@synthesize rice= _rice;
@synthesize noodle= _noodle;
@synthesize hotpot= _hotpot;
@synthesize dumpling= _dumpling;
@synthesize tel= _tel;
@synthesize locationData= _locationData;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    locationManager= [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.distanceFilter = 10;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    //background
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"recommend_background.png"] drawInRect:self.view.bounds];
    UIImage *tempimg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:tempimg];
}

- (IBAction)touchSensor:(id)sender
{
    [self.name resignFirstResponder];
    [self.tel resignFirstResponder];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *) oldLocation
{
    self.locationData= @{
    @"longitude":[NSString stringWithFormat:@"%f", newLocation.coordinate.longitude],
    @"latitude":[NSString stringWithFormat:@"%f", newLocation.coordinate.latitude],
    };
}

- (IBAction)locateButtomPressed:(id)sender
{
    [locationManager stopUpdatingLocation];
    [locationManager startUpdatingLocation];
}

-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != [actionSheet cancelButtonIndex])
    {
        NSString *dataType= @"addRestaurant";
        NSString *longitude= [self.locationData objectForKey:@"longitude"];
        NSString *latitude= [self.locationData objectForKey:@"latitude"];
        NSDictionary *type= [NSDictionary dictionaryWithObjectsAndKeys:NSStringFromBOOL(self.rice.on),@"riceType",
                             NSStringFromBOOL(self.noodle.on),@"noodleType",
                             NSStringFromBOOL(self.hotpot.on),@"hotpotType",
                             NSStringFromBOOL(self.dumpling.on),@"dumplingType",nil];
        NSDictionary *dataResult= [NSDictionary dictionaryWithObjectsAndKeys:
                                   type,@"type",
                                   self.name.text,@"name",
                                   [NSString stringWithFormat:@"%d",self.moneyRange.selectedSegmentIndex],@"moneyRange",
                                   [NSString stringWithFormat:@"%d",self.seatRange.selectedSegmentIndex],@"seatRange",
                                   self.tel.text,@"tel",
                                   longitude,@"longitude",
                                   latitude,@"latitude",nil];
        NSData *jsonData= [NSJSONSerialization dataWithJSONObject:dataResult options:NSJSONWritingPrettyPrinted error:nil];
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        [MealOnMobileDataClass dataRequestToServer:jsonString :dataType];
    }
}

- (IBAction)submitPressed:(id)sender
{
    UIActionSheet *actionSheet= [[UIActionSheet alloc] initWithTitle:@"確定送出?" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"送出" otherButtonTitles:nil];
    //[actionSheet showInView:self.view];
    [actionSheet showInView:self.parentViewController.view];
}

@end
