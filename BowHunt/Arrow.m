//
//  Arrow.m
//  BowHunt
//
//  Created by Cody Creager on 4/8/13.
//  Copyright (c) 2013 CS330. All rights reserved.
//

#import "Arrow.h"

#define ArrLen 20

@implementation Arrow

-(void)drawArrow:(CGContextRef)context
{
	CGContextSetRGBStrokeColor(context, 0, 0, 0, 1);
	CGContextSetLineWidth(context, 1);
	
	CGContextMoveToPoint(context, _head.x, _head.y);
	CGContextAddLineToPoint(context, _head.x , _head.y);
	
	CGContextStrokePath(context);
	
	// draw the arrowhead and feathers
}

@end
