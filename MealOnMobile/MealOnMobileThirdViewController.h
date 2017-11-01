//
//  MealOnMobileThirdViewController.h
//  MealOnMobile
//
//  Created by Howard Yao on 12/11/2.
//  Copyright (c) 2012年 Howard Yao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MealOnMobileThirdViewController : UIViewController <CLLocationManagerDelegate,UIActionSheetDelegate>
{
    CLLocationManager *locationManager;
}

@property (weak, nonatomic) IBOutlet UISegmentedControl *moneyRange;
@property (weak, nonatomic) IBOutlet UISegmentedControl *seatRange;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UISwitch *rice;
@property (weak, nonatomic) IBOutlet UISwitch *noodle;
@property (weak, nonatomic) IBOutlet UISwitch *hotpot;
@property (weak, nonatomic) IBOutlet UISwitch *dumpling;
@property (weak, nonatomic) IBOutlet UITextField *tel;
@property (strong, nonatomic) NSDictionary *locationData;
@end
