//
//  FlipsideViewController.m
//  BowHunt
//
//  Created by Cody Creager on 4/8/13.
//  Copyright (c) 2013 CS330. All rights reserved.
//

#import "FlipsideViewController.h"
#import "MainViewController.h"
#import "gameView.h"

@interface FlipsideViewController ()

@end

@implementation FlipsideViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		self.contentSizeForViewInPopover = CGSizeMake(320.0, 480.0);
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated
{
	gameView* gv = (gameView*)((MainViewController*)_delegate).view; // Lots of fun type casting.
	hardmode = gv.hardmode;
	speed = gv.acceleration.x*10000;
	
	_stepperWind.value = speed;
	_lblWindSpeed.text = [NSString stringWithFormat:@"%d",speed];
	
	_switchHardMode.on = hardmode;
}

-(void)viewWillDisappear:(BOOL)animated
{
	gameView* gv = (gameView*)((MainViewController*)_delegate).view;
	gv.hardmode = hardmode;
	gv.acceleration = CGPointMake(speed/10000.0, gv.acceleration.y);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
}

- (IBAction)stepperWindChanged:(id)sender {
	speed = (int) _stepperWind.value;
	_lblWindSpeed.text = [NSString stringWithFormat:@"%d",speed];
}

- (void)dealloc {
    [_lblWindSpeed release];
	[_stepperWind release];
	[_switchHardMode release];
	[super dealloc];
}
- (IBAction)switchHardModeToggle:(id)sender {
	hardmode = _switchHardMode.on;
}
@end
