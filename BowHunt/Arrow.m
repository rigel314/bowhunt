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
		
	// draw the arrowhead and feathers
	CGContextMoveToPoint(context, _head.x, _head.y);
	CGContextAddLineToPoint(context, _head.x-ArrLen/3*cos(-_angle+5*3.141592653/6), _head.y+ArrLen/3*sin(-_angle+5*3.141592653/6));
	CGContextMoveToPoint(context, _head.x, _head.y);
	CGContextAddLineToPoint(context, _head.x-ArrLen/3*cos(-_angle-5*3.141692653/6), _head.y+ArrLen/3*sin(-_angle-5*3.141692653/6));
	
	CGPoint end = CGPointMake(_head.x+ArrLen*cos(_angle), _head.y+ArrLen*sin(_angle));
	
	CGContextMoveToPoint(context, end.x, end.y);
	CGContextAddLineToPoint(context, end.x-ArrLen/3*cos(-_angle+5*3.141592653/6), end.y+ArrLen/3*sin(-_angle+5*3.141592653/6));
	CGContextMoveToPoint(context, end.x, end.y);
	CGContextAddLineToPoint(context, end.x-ArrLen/3*cos(-_angle-5*3.141592653/6), end.y+ArrLen/3*sin(-_angle-5*3.141592653/6));
	
	CGContextStrokePath(context);
}

-(void)moveHead
{
	_head.x += _velocity.x;
	_head.y += _velocity.y;
	
	_velocity.x += _timeAlive*_acceleration.x;
	_velocity.y += _timeAlive*_acceleration.y;
	
	_angle = atan2(_velocity.y,_velocity.x)+3.141592653;
}

-(BOOL)arrowDead:(CGRect)frame
{
	BOOL test;
	if (_acceleration.x < 0) {
		test = _head.x < 0;
	}else if (_acceleration.x > 0){
		test = _head.x > frame.size.height;
	}else{
		test = _head.x < 0 || _head.x > frame.size.height;
	}
	return test;
}


@end
