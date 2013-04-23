//
//  gameView.m
//  BowHunt
//
//  Created by Cody Creager on 4/10/13.
//  Copyright (c) 2013 CS330. All rights reserved.
//

#import "gameView.h"

#define TIME_INTERVAL .025

@implementation gameView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
		self.backgroundColor = [UIColor whiteColor];
		player = [Player new];
		player.length = 10;
		path = [Path new];
		arrow = [Arrow new];
		[self newGame];
    }
    return self;
}

-(void)drawRect:(CGRect)rect
{
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
	[player drawForContext:context AtGround:290 AtRightFoot:30];
	
	// Target
	
	
	// Path
	if (drawPath) {
		[path drawPath:context];
	}
}

-(void)timerFired:(NSTimer *)timer
{
	if (drawArrow) {
		[arrow moveHead];
		arrow.timeAlive++;
		if (arrow.head.y > 290 || arrow.head.x > self.frame.size.height || arrow.head.x < 0) {
			drawArrow = false;
		}
	}
	[self setNeedsDisplay];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	drawPath = true;
	path.start = [[touches anyObject] locationInView:self];
	path.end = path.start;
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	path.end = [[touches anyObject] locationInView:self];
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	drawPath = false;
	arrow.head = CGPointMake(50, 50);
	arrow.velocity = CGPointMake((path.start.x-path.end.x)/100, (path.start.y-path.end.y)/100);
	arrow.acceleration = CGPointMake(0, 9.8/100);
	arrow.timeAlive = 0;
	arrow.angle = atan2((path.end.y-path.start.y),(path.end.x-path.start.x));
	drawArrow = true;
}

-(void)newGame
{
	timer = [NSTimer scheduledTimerWithTimeInterval:TIME_INTERVAL target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
}

@end
