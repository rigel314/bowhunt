//
//  gameView.m
//  BowHunt
//
//  Created by Cody Creager on 4/10/13.
//  Copyright (c) 2013 CS330. All rights reserved.
//

#import "gameView.h"

#define TIME_INTERVAL .025
#define LEFT 0
#define RIGHT 1

@implementation gameView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
		self.backgroundColor = [UIColor whiteColor];
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
    
	
	// Target
	
	
	// Path
	if (drawPath) {
		[path drawPath:context];
	}
    
}

-(void)timerFired:(NSTimer *)timer
{
    if (!winner) {
        if (drawArrow) {
            [arrow moveHead];
            arrow.timeAlive++;
            if (arrow.head.y > 290 || arrow.head.x > self.frame.size.height || arrow.head.x < 0) {
                drawArrow = false;
            }
        }
        [self setNeedsDisplay];
    }
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
    if (turn == LEFT) {
        player1.angle = atan2((path.end.y-path.start.y),(path.end.x-path.start.x));
    }
    else if (turn == RIGHT) {
        player2.angle = atan2((path.end.y-path.start.y),-(path.end.x-path.start.x));
    }
    angle = atan2((path.end.y-path.start.y),(path.end.x-path.start.x));
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (turn == LEFT) {
        // Start arrow on left side of screen
        arrow.head = CGPointMake(30+.707*player1.length+(20*cos(angle-3.14159)), 290-2*.707*player1.length-.75*player1.length+(20*sin(angle-3.14159)));
        arrow.velocity = CGPointMake((path.start.x-path.end.x)/80, (path.start.y-path.end.y)/80);
        arrow.acceleration = CGPointMake(0, 8.0/10000);
        arrow.timeAlive = 0;
        arrow.angle = atan2((path.end.y-path.start.y),(path.end.x-path.start.x));
        player1.angle = arrow.angle;
    }
    if (turn == RIGHT) {
        // Start arrow on right side of screen
        arrow.head = CGPointMake(430+.707*player1.length+(20*cos(angle-3.14159)), 290-2*.707*player1.length-.75*player1.length+(20*sin(angle-3.14159)));
        arrow.velocity = CGPointMake((path.start.x-path.end.x)/100, (path.start.y-path.end.y)/100);
        arrow.acceleration = CGPointMake(0, 1.0/1000);
        arrow.timeAlive = 0;
        arrow.angle = atan2((path.end.y-path.start.y),(path.end.x-path.start.x));
        player2.angle = atan2((path.end.y-path.start.y),-(path.end.x-path.start.x));
    }
	
	drawPath = false;
	turn = !turn;
	drawArrow = true;
}

-(void)newGame
{
	timer = [NSTimer scheduledTimerWithTimeInterval:TIME_INTERVAL target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
	turn = LEFT;
}

@end
