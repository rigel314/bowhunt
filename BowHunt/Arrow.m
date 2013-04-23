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
	CGContextAddLineToPoint(context, _head.x+ArrLen*cos(_angle), _head.y+ArrLen*sin(_angle));
	
	CGContextStrokePath(context);
	
	CGContextSetRGBFillColor(context, 1, 0, 0, 1);
	CGContextFillEllipseInRect(context, CGRectMake(_head.x-2, _head.y-2, 4, 4));
	
	// draw the arrowhead and feathers
	
}

-(void)moveHead
{
	_head.x += _velocity.x;
	_head.y += _velocity.y;
	
	_velocity.x += _timeAlive*_acceleration.x;
	_velocity.y += _timeAlive*_acceleration.y;
	
	_angle = atan2(_velocity.y,_velocity.x)+3.141592653;
}

@end
