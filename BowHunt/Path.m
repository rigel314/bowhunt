//
//  Path.m
//  BowHunt
//
//  Created by Cody Creager on 4/22/13.
//  Copyright (c) 2013 CS330. All rights reserved.
//

#import "Path.h"

@implementation Path

-(void)drawPath:(CGContextRef)context
{
	CGContextSetRGBStrokeColor(context, 0, 0, 0, 1);
	CGContextSetLineWidth(context, 1);
	
	CGContextMoveToPoint(context, _start.x, _start.y);
	CGContextAddLineToPoint(context, _end.x , _end.y);
	
	CGContextStrokePath(context);
	
	// draw the text for angle and power
}

@end
