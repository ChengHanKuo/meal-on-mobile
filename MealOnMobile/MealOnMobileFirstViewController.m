//
//  MealOnMobileFirstViewController.m
//  MealOnMobile
//
//  Created by Howard Yao on 12/11/2.
//  Copyright (c) 2012年 Howard Yao. All rights reserved.
//

#import "MealOnMobileFirstViewController.h"
#import "MealOnMobileDataClass.h"

#define METERS_PER_MILE 1609.344

@interface MealOnMobileFirstViewController ()
@property (nonatomic) CLLocationCoordinate2D currentCoordinate;
@property (nonatomic) CLLocationCoordinate2D newCoordinate;
@end

@implementation MealOnMobileFirstViewController
@synthesize mapDisplay= _mapDisplay;
@synthesize distanceDisplay= _distanceDisplay;
@synthesize currentCoordinate= _currentCoordinate;
@synthesize newCoordinate= _newCoordinate;
@synthesize addressInput= _addressInput;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Get current location where user is located
    locationManager= [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.distanceFilter = 10;
    locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
    [locationManager startUpdatingLocation];
    [self viewWillAppear:YES];
    //[self.mapDisplay setCenterCoordinate:self.currentCoordinate animated:YES];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *) oldLocation
{
    NSTimeInterval locationAge = -[newLocation.timestamp timeIntervalSinceNow];
    if (locationAge > 5.0) return;
    if (newLocation.horizontalAccuracy < 0) return;
    self.newCoordinate= self.currentCoordinate= newLocation.coordinate;
    [locationManager stopUpdatingLocation];
}

- (IBAction)searchButtomPressed:(UIButton *)sender
{
    NSData *dataReply= [MealOnMobileDataClass dataRequestToServer:@"all":@"getLocationAll"];
    NSDictionary *locationData= [NSJSONSerialization JSONObjectWithData:dataReply options:kNilOptions error:nil];
    
    id key, value;
    for (key in [locationData allKeys])
    {
        value = [locationData objectForKey:key];
        double latitude= [[value objectForKey:@"latitude"] doubleValue];
        double longitude= [[value objectForKey:@"longitude"] doubleValue];
        NSString *title= [value objectForKey:@"InfoName"];
        //NSString *money= [value objectForKey:@"InfoMoney"];
        //NSString *seat= [value objectForKey:@"InfoSeat"];
        NSString *address= [value objectForKey:@"InfoRoad"];
        CLLocationCoordinate2D location;
        location.latitude= latitude;
        location.longitude= longitude;
        MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
        annotation.coordinate = location;
        annotation.title = title;
        annotation.subtitle= address;
        [self.mapDisplay setCenterCoordinate:location animated:YES];
        // Pin a flag to current coordinate
        [self.mapDisplay addAnnotation:annotation];
    }
}

- (IBAction)currentButtomPressed:(UIButton *)sender
{
    [self.mapDisplay setCenterCoordinate:self.currentCoordinate animated:YES];
    self.newCoordinate= self.currentCoordinate;
    self.distanceDisplay.text= 0;
    
    NSMutableArray *beRemoved= [[NSMutableArray alloc] initWithArray:self.mapDisplay.annotations];
    [self.mapDisplay removeAnnotations:beRemoved];
    //[self viewWillAppear:YES];
    
    [MealOnMobileDataClass locationLocator:self.currentCoordinate:[MealOnMobileDataClass checkLocalInfo]];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    MKCoordinateRegion viewRegion= MKCoordinateRegionMakeWithDistance(self.currentCoordinate, 3*METERS_PER_MILE, 3*METERS_PER_MILE);
    [self.mapDisplay setRegion:viewRegion animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
