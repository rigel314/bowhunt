//
//  FlipsideViewController.h
//  BowHunt
//
//  Created by Cody Creager on 4/8/13.
//  Copyright (c) 2013 CS330. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FlipsideViewController;

@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end

@interface FlipsideViewController : UIViewController
{
	int speed;
	BOOL hardmode;
}

@property (assign, nonatomic) id <FlipsideViewControllerDelegate> delegate;
@property (retain, nonatomic) IBOutlet UILabel *lblWindSpeed;
@property (retain, nonatomic) IBOutlet UIStepper *stepperWind;
@property (retain, nonatomic) IBOutlet UISwitch *switchHardMode;

- (IBAction)done:(id)sender;
- (IBAction)stepperWindChanged:(id)sender;
- (IBAction)switchHardModeToggle:(id)sender;

@end
