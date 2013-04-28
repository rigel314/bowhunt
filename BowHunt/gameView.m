//
//  gameView.m
//  BowHunt
//
//  Created by Cody Creager on 4/10/13.
//  Copyright (c) 2013 CS330. All rights reserved.
//

#import "gameView.h"
#import "MainViewController.h"

#define TIME_INTERVAL .025
#define LEFT 0
#define RIGHT 1

@implementation gameView
- (id)initWithFrame:(CGRect)frame MVC:(MainViewController*)controller
{
	self = [super initWithFrame:frame];
	if (self) {
		self.backgroundColor = [UIColor whiteColor];
		
		mvc = controller;
		
		info = [UIButton buttonWithType:UIButtonTypeInfoDark];
		[info retain];
		info.frame = CGRectMake(frame.size.height/2-15, 0, 30, 30);
		[info addTarget:mvc action:@selector(showInfo:) forControlEvents:UIControlEventTouchUpInside];
		[self addSubview:info];
		
		_acceleration = CGPointMake(0, 8.0/10000);
//		acceleration = CGPointMake(0, 0);
		
		_hardmode = false;
		
		player1 = [Player new];
		player1.length = 10;
		player2 = [Player new];
		player2.length = 10;
		
		path = [Path new];
		arrow = [Arrow new];
        winner = 0;
		[self newGame];
    }
    return self;
}

-(void)drawRect:(CGRect)rect
{
	char* str;
	
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	// Arrow (s)?
	if (drawArrow) {
		[arrow drawArrow:context];
	}
	
	// Ground
	CGContextSetRGBStrokeColor(context, 0, 0, 0, 1);
	CGContextSetLineWidth(context, 2);
	CGContextMoveToPoint(context, 0, 290);
	CGContextAddLineToPoint(context, rect.size.width, 290);
	CGContextStrokePath(context);
	
	// Player
	CGContextSetLineWidth(context, 1);
	[player1 drawForContext:context AtGround:290 AtRightFoot:30 Mirror:LEFT];
	[player2 drawForContext:context AtGround:290 AtRightFoot:30 Mirror:RIGHT];
    
	// Text
	if (turn == LEFT)
		str="Player 1";
	else
		str="Player 2";
	
	CGRect bounds = [UIScreen mainScreen].bounds;
	
	CGContextTranslateCTM(context, 0, bounds.size.width);
	CGContextScaleCTM(context, 1, -1);
	CGContextSetRGBFillColor(context, 0, 0, 0, 1);
	CGContextSetRGBStrokeColor(context, 0, 0, 1, 1);
	CGContextSelectFont(context, "Helvetica-Bold", 20.0, kCGEncodingMacRoman);
	CGContextSetCharacterSpacing(context, 1.7);
	CGContextSetTextDrawingMode(context, kCGTextFill);
	
	CGContextShowTextAtPoint(context, bounds.size.height/2-50, bounds.size.width-50, str, 8);
	
	CGContextTranslateCTM(context, 0, bounds.size.width);
	CGContextScaleCTM(context, 1, -1);
	
	// Path
	if (drawPath) {
		[path drawPath:context];
	}
}

-(void)timerFired:(NSTimer *)time
{
    if (!winner) {
        if (drawArrow) {
            [arrow moveHead];
            arrow.timeAlive++;
			if(_hardmode)
				arrow.acceleration = CGPointMake(8.0/1000*cos(arrow.timeAlive/10), 8.0/1000*sin(arrow.timeAlive/10)+3.0/10000); // This is fun!
			
			if ([self withinRect:player1.head Point:arrow.head]) { // Maybe increment kill count
				[self finishedGameWithWinner:RIGHT];
			}
			if ([self withinRect:player2.head Point:arrow.head]) { // Maybe increment kill count
				[self finishedGameWithWinner:LEFT];
			}
			
            if (arrow.head.y > 290 || [arrow arrowDead:self.frame]) { //|| arrow.head.x > self.frame.size.height || arrow.head.x < 0
                drawArrow = false; // Change test to ground || edges that acceleration could make it fall off.
				turn = !turn;
            }
        }
        [self setNeedsDisplay];
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	if (drawArrow) {
		return;
	}
	drawPath = true;
	path.start = [[touches anyObject] locationInView:self];
	path.end = path.start;
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	if (drawArrow) {
		return;
	}
	path.end = [[touches anyObject] locationInView:self];
	
	angle = atan2((path.end.y-path.start.y),(path.end.x-path.start.x));
	
    if (turn == LEFT) {
        player1.angle = angle;
    }
    else if (turn == RIGHT) {
        player2.angle = atan2((path.end.y-path.start.y),-(path.end.x-path.start.x)); // recalculating because of the flipped coordinate system.
    }
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	if (drawArrow) {
		return;
	}
    if (turn == LEFT) {
        // Start arrow on left side of screen
        arrow.head = CGPointMake(30+.707*player1.length+(20*cos(angle-3.14159)), 290-2*.707*player1.length-.75*player1.length+(20*sin(angle-3.14159)));
    }
    else if (turn == RIGHT) {
        // Start arrow on right side of screen
        arrow.head = CGPointMake(435+.707*player1.length+(20*cos(angle-3.14159)), 290-2*.707*player1.length-.75*player1.length+(20*sin(angle-3.14159)));
    }
	arrow.velocity = CGPointMake((path.start.x-path.end.x)/80, (path.start.y-path.end.y)/80);
	arrow.acceleration = _acceleration;
	arrow.timeAlive = 0;
	arrow.angle = angle;

	drawPath = false;
	drawArrow = true;
}

-(void)newGame
{
	timer = [NSTimer scheduledTimerWithTimeInterval:TIME_INTERVAL target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
    turn = LEFT;
    winner = 0;
    [arrow remove];
}

-(void)finishedGameWithWinner:(int) winner
{
    NSString* name;
    if (!winner) {
        name = [NSString stringWithFormat:@"Player 1"];
    }
    else {
        name = [NSString stringWithFormat:@"Player 2"];
    }
    [timer invalidate];
    NSString* winnerString = [NSString stringWithFormat:@"The winner is %@", name];
    
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Game Over!" message:winnerString delegate:self cancelButtonTitle:@"Quit" otherButtonTitles:@"Play Again", nil];
    [alert show];
    [alert release];
}

-(void)alertView:(UIAlertView*)av clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        // first button
        exit(1);
    }
    else if (buttonIndex ==1) {
        [self newGame];
    }
}

-(BOOL)withinRect:(CGRect)rect Point:(CGPoint)point
{ // Did you touche the paddle?
	if((point.x>=rect.origin.x && point.x<=rect.origin.x+rect.size.width) &&
	   (point.y>=rect.origin.y && point.y<=rect.origin.y+rect.size.height))
		return true;
	return false;
}

@end
