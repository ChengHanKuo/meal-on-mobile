//
//  MealOnMobileFourthViewController.h
//  MealOnMobile
//
//  Created by Howard Yao on 12/11/15.
//  Copyright (c) 2012年 Howard Yao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MealOnMobileFourthViewController : UIViewController <UIActionSheetDelegate, CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
}
@property (weak, nonatomic) IBOutlet UISwitch *hasClassDisplay;
@property (strong, nonatomic) NSArray *pickerData;
@property (weak, nonatomic) NSString *boolValue;
@property (weak, nonatomic) NSString *timeSelected;
@property (weak, nonatomic) IBOutlet UIPickerView *timeSelectDisplay;
@property (nonatomic) CLLocationCoordinate2D currentCoordinate;

@end
