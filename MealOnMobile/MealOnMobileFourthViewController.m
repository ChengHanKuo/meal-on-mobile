//
//  MealOnMobileFourthViewController.m
//  MealOnMobile
//
//  Created by Howard Yao on 12/11/15.
//  Copyright (c) 2012年 Howard Yao. All rights reserved.
//

#import "MealOnMobileFourthViewController.h"
#import "MealOnMobileDataClass.h"

@interface MealOnMobileFourthViewController ()
@end

@implementation MealOnMobileFourthViewController
@synthesize boolValue= _boolValue;
@synthesize hasClassDisplay= _hasClassDisplay;
@synthesize pickerData= _pickerData;
@synthesize timeSelectDisplay= _timeSelectDisplay;
@synthesize currentCoordinate= _currentCoordinate;

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
    [locationManager startUpdatingLocation];
    NSArray *array= [[NSArray alloc] initWithObjects:@"10分鐘",@"20分鐘",@"30分鐘",@"40分鐘",@"50分鐘",@"60分鐘",nil];
    self.pickerData=array;
    if (self.hasClassDisplay.on)
        self.boolValue= @"true";
    else
        self.boolValue= @"false";
    
    //background
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"question_background.png"] drawInRect:self.view.bounds];
    UIImage *tempimg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:tempimg];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *) oldLocation
{
    self.currentCoordinate= newLocation.coordinate;
}

- (IBAction)hasSwitchAction:(UISwitch *)sender
{
    BOOL setting= sender.on;
    [self.hasClassDisplay setOn:setting animated:YES];
    if (setting)
        self.boolValue= @"true";
    else
        self.boolValue= @"false";
    NSLog(@"%@",self.boolValue);
}

- (IBAction)submitPressed:(id)sender
{
    UIActionSheet *actionSheet= [[UIActionSheet alloc] initWithTitle:@"確定送出?" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"確定" otherButtonTitles:nil];
    [actionSheet showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{    
    if (buttonIndex != [actionSheet cancelButtonIndex])
    {
        NSString *dataType= @"getRanking";
        NSInteger row= [self.timeSelectDisplay selectedRowInComponent:0];
        NSString *selected= [self.pickerData objectAtIndex:row];
        NSDictionary *dataResult= [NSDictionary dictionaryWithObjectsAndKeys:
                                   [NSString stringWithFormat:@"%g",self.currentCoordinate.latitude],@"latitude"
                                   ,[NSString stringWithFormat:@"%g",self.currentCoordinate.longitude],@"longitude"
                                   ,self.boolValue,@"hasClass",selected,@"timeSelect",[MealOnMobileDataClass checkLocalInfo],@"userNo",nil];
        NSLog(@"%g",self.currentCoordinate.longitude);
        NSData *jsonData= [NSJSONSerialization dataWithJSONObject:dataResult options:NSJSONWritingPrettyPrinted error:nil];
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        NSString *result= [[NSString alloc] initWithData:[MealOnMobileDataClass dataRequestToServer:jsonString :dataType] encoding:NSUTF8StringEncoding];
        //NSData *dataReply= [MealOnMobileDataClass dataRequestToServer:jsonString :dataType];
        //NSDictionary *locationData= [NSJSONSerialization JSONObjectWithData:dataReply options:kNilOptions error:nil];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"推薦店家" message:result delegate:nil cancelButtonTitle:@"確定" otherButtonTitles:nil];
        [alert show];
        //NSData *dataReply= [MealOnMobileDataClass dataRequestToServer:jsonString :dataType];
        /*double latitude= [[locationData objectForKey:@"latitude"] doubleValue];
        double longitude= [[locationData objectForKey:@"longitude"] doubleValue];
        CLLocationCoordinate2D location;
        location.latitude= latitude;
        location.longitude= longitude;
        [self performSegueWithIdentifier:@"recommend" sender:self];*/
    }
}

#pragma mark-
#pragma mark picker data source

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

/*-(NSInteger) pickerView:(UIPickerView *)pickerView
 {
 return [self.pickerData count];
 }*/

-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.pickerData count];
}

#pragma mark picker delegate method

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.pickerData objectAtIndex:row];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
