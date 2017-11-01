//
//  MealOnMobileSecondViewController.m
//  MealOnMobile
//
//  Created by Howard Yao on 12/11/2.
//  Copyright (c) 2012年 Howard Yao. All rights reserved.
//

#import "MealOnMobileSecondViewController.h"

@interface MealOnMobileSecondViewController ()

@end

@implementation MealOnMobileSecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //background
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"Checkin_background.png"] drawInRect:self.view.bounds];
    UIImage *tempimg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:tempimg];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)chechInPressed:(UIButton *)sender
{
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        post = [[SLComposeViewController alloc] init];
        post = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [post setInitialText:nil];
        [self presentViewController:post animated:YES completion:nil];
    }
    
    [post setCompletionHandler: ^(SLComposeViewControllerResult result){
        NSString *output = [[NSString alloc] init];
        NSLog(@"%d",result);
        switch (result) {
            case SLComposeViewControllerResultCancelled:
                output = @"Check In fail";
                break;
            case SLComposeViewControllerResultDone:
                output = @"Check In Success";
                break;
            default:
                break;
        }
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:output delegate:nil cancelButtonTitle:@"Finish" otherButtonTitles:nil];
        [alert show];
    }];

}

@end
