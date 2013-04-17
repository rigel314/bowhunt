//
//  gameView.m
//  BowHunt
//
//  Created by Cody Creager on 4/10/13.
//  Copyright (c) 2013 CS330. All rights reserved.
//

#import "gameView.h"

@implementation gameView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
		self.backgroundColor = [UIColor whiteColor];
		player = [Player new];
		player.length = 10;
    }
    return self;
}

-(void)drawRect:(CGRect)rect
{
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	CGContextSetRGBFillColor(context, 1, 0, 0, 1);
	CGContextFillRect(context, CGRectMake(50, 50, 100, 100));
	// Arrow (s)?
	
	
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
	
}

@end
