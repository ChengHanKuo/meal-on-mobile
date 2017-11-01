//
//  MealOnMobileFirstViewController.h
//  MealOnMobile
//
//  Created by Howard Yao on 12/11/2.
//  Copyright (c) 2012年 Howard Yao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MealOnMobileFirstViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate>
{
    CLLocationManager *locationManager;
}
@property (weak, nonatomic) IBOutlet MKMapView *mapDisplay;
@property (weak, nonatomic) IBOutlet UILabel *distanceDisplay;
@property (weak, nonatomic) IBOutlet UITextView *addressInput;

@end
